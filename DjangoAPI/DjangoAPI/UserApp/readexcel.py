import xlrd
from UserApp.serializers import AdminUserSerializer,TempUserSerializer,MaleUserSerializer,FemaleUserSerializer,MatchingTableSerializer,PostSerializer
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser
from django.shortcuts import render
from django.core.files import File
from UserApp.models import MaleUser,FemaleUser,AdminUser,MatchingTable,MatchMaking
from datetime import datetime
from django.db import models
from django.db.models.base import Model
from django.apps import apps

import operator
import os
import logging
from django.core.files.storage import default_storage

def oldToNewForDb():
    f = open("UserApp/oldToNew.txt", "a")
    male= MaleUser.objects.all()
    female=FemaleUser.objects.all()
    allMaleId = [int(i.userId) for i in male]
    # f.write(str(allMaleId))
    
    
    # for user in female:
    #     # id 
    #     femaleId =user.userId
    #     maleId=[]
    #     percentage=[]
    #     if user.matchId is not None:
    #         maleId = list(user.matchId.split(","))
    #         maleId = [int(i) for i in maleId if i.isdigit()]
    #     if user.matchPercentage is not None:            
    #         percentage = list(user.matchPercentage.split(","))
    #         percentage =[int(i) for i in percentage if i.isdigit()]

    #     status =0
    #     i=0
    #     rangeOfId =min(len(maleId),len(percentage))-1
    #     for mId in maleId:
    #         status =0
    #         if user.reqSent is not None and str(mId) in user.reqSent:
    #             status=2
    #         elif user.reqAccepted is not None and str(mId) in (user.reqAccepted):
    #             status=3
    #         elif user.reqRejected is not None and str(mId) in user.reqRejected:
    #             status=4
    #         elif user.reqLock is not None and str(mId) in user.reqLock:
    #             status=5
    #         elif user.lockedId is not None and str(mId) in user.lockedId:
    #             status=6
            
    #         checkExist = MatchMaking.objects.filter(maleId=mId, femaleId=femaleId )
    #         # f.write("checkExist \n"+str(len(checkExist))+"\n")
    #         if checkExist.exists():
    #             existing_match = checkExist.first()
                
    #             if existing_match.statusReq==0:
    #                 newStatus = status
    #             else:
    #                 newStatus = existing_match.statusReq
    
    #             # Calculate the new percentage
    #             new_percentage = int((percentage[i] + existing_match.percentage) / 2)
                
    #             # Update the existing entry
    #             checkExist.update(percentage=int(new_percentage), statusReq=int(newStatus))
                
    #             # currentUser = MatchMaking.objects.get(id=femaleId)
    #             # f.write("checkExist \n"+str(new_percentage) +"\n"+ str((status))+"\n")
                
    #         else:
    #             male_user = MaleUser.objects.get(userId=mId)
    #             f.write(f'ja paic-> {male_user}')
    #             new_user = MatchMaking(maleId=male_user, femaleId=user, percentage=int(percentage[i]),statusReq=int(status))
    #             new_user.save()
                
    # '''
    # for base male to female code start here 
    
    # '''
    # for user in male:
    #     # id 
    #     maleId =user.userId
    #     femaleId=[]
    #     percentage=[]
    #     if user.matchId is not None:
    #         femaleId = list(user.matchId.split(","))
    #         femaleId = [int(i) for i in femaleId if i.isdigit()]
    #     if user.matchPercentage is not None:            
    #         percentage = list(user.matchPercentage.split(","))
    #         percentage =[int(i) for i in percentage if i.isdigit()]

    #     status =0
    #     i=0
    #     rangeOfId =min(len(femaleId),len(percentage))-1
    #     for mId in femaleId:
    #         status =0
    #         if user.reqSent is not None and str(mId) in user.reqSent:
    #             status=1
    #         elif user.reqAccepted is not None and str(mId) in (user.reqAccepted):
    #             status=3
    #         elif user.reqRejected is not None and str(mId) in user.reqRejected:
    #             status=4
    #         elif user.reqLock is not None and str(mId) in user.reqLock:
    #             status=5
    #         elif user.lockedId is not None and str(mId) in user.lockedId:
    #             status=6
            
    #         checkExist = MatchMaking.objects.filter(maleId=maleId, femaleId=mId )
    #         # f.write("checkExist \n"+str(len(checkExist))+"\n")
    #         if checkExist.exists():
    #             existing_match = checkExist.first()
                
    #             if existing_match.statusReq==0:
    #                 newStatus = status
    #             else:
    #                 newStatus = existing_match.statusReq
    
    #             # Calculate the new percentage
    #             new_percentage = int((percentage[i] + existing_match.percentage) / 2)
                
    #             # Update the existing entry
    #             checkExist.update(percentage=int(new_percentage), statusReq=int(newStatus))
                
    #             # currentUser = MatchMaking.objects.get(id=femaleId)
    #             f.write("checkExist \n"+str(new_percentage) +"\n"+ str((status))+"\n")
    #             f.write("mId: "+str(mId))
                
    #         else:
    #             f.write("mId: "+str(mId))
    #             female_user = FemaleUser.objects.filter(userId=mId)
    #             if female_user.exists():
    #                 current_female_user = FemaleUser.objects.get(userId =mId)
    #                 # f.write(f'ja paic-> {female_user}')
    #                 new_user = MatchMaking(maleId=user, femaleId=current_female_user, percentage=int(percentage[i]),statusReq=int(status))
    #                 new_user.save()            
    #             # f.write("percentage: - \n maleId: "+str(mId) +"\n femaleId: "+str(femaleId)+" \n"+str(checkExist.values()[0]['percentage'])+"\n")
    #         # try:
    #             # male_user = MaleUser.objects.get(userId=mId)
    #             # f.write(f'ja paic-> {male_user}')
    #             # new_user = MatchMaking(maleId=male_user, femaleId=user, percentage=int(percentage[i]),statusReq=int(status))
    #             # new_user.save()
    #         # except MaleUser.DoesNotExist:
    #         #     f.write(f'nai vai nai')
                
    #         # f.write("femaleId:"+str(str(femaleId)+"\n"+"maleid:"+str(mId)+"\n"+"status: "+str(status)+"\n"+"percentage:"+str(percentage[i])+"\n \n"))
    #         # if i==rangeOfId:
    #         #     break
    #         # i+=1
    #             # new_user = FemaleUser(first_name='John', last_name='Doe', email='john.doe@example.com')
    #             # new_user.save()
                   
    return JsonResponse("Hey! it works",safe=False)

