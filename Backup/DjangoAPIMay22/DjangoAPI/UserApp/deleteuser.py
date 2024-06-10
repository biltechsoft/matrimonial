import xlrd
from UserApp.serializers import AdminUserSerializer,TempUserSerializer,MaleUserSerializer,FemaleUserSerializer,MatchingTableSerializer,PostSerializer
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser
from django.shortcuts import render
from django.core.files import File
from UserApp.models import MaleUser,FemaleUser,AdminUser,MatchingTable
from datetime import datetime
from django.db import models
from django.db.models.base import Model
from django.apps import apps

import operator
import os
import logging
from django.core.files.storage import default_storage
import time

def deleteMale(id):
    female=FemaleUser.objects.all()
    #print("Starting")
    '''
    f = open('UserApp/output.txt', 'w')
    testfile = File(f)
    testfile.write('Welcome to this country')
    testfile.close
    f.close
    '''
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    
    f = open("UserApp/output.txt", "a")
    f.write("Started at " + current_time +" ..." + "\n")
    #f.write(str(male))
    #male= AdminUser.objects.all()
	#female=FemaleUser.objects.all()

    #id=85
    f.write("Male User ID to delete: "+str(id)+"\n")
    #deleteMaleUser(id):
    #deleteFromMatchId(id):
    f.write("deleteFromMatchId..... "+"\n")
    selectedFemale=FemaleUser.objects.filter(matchId__icontains=str(id))
    #f.write(str(selectedFemale)+"\n")

    
    #f.write(str(matchIds)+"\n")
    for m in range(0,selectedFemale.count()):
        matchIds = selectedFemale[m].matchId.split(',')
        newMatchId = ''
        matchIndex = -1
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            if  matchIds[n]==str(id):
                matchIndex = n
            #newMatchId = (match==id) ? newMatchId : newMatchId+','+match
        
        newMatchPct = selectedFemale[m].matchPercentage
        if matchIndex > -1:
            matchPcts = selectedFemale[m].matchPercentage.split(',')
            newMatchPct = ''
            
            for p in range(0,len(matchPcts)):
                newMatchPct = newMatchPct if p==matchIndex else (matchPcts[p] if newMatchPct=='' else newMatchPct+','+matchPcts[p])
        
        f.write(selectedFemale[m].fullName+"\n")
        f.write("Prev MatchId: "+selectedFemale[m].matchId+"\n")
        f.write("New MatchId: "+newMatchId+"\n"+str(matchIndex)+"\n"+newMatchPct+"\n")
        
        female.filter(userId = selectedFemale[m].userId).update(matchId=newMatchId,matchPercentage=newMatchPct)
        #time.sleep(0.3)
        #female.filter(userId = selectedFemale[m].userId).update(matchPercentage=newMatchPct)
    
    #deleteFromReqAccepted(id):
    f.write("\n\n\ndeleteFromReqAccepted..... \n")
    selectedFemaleRA=FemaleUser.objects.filter(reqAccepted__icontains=str(id))
    f.write(str(selectedFemaleRA.count())+"\n")
    
    for m in range(0,selectedFemaleRA.count()):
        matchIds = selectedFemaleRA[m].reqAccepted.split(',')
        newMatchId = ''
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            
        
        f.write(selectedFemaleRA[m].fullName+"\n")
        f.write("Prev: "+selectedFemaleRA[m].reqAccepted+"\n")
        f.write("New: "+newMatchId+"\n")
        female.filter(userId = selectedFemaleRA[m].userId).update(reqAccepted=newMatchId)
        #time.sleep(0.3)
        
    #deleteFromReqRejected(id):
    f.write("\n\n\ndeleteFromReqRejected..... \n")
    selectedFemale=FemaleUser.objects.filter(reqRejected__icontains=str(id))
    #f.write(str(selectedFemale)+"\n")
    
    for m in range(0,selectedFemale.count()):
        matchIds = selectedFemale[m].reqRejected.split(',')
        newMatchId = ''
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            

        f.write(selectedFemale[m].fullName+"\n")
        f.write("Prev: "+selectedFemale[m].reqRejected+"\n")
        f.write("New: "+newMatchId+"\n")
        female.filter(userId = selectedFemale[m].userId).update(reqRejected=newMatchId)
        #time.sleep(0.3)
        
    #deleteFromReqSent(id):
    f.write("\n\n\ndeleteFromReqSent..... \n")
    selectedFemaleRS=FemaleUser.objects.filter(reqSent__icontains=str(id))
    #f.write(str(selectedFemale)+"\n")
    
    for m in range(0,selectedFemaleRS.count()):
        matchIds = selectedFemaleRS[m].reqSent.split(',')
        newMatchId = ''
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            
        
        f.write(selectedFemaleRS[m].fullName+"\n")
        f.write("Prev: "+selectedFemaleRS[m].reqSent+"\n")
        f.write("New: "+newMatchId+"\n")
        female.filter(userId = selectedFemaleRS[m].userId).update(reqSent=newMatchId)
        #time.sleep(0.3)
        
    #deleteFromCuMatchId(id):
    f.write("\n\n\ndeleteFromCuMatchId..... \n")
    selectedFemaleCu=FemaleUser.objects.filter(cuMatchId__icontains=str(id))
    f.write(str(selectedFemaleCu.count())+"\n")
    
    for m in range(0,selectedFemaleCu.count()):
        matchIds = selectedFemaleCu[m].cuMatchId.split(',')
        newMatchId = ''
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            
        
        f.write(selectedFemaleCu[m].fullName+"\n")
        f.write("Prev: "+selectedFemaleCu[m].cuMatchId+"\n")
        f.write("New: "+newMatchId+"\n")
        female.filter(userId = selectedFemaleCu[m].userId).update(cuMatchId=newMatchId)
        #time.sleep(1)
        
    #deleteFromLockedId(id):
    f.write("\n\n\ndeleteFromLockedId..... \n")
    selectedFemale=FemaleUser.objects.filter(lockedId=id)
    
    for m in range(0,0):
        newMatchId = None
        
        
        f.write(selectedFemale[m].fullName+"\n")
        f.write("Prev: "+str(selectedFemale[m].lockedId)+"\n")
        f.write("New: "+str(newMatchId)+"\n")
        #female.filter(userId = selectedFemale[m].userId).update(lockedId=newMatchId)
        #time.sleep(0.3)
        
    #deleteFromReqLock(id):
    f.write("\n\n\ndeleteFromReqLock..... \n")
    selectedFemale=FemaleUser.objects.filter(reqLock=id)
    f.write(str(selectedFemale)+"\n")
    
    for m in range(0,0):
        newMatchId = None
            
        
        f.write(selectedFemale[m].fullName+"\n")
        f.write("Prev: "+str(selectedFemale[m].reqLock)+"\n")
        f.write("New: "+str(newMatchId)+"\n")
        #female.filter(userId = selectedFemale[m].userId).update(reqLock=newMatchId)
        #time.sleep(0.3)
    
    f.close()
    return JsonResponse("Hellos",safe=False)
    


