from django.db import models
from django.db.models.base import Model
from django.apps import apps
from UserApp.models import MaleUser,FemaleUser,MatchingTable,MatchMaking
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser
import numpy as np
from UserApp.serializers import AdminUserSerializer,TempUserSerializer,MaleUserSerializer,FemaleUserSerializer,MatchingTableSerializer,PostSerializer
from UserApp.email import send_email
import operator
import os
import logging

def calculate_element_stats(matrix1, matrix2):
    combined_averages = []
    combined_variances = []

    for row1, row2 in zip(matrix1, matrix2):
        avg_row = [(val1 + val2) / 2 for val1, val2 in zip(row1, row2)]
        var_row = [np.var([val1, val2]) for val1, val2 in zip(row1, row2)]
        combined_averages.append(avg_row)
        combined_variances.append(var_row)
    return combined_averages, combined_variances

def subtract_matrices(matrix1, matrix2):
    # Check if dimensions of both matrices are the same
    if len(matrix1) != len(matrix2) or len(matrix1[0]) != len(matrix2[0]):
        raise ValueError("Matrices must have the same dimensions")
    
    # Initialize the result matrix with the same dimensions
    result_matrix = [[0] * len(matrix1[0]) for _ in range(len(matrix1))]
    
    # Perform element-wise subtraction
    for i in range(len(matrix1)):
        for j in range(len(matrix1[0])):
            result_matrix[i][j] = (matrix1[i][j] - 0.5*matrix2[i][j])
            result_matrix[i][j]=round(result_matrix[i][j],2)
    
    return result_matrix
def avg_matrices(matrix1, matrix2):
    # Check if dimensions of both matrices are the same
    if len(matrix1) != len(matrix2) or len(matrix1[0]) != len(matrix2[0]):
        raise ValueError("Matrices must have the same dimensions")
    
    # Initialize the result matrix with the same dimensions
    result_matrix = [[0] * len(matrix1[0]) for _ in range(len(matrix1))]
    
    # Perform element-wise subtraction
    for i in range(len(matrix1)):
        for j in range(len(matrix1[0])):
            result_matrix[i][j] = (matrix1[i][j] +matrix2[i][j])/2
            result_matrix[i][j]=round(result_matrix[i][j],2)
    
    return result_matrix
def flatten(matrix):
	return [item for sublist in matrix for item in sublist]

def normalize_row(row):
    min_val = min(row)
    max_val = max(row)
    range_val = max_val - min_val
    
    if range_val == 0:  # To avoid division by zero
        return [0 for _ in row]
    
    return [(val - min_val) / range_val for val in row]

def normalize_matrix_by_row(matrix):
    normalized_matrix = [normalize_row(row) for row in matrix]
    return normalized_matrix

def combine_scores(averages, variances, weight_average=1, weight_variance=1):
	combined_scores = [weight_average * avg - weight_variance * var for avg, var in zip(averages, variances)]
	return combined_scores

