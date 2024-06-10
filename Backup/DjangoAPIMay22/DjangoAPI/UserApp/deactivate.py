from django.db import models
from django.db.models.base import Model
from django.apps import apps
from UserApp.models import MaleUser,FemaleUser,MatchingTable
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser

from UserApp.serializers import AdminUserSerializer,TempUserSerializer,MaleUserSerializer,FemaleUserSerializer,MatchingTableSerializer,PostSerializer
from UserApp.email import send_email
import operator
import os





def deactivate(user):

	
	male= MaleUser.objects.all()
	female=FemaleUser.objects.all()
	match=MatchingTable.objects.all()

	x = dict()

	point=0
	malepoint=0
	femalepoint=0

	#Sum up total point for male & female
	for p in range(0,match.count()):
		if match[p].malePoint!=None:
			malepoint= malepoint + match[p].malePoint
		if match[p].femalePoint!=None:
			femalepoint= femalepoint + match[p].femalePoint



	for m in range(0,male.count()):
	    reqs = male[m].reqSent.split(",")
	    newreqs = reqs
		if reqs.count(str(user.userId)) > 0:
		    if reqs.length == 1:
		        newreqs = None
		    else:
		        
			for n in range(0,female.count()):
				if female[n].status=="Active":
					point = 0
					if male[m].preReligious!= None and male[m].preReligious== female[n].religiousPractice:
						point = point + match.filter(matchingIndicator= 'religiousPractice')[0].malePoint
					if male[m].preWear!= None and male[m].preWear== female[n].wear:
						point = point + match.filter(matchingIndicator= 'wifeWearing')[0].malePoint
					if male[m].preSmoking!= None and male[m].preSmoking== female[n].smoker:
						point = point + match.filter(matchingIndicator= 'smoking')[0].malePoint
					if male[m].preImmigrationStatus!= None and male[m].preImmigrationStatus== female[n].immigrationStatus:
						point = point + match.filter(matchingIndicator= 'immigrationStatus')[0].malePoint
					if male[m].preMaritalStatus!= None and male[m].preMaritalStatus== female[n].maritalStatus:
						point = point + match.filter(matchingIndicator= 'maritalStatus')[0].malePoint
					if male[m].preChildren!= None and male[m].preChildren== female[n].children:
						point = point + match.filter(matchingIndicator= 'children')[0].malePoint
					if male[m].preEducation!= None and male[m].preEducation== female[n].highestEducation:
						point = point + match.filter(matchingIndicator= 'educationLevel')[0].malePoint
					if male[m].preEmployment!= None and male[m].preEmployment== female[n].employed:
						point = point + match.filter(matchingIndicator= 'employement')[0].malePoint
					if male[m].preIncome!= None and female[n].income!= None and male[m].preIncome <= female[n].income:
						point = point + match.filter(matchingIndicator= 'minimumIncome')[0].malePoint
					if male[m].preAgeGap!= None and male[m].age!= None and female[n].age!= None and male[m].preAgeGap>= abs(male[m].age-female[n].age):
						point = point + match.filter(matchingIndicator= 'ageGap')[0].malePoint
					key=female[n].userId
					x[key]=x.get(key,int(100*point/malepoint))
				
			x = dict(sorted(x.items(), key=operator.itemgetter(1),reverse=True))

			for key in list(x)[10:]:
				del x[key]
			
			#file=open(os.path.join('files/male', "%s.txt" % male[m].userId), 'w+')
			#file.write(str(x))
			#file.close()
			
		        
			
			mId = ""
			mPercentage = ""
			newMatch = False
			cumId = male[m].cuMatchId
			if cumId == None:
				cumId = ''	
			for item in x:
			        #mytmp = str(item) + ','
			        #if cumId!=None:
			        	#if cumId.find(str(item) + ',')== -1:
			        
				mId+= str(item) + ','
				if (str(item)+',' not in cumId):
					cumId += str(item) + ','
					newMatch = True
				mPercentage+= str(x[item]) + ','
			x = {}
			male.filter(userId = male[m].userId).update(matchId = mId)
			male.filter(userId = male[m].userId).update(matchPercentage = mPercentage)
			male.filter(userId = male[m].userId).update(cuMatchId = cumId)
			
			
				# bla bla bla
				# bla
			if newMatch:	
				obj = {
	    				"subject":"New Match Found",
	    				"message":"Find your soulmate through MUNA matrimonial. We found new profile that matches you. Click below to view: munamatrimonial.com/#/user-profile/1/"+str(male[m].userId),
	    				"toEmail":[male[m].email]
	    				#"toEmail": ["marufbuet09@gmail.com"]
					}
				send_email(obj)	

	



	for m in range(0,female.count()):
		if female[m].status=="Active":
			for n in range(0,male.count()):
				if male[n].status=="Active":
					point = 0
					if female[m].preReligious!= None and female[m].preReligious== male[n].religiousPractice:
						point = point + match.filter(matchingIndicator= 'religiousPractice')[0].femalePoint
					if female[m].preBeard!= None and female[m].preBeard == male[n].beard:
						point = point + match.filter(matchingIndicator= 'beard')[0].femalePoint
					if female[m].preSmoking!= None and female[m].preSmoking== male[n].smoker:
						point = point + match.filter(matchingIndicator= 'smoking')[0].femalePoint
					if female[m].preImmigrationStatus!= None and female[m].preImmigrationStatus== male[n].immigrationStatus:
						point = point + match.filter(matchingIndicator= 'immigrationStatus')[0].femalePoint
					if female[m].preMaritalStatus!= None and female[m].preMaritalStatus== male[n].maritalStatus:
						point = point + match.filter(matchingIndicator= 'maritalStatus')[0].femalePoint
					if female[m].preChildren!= None and female[m].preChildren== male[n].children:
						point = point + match.filter(matchingIndicator= 'children')[0].femalePoint
					if female[m].preEducation!= None and female[m].preEducation== male[n].highestEducation:
						point = point + match.filter(matchingIndicator= 'educationLevel')[0].femalePoint
					if female[m].preEmployment!= None and female[m].preEmployment== male[n].employed:
						point = point + match.filter(matchingIndicator= 'employement')[0].femalePoint
					if female[m].preIncome!= None and male[n].income!= None and female[m].preIncome <= male[n].income:
						point = point + match.filter(matchingIndicator= 'minimumIncome')[0].femalePoint
					if female[m].preAgeGap!= None and female[m].age!= None and male[n].age!= None and female[m].preAgeGap>= abs(male[n].age-female[m].age):
						point = point + match.filter(matchingIndicator= 'ageGap')[0].femalePoint
					key=male[n].userId
					x[key]=x.get(key,int(100*point/femalepoint))
				
			x = dict(sorted(x.items(), key=operator.itemgetter(1),reverse=True))

			for key in list(x)[10:]:
				del x[key]
			
			#file=open(os.path.join('files/other', "%s.txt" % female[m].userId), 'w+')
			#file.write(str(x))
			#file.close()
			
			mId = ""
			mPercentage = ""
			newMatch = False
			cumId = female[m].cuMatchId
			if cumId == None:
				cumId = ''	
			for item in x:
			        #mytmp = str(item) + ','
			        #if cumId!=None:
			        	#if cumId.find(str(item) + ',')== -1:
			        
				mId+= str(item) + ','
				if (str(item)+',' not in cumId):
					cumId += str(item) + ','
					newMatch = True
				mPercentage+= str(x[item]) + ','
			x = {}
			female.filter(userId = female[m].userId).update(matchId = mId)
			female.filter(userId = female[m].userId).update(matchPercentage = mPercentage)
			female.filter(userId = female[m].userId).update(cuMatchId = cumId)
			
			if newMatch:	
				obj = {
	    				"subject":"New Match Found",
	    				"message":"Find your soulmate through MUNA matrimonial. We found new profile that matches you. Click below to view: munamatrimonial.com/#/user-profile/2/"+str(female[m].userId),
	    				"toEmail":[female[m].email]
	    				#"toEmail": ["marufbuet09@gmail.com"]
					}
				send_email(obj)
	"""		
	obj = {
	    "subject":"New Match Found",
	    "message":"Find your soulmate through MUNA matrimonial. We found new profile that matches you. Click below to view: munamatrimonial.com/#/user-profile .",
	    "toEmail":["marufbuet09@gmail.com"]
	}
	send_email(obj)	
	"""
			
	return JsonResponse("Matching Done Successfully",safe=False)