def deleteFemale(id):
    male= MaleUser.objects.all()
    female=FemaleUser.objects.all()
    #print("Starting")
    '''
    f = open('UserApp/output.txt', 'w')
    testfile = File(f)
    testfile.write('Welcome to this country')
    testfile.close
    f.close
    '''
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    
    f = open("UserApp/output.txt", "a")
    f.write("Started at " + current_time +" ..." + "\n")
    #f.write(str(male))
    #male= AdminUser.objects.all()
	#male=MaleUser.objects.all()

    #id=85
    f.write("Female User ID to delete: "+str(id)+"\n")
    #deleteMaleUser(id):
    #deleteFromMatchId(id):
    f.write("deleteFromMatchId..... "+"\n")
    selectedMale=MaleUser.objects.filter(matchId__icontains=str(id))
    #f.write(str(selectedMale)+"\n")

    
    #f.write(str(matchIds)+"\n")
    for m in range(0,selectedMale.count()):
        matchIds = selectedMale[m].matchId.split(',')
        newMatchId = ''
        matchIndex = -1
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            if  matchIds[n]==str(id):
                matchIndex = n
            #newMatchId = (match==id) ? newMatchId : newMatchId+','+match
        
        newMatchPct = selectedMale[m].matchPercentage
        if matchIndex > -1:
            matchPcts = selectedMale[m].matchPercentage.split(',')
            newMatchPct = ''
            
            for p in range(0,len(matchPcts)):
                newMatchPct = newMatchPct if p==matchIndex else (matchPcts[p] if newMatchPct=='' else newMatchPct+','+matchPcts[p])
            
        f.write(selectedMale[m].fullName+"\n")
        f.write("Prev MatchId: "+selectedMale[m].matchId+"\n")
        f.write("New MatchId: "+newMatchId+"\n"+str(matchIndex)+"\n"+newMatchPct+"\n")
    
    #deleteFromReqAccepted(id):
    f.write("\n\n\ndeleteFromReqAccepted..... \n")
    selectedMale=MaleUser.objects.filter(reqAccepted__icontains=str(id))
    #f.write(str(selectedMale)+"\n")
    
    for m in range(0,selectedMale.count()):
        matchIds = selectedMale[m].reqAccepted.split(',')
        newMatchId = ''
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            
        f.write(selectedMale[m].fullName+"\n")
        f.write("Prev: "+selectedMale[m].reqAccepted+"\n")
        f.write("New: "+newMatchId+"\n")
        
    #deleteFromReqRejected(id):
    f.write("\n\n\ndeleteFromReqRejected..... \n")
    selectedMale=MaleUser.objects.filter(reqRejected__icontains=str(id))
    #f.write(str(selectedMale)+"\n")
    
    for m in range(0,selectedMale.count()):
        matchIds = selectedMale[m].reqRejected.split(',')
        newMatchId = ''
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            
        f.write(selectedMale[m].fullName+"\n")
        f.write("Prev: "+selectedMale[m].reqRejected+"\n")
        f.write("New: "+newMatchId+"\n")
        
    #deleteFromReqSent(id):
    f.write("\n\n\ndeleteFromReqSent..... \n")
    selectedMale=MaleUser.objects.filter(reqSent__icontains=str(id))
    #f.write(str(selectedMale)+"\n")
    
    for m in range(0,selectedMale.count()):
        matchIds = selectedMale[m].reqSent.split(',')
        newMatchId = ''
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            
        f.write(selectedMale[m].fullName+"\n")
        f.write("Prev: "+selectedMale[m].reqSent+"\n")
        f.write("New: "+newMatchId+"\n")
        
    #deleteFromCuMatchId(id):
    f.write("\n\n\ndeleteFromCuMatchId..... \n")
    selectedMale=MaleUser.objects.filter(cuMatchId__icontains=str(id))
    #f.write(str(selectedMale)+"\n")
    
    for m in range(0,selectedMale.count()):
        matchIds = selectedMale[m].cuMatchId.split(',')
        newMatchId = ''
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            
        f.write(selectedMale[m].fullName+"\n")
        f.write("Prev: "+selectedMale[m].cuMatchId+"\n")
        f.write("New: "+newMatchId+"\n")
        
    #deleteFromLockedId(id):
    f.write("\n\n\ndeleteFromLockedId..... \n")
    selectedMale=MaleUser.objects.filter(lockedId=id)
    
    for m in range(0,selectedMale.count()):
        newMatchId = None
        
        f.write(selectedMale[m].fullName+"\n")
        f.write("Prev: "+str(selectedMale[m].lockedId)+"\n")
        f.write("New: "+str(newMatchId)+"\n")
        
        #male.filter(userId = selectedMale[m].userId).update(lockedId=newMatchId)
    
        
    #deleteFromReqLock(id):
    f.write("\n\n\ndeleteFromReqLock..... \n")
    selectedMale=MaleUser.objects.filter(reqLock=id)
    f.write(str(selectedMale)+"\n")
    
    for m in range(0,selectedMale.count()):
        newMatchId = None
            
        f.write(selectedMale[m].fullName+"\n")
        f.write("Prev: "+str(selectedMale[m].reqLock)+"\n")
        f.write("New: "+str(newMatchId)+"\n")
    
    
    f.close()
    return JsonResponse("Hellos",safe=False)
    
   