def excelimport():
    match=MatchingTable.objects.all()
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
	#female=FemaleUser.objects.all()

    id=85
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
    
    #deleteFromReqAccepted(id):
    f.write("\n\n\ndeleteFromReqAccepted..... \n")
    selectedFemale=FemaleUser.objects.filter(reqAccepted__icontains=str(id))
    #f.write(str(selectedFemale)+"\n")
    
    for m in range(0,selectedFemale.count()):
        matchIds = selectedFemale[m].reqAccepted.split(',')
        newMatchId = ''
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            
        f.write(selectedFemale[m].fullName+"\n")
        f.write("Prev: "+selectedFemale[m].reqAccepted+"\n")
        f.write("New: "+newMatchId+"\n")
        
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
        
    #deleteFromReqSent(id):
    f.write("\n\n\ndeleteFromReqSent..... \n")
    selectedFemale=FemaleUser.objects.filter(reqSent__icontains=str(id))
    #f.write(str(selectedFemale)+"\n")
    
    for m in range(0,selectedFemale.count()):
        matchIds = selectedFemale[m].reqSent.split(',')
        newMatchId = ''
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            
        f.write(selectedFemale[m].fullName+"\n")
        f.write("Prev: "+selectedFemale[m].reqSent+"\n")
        f.write("New: "+newMatchId+"\n")
        
    #deleteFromCuMatchId(id):
    f.write("\n\n\ndeleteFromCuMatchId..... \n")
    selectedFemale=FemaleUser.objects.filter(cuMatchId__icontains=str(id))
    #f.write(str(selectedFemale)+"\n")
    
    for m in range(0,selectedFemale.count()):
        matchIds = selectedFemale[m].cuMatchId.split(',')
        newMatchId = ''
        
        for n in range(0,len(matchIds)):
            newMatchId = newMatchId if matchIds[n]==str(id) else (matchIds[n] if newMatchId=='' else newMatchId+','+matchIds[n])
            
        f.write(selectedFemale[m].fullName+"\n")
        f.write("Prev: "+selectedFemale[m].cuMatchId+"\n")
        f.write("New: "+newMatchId+"\n")
        
    #deleteFromLockedId(id):
    f.write("\n\n\ndeleteFromLockedId..... \n")
    selectedFemale=FemaleUser.objects.filter(lockedId=id)
    
    newMatchId = None
    for m in range(0,selectedFemale.count()):
        newMatchId = None if selectedFemale[m].lockedId==id else selectedFemale[m].lockedId
        
        
        f.write(selectedFemale[m].fullName+"\n")
        f.write("Prev: "+str(selectedFemale[m].lockedId)+"\n")
        f.write("New: "+str(newMatchId)+"\n")
        
        #female.filter(userId = selectedFemale[m].userId).update(lockedId=newMatchId)
    
        
    #deleteFromReqLock(id):
    f.write("\n\n\ndeleteFromReqLock..... \n")
    selectedFemale=FemaleUser.objects.filter(reqLock=id)
    f.write(str(selectedFemale)+"\n")
    
    for m in range(0,selectedFemale.count()):
        newMatchId = None if selectedFemale[m].reqLock==id else selectedFemale[m].reqLock
            
        f.write(selectedFemale[m].fullName+"\n")
        f.write("Prev: "+str(selectedFemale[m].reqLock)+"\n")
        f.write("New: "+str(newMatchId)+"\n")
    
    
    f.close()
    return JsonResponse("Hellos",safe=False)
    
    '''
    loc = ('UserApp/dummy.xls')
    
    # To open Workbook
    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)
     
    # For row 0 and column 0
    #print(sheet.cell_value(1, 1))
    for r in range(3,24):  #range(3,sheet.nrows-1)
    #r=4
        user_data = {'fullName': sheet.cell_value(r, 1),
            'nickName': sheet.cell_value(r, 2) if sheet.cell_value(r, 2) != '' else None,
            'gender': sheet.cell_value(r, 3),
            'address': sheet.cell_value(r, 4),
            'city': sheet.cell_value(r, 5),
            'state': sheet.cell_value(r, 6),
            'zip': sheet.cell_value(r, 7),
            'cellPhone': sheet.cell_value(r, 8),
            'workPhone': sheet.cell_value(r, 9) if sheet.cell_value(r, 9) != '' else None,
            'homePhone': sheet.cell_value(r, 10) if sheet.cell_value(r, 10) != '' else None,
            'email': sheet.cell_value(r, 11),
            'personalWebsite': sheet.cell_value(r, 12) if sheet.cell_value(r, 12) != '' else None,
            'birthYear' : sheet.cell_value(r, 14),
            'age': sheet.cell_value(r, 13),
            'height': sheet.cell_value(r, 15),
            'weight': sheet.cell_value(r, 16),
            'maritalStatus': sheet.cell_value(r, 19) if sheet.cell_value(r, 19) != '' else None,
            'children' : sheet.cell_value(r, 20),
            'highestEducation': sheet.cell_value(r, 33),
            'employed' : sheet.cell_value(r, 34),
            'income': sheet.cell_value(r, 37) if sheet.cell_value(r, 37) != '' else None,
            'immigrationStatus': sheet.cell_value(r, 38) if sheet.cell_value(r, 38) != '' else None,
            'religiousPractice': sheet.cell_value(r, 48),
            'beard': sheet.cell_value(r, 51) if sheet.cell_value(r, 51) != '' else None,
            'wear': sheet.cell_value(r, 52) if sheet.cell_value(r, 52) != '' else None,
            'smoker': sheet.cell_value(r, 53) if sheet.cell_value(r, 53) != '' else None,
            'preReligious': sheet.cell_value(r, 54) if sheet.cell_value(r, 54) != '' else None,
            'preWear': sheet.cell_value(r, 56) if sheet.cell_value(r, 56) != '' else None,
            'preBeard': sheet.cell_value(r, 57) if sheet.cell_value(r, 57) != '' else None,
            'preSmoking': sheet.cell_value(r, 58) if sheet.cell_value(r, 58) != '' else None,
            'preEthnicSpecific': sheet.cell_value(r, 59) if sheet.cell_value(r, 59) != '' else None,
            'preImmigrationStatus': sheet.cell_value(r, 60) if sheet.cell_value(r, 60) != '' else None,
            'preMaritalStatus': sheet.cell_value(r, 61) if sheet.cell_value(r, 61) != '' else None,
            'preChildren': sheet.cell_value(r, 62) if sheet.cell_value(r, 62) != '' else None,
            'preEducation':sheet.cell_value(r, 63) if sheet.cell_value(r, 63) != '' else None,
            'preEmployment':sheet.cell_value(r, 64) if sheet.cell_value(r, 64) != '' else None,
            'preIncome':sheet.cell_value(r, 65) if sheet.cell_value(r, 65) != '' else None,
            'preAgeGap':sheet.cell_value(r, 66) if sheet.cell_value(r, 66) != '' else None,
            'userPass': 'VFZSSmVrNUJQVDA9',
            'matchShowLimit': 5,
            'status': 'Active'
        }

        if(user_data['gender'] == 'Male'):
            maleuser_serializer=MaleUserSerializer(data=user_data)
            if maleuser_serializer.is_valid():
                #maleuser_serializer.save()
                #return JsonResponse("Added Successfully",safe=False)
            else:
                return JsonResponse("Failed to AddM",safe=False)
        else:
            femaleuser_serializer=FemaleUserSerializer(data=user_data)
            if femaleuser_serializer.is_valid():
                #femaleuser_serializer.save()
                #return JsonResponse("Added Successfully",safe=False)
            else:
                return JsonResponse("Failed to AddF",safe=False)
    return JsonResponse("Added Successfully",safe=False)
    '''
    
    


    #birthdate = sheet.cell_value(r, 14)
    #if '-' in birthdate:
      #  bd = birthdate.split('-')
       # birthdate = bd[2]+'-'+bd[1]+'-'+bd[0]
    #else if '/' in birthdate:
      #  bd = birthdate.split('/')
      #  birthdate = bd[2]+'-'+bd[1]+'-'+bd[0]