def populate():
	f = open("UserApp/oldToNew.txt", "a")
    	
	male= MaleUser.objects.filter(status='Active')
	female=FemaleUser.objects.filter(status='Active')
 
	maleMatrix = [[0 for _ in range(len(female))] for _ in range(len(male))]
	# f.write(str(len(maleMatrix)) +"X "+ str(len(maleMatrix[0])))
	
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
	
	# f.write(str(male.count())+" "+str(female.count()))
	# female
	idPair =[[0 for _ in range(len(female))] for _ in range(len(male))]
	for m in range(0,male.count()):
		
		for n in range(0,female.count()):
			
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
			maleMatrix[m][n] =int(point*100/malepoint)
			# x[key]=x.get(key,int(100*point/malepoint))
			# x = dict(sorted(x.items(), key=operator.itemgetter(1),reverse=True))
			# for key in list(x)[10:]:
			# 	del x[key]
	# f.write(str(maleMatrix)+"\n" + "male_00:"+str(male[0].userId))
	# f.write(" \n female_00:"+str(female[0].userId))
	''' it is for finding max value
	'''
	# mx =0
	# for a in maleMatrix:
	# 	for b in a:
	# 		mx =max(b,mx)
			

	# f.write(str(mx) +"\n")
  
			
	# 		#file=open(os.path.join('files/male', "%s.txt" % male[m].userId), 'w+')
	# 		#file.write(str(x))
	# 		#file.close()
			
		        
			
	# 		mId = ""
	# 		mPercentage = ""
	# 		newMatch = False
	# 		cumId = male[m].cuMatchId
	# 		if cumId == None:
	# 			cumId = ''	
	# 		for item in x:
	# 		        #mytmp = str(item) + ','
	# 		        #if cumId!=None:
	# 		        	#if cumId.find(str(item) + ',')== -1:
			        
	# 			mId+= str(item) + ','
	# 			if (str(item)+',' not in cumId):
	# 				cumId += str(item) + ','
	# 				newMatch = True
	# 			mPercentage+= str(x[item]) + ','
	# 		x = {}
	# 		# male.filter(userId = male[m].userId).update(matchId = mId)
	# 		# male.filter(userId = male[m].userId).update(matchPercentage = mPercentage)
	# 		# male.filter(userId = male[m].userId).update(cuMatchId = cumId)
			
			
	# 			# bla bla bla
	# 			# bla
	# 		if newMatch:	
	# 			obj = {
	#     				"subject":"New Match Found",
	#     				"message":"Find your soulmate through MUNA matrimonial. We found new profile that matches you. Click below to view: munamatrimonial.com/#/user-profile/1/"+str(male[m].userId),
	#     				"toEmail":[male[m].email]
	#     				#"toEmail": ["marufbuet09@gmail.com"]
	# 				}
	# 			send_email(obj)	

	femaleMatrixTR  = [[0 for _ in range(len(male))] for _ in range(len(female))]



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
					femaleMatrixTR[m][n]=int(100*point/femalepoint)
	# f.write(str(femaleMatrix) +"\n")
	femaleMatrix = list(map(list, zip(*femaleMatrixTR)))
	#transposed matrix
	# f.write("\n transposed matrix \n"+str(femaleMatrix) +"\n")

	# Calculate element-wise stats for maleMatrix and femaleMatrix
	combined_averages, combined_variances = calculate_element_stats(maleMatrix, femaleMatrix)
	# f.write("male sorted matrix \n"+ str(maleMatrix)+"\n")
	# f.write("female sorted matrix \n"+ str(femaleMatrix)+"\n")
	# f.write("combined_averages \n"+str(combined_averages)+"\n")
	# f.write("combined_variances \n"+str(combined_variances)+"\n")
	# Flatten the matrices to work with 1D arrays for normalization and sorting
	# flattened_averages = flatten(combined_averages)
	# flattened_variances = flatten(combined_variances)
	tr_combined_averages= list(map(list, zip(*combined_averages)))
	tr_combined_variances= list(map(list, zip(*combined_variances)))
	normalized_averages = normalize_matrix_by_row(combined_averages)
	normalized_variances = normalize_matrix_by_row(combined_variances)
	tr_normalized_averages = normalize_matrix_by_row(tr_combined_averages)
	tr_normalized_variances = normalize_matrix_by_row(tr_combined_variances)
	normalized_averages_col = list(map(list, zip(*tr_normalized_averages)))
	normalized_variances_col = list(map(list, zip(*tr_normalized_variances)))
	
	average_variances_row =subtract_matrices(normalized_averages,normalized_variances)
	average_variances_col =subtract_matrices(normalized_averages_col,normalized_variances_col)
	avg_matricesOfRowCol =avg_matrices(average_variances_row,average_variances_col)
	# f.write("average_variances_row \n"+str(average_variances_row)+"\n")
	f.write("avg_matricesOfRowCol \n"+str(avg_matricesOfRowCol)+"\n")

	# Calculate combined scores
	# combined_scores = combine_scores(normalized_averages, normalized_variances)
	# withThreDigit =[round(a,2) for a in combined_scores]
	# f.write("combined_scores = \n"+str(combined_scores))
	# Reconstruct the matrix indices
	# indices = [(i, j) for i in range(len(maleMatrix)) for j in range(len(maleMatrix[0]))]


	# Sort indices based on combined scores
	# sorted_indices = sorted(indices, key=lambda idx: combined_scores[indices.index(idx)], reverse=True)
	'''
	here we get the indices which are matching with others in desc order.
 
 	'''
 
	
 	# print(f'sorted_indices {sorted_indices}')
	# print(f'sorted_indices {len(sorted_indices)}')
	# f.write("sorted_indices:_-\n"+str(sorted_indices))
	# Create sorted matrices based on combined scores
	# sorted_maleMatrix = [[0] * len(maleMatrix[0]) for _ in range(len(maleMatrix))]
	# sorted_femaleMatrix = [[0] * len(femaleMatrix[0]) for _ in range(len(femaleMatrix))]

	# for rank, (i, j) in enumerate(sorted_indices):
	# 	sorted_maleMatrix[rank // len(maleMatrix[0])][rank % len(maleMatrix[0])] = maleMatrix[i][j]
	# 	sorted_femaleMatrix[rank // len(femaleMatrix[0])][rank % len(femaleMatrix[0])] = femaleMatrix[i][j]
	# flatten_sorted_maleMatrix =flatten(sorted_maleMatrix)
	# flatten_sorted_femaleMatrix =flatten(sorted_femaleMatrix)
	
	# for male_base
	# indexOfMale=0
	# for s_index in sorted_indices:
	# 	maleId = male[s_index[0]].userId
	# 	femaleId =female[s_index[1]].userId

	# 	percentage =flatten_sorted_maleMatrix[indexOfMale]
		
	# 	if indexOfMale==10:
	# 		break 
	# 	male_user = MaleUser.objects.get(userId=maleId)
	# 	female_user = FemaleUser.objects.get(userId=femaleId)
	# 	# new_user = MatchMaking(maleId=male_user, femaleId=female_user, percentage=percentage)
	# 	# new_user.save()
	# 	indexOfMale+=1
		# f.write("\n maleId: "+str(maleId)+" \n  femalId: "+str(femaleId)+" \n perce: "+str(percentage)+ "\n")
	
	# f.write("Sorted Male Matrix:\n")
	# for row in sorted_maleMatrix:
	# 	print(row)
	# 	f.write("\n"+str(row))
	''' for printing matrixs
 	'''
	# f.write("\nSorted Female Matrix: \n")
	# for row in sorted_femaleMatrix:
		# f.write("\n"+str(row))

		
	''' my avg finding code 
 	'''
	# avg =[[0 for _ in range(len(transposed[0]))] for _ in range(len(transposed))]
 
	# for j in range(len(maleMatrix)) :
	# 	for i in range(0,len(maleMatrix[0])):
	# 		avg[j][i] =int((transposed[j][i]+maleMatrix[j][i])/2)
		
	# f.write("\n Average matrix \n"+str(avg) +"\n")
			# for key in list(x)[10:]:
			# 	del x[key]
			
	# 		#file=open(os.path.join('files/other', "%s.txt" % female[m].userId), 'w+')
	# 		#file.write(str(x))
	# 		#file.close()
			
	# 		mId = ""
	# 		mPercentage = ""
	# 		newMatch = False
	# 		cumId = female[m].cuMatchId
	# 		if cumId == None:
	# 			cumId = ''	
	# 		for item in x:
	# 		        #mytmp = str(item) + ','
	# 		        #if cumId!=None:
	# 		        	#if cumId.find(str(item) + ',')== -1:
			        
	# 			mId+= str(item) + ','
	# 			if (str(item)+',' not in cumId):
	# 				cumId += str(item) + ','
	# 				newMatch = True
	# 			mPercentage+= str(x[item]) + ','
	# 		x = {}
	# 		female.filter(userId = female[m].userId).update(matchId = mId)
	# 		female.filter(userId = female[m].userId).update(matchPercentage = mPercentage)
	# 		female.filter(userId = female[m].userId).update(cuMatchId = cumId)
			
	# 		if newMatch:	
	# 			obj = {
	#     				"subject":"New Match Found",
	#     				"message":"Find your soulmate through MUNA matrimonial. We found new profile that matches you. Click below to view: munamatrimonial.com/#/user-profile/2/"+str(female[m].userId),
	#     				"toEmail":[female[m].email]
	#     				#"toEmail": ["marufbuet09@gmail.com"]
	# 				}
	# 			send_email(obj)
	"""		
	obj = {
	    "subject":"New Match Found",
	    "message":"Find your soulmate through MUNA matrimonial. We found new profile that matches you. Click below to view: munamatrimonial.com/#/user-profile .",
	    "toEmail":["marufbuet09@gmail.com"]
	}
	send_email(obj)	
	"""
			
	return JsonResponse("Matching Done Successfully",safe=False)


