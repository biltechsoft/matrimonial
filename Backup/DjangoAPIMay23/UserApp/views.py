from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse

from UserApp.models import AdminUser,AdminLog,Message,TempUser,MaleUser,FemaleUser,MatchingTable,Post,MatchMaking
from UserApp.serializers import AdminUserSerializer,AdminLogSerializer,MessageSerializer,TempUserSerializer,MaleUserSerializer,FemaleUserSerializer,MatchingTableSerializer,PostSerializer,MatchMakingSerializer

from django.core.files.storage import default_storage


import smtplib
from rest_framework.decorators import api_view
from rest_framework.decorators import permission_classes
from rest_framework.permissions import IsAuthenticated
from UserApp.email import send_email
from UserApp.readexcel import excelimport,oldToNewForDb
from UserApp.matching import populate
from UserApp.testmail import testmail
from UserApp.deleteuser import deleteMale, deleteFemale

@csrf_exempt
def make_matching(request):
    if request.method == "GET":
        return populate()
@csrf_exempt
def make_testmail(request):
    if request.method == "GET":
        return testmail()

@api_view(["POST"])
def email_view(request):
    if request.method == "POST":
        return send_email(request.data)
        
@csrf_exempt
def fromOldDataBaseToNew(request):
    if request.method == "GET":
        return oldToNewForDb()
        


        #return JsonResponse(req,safe=False)

        #maleuser_data=JSONParser().parse(req)
        #maleuser_serializer=MaleUserSerializer(data=maleuser_data)
        #if maleuser_serializer.is_valid():
         #   maleuser_serializer.save()
         #   return JsonResponse("Added Successfully",safe=False)
        #return JsonResponse("Failed to Add",safe=False)

@csrf_exempt
def AdminUserApi(request,id=0):
    if request.method=='GET':
        if id==0:
            adminuser_id = AdminUser.objects.all()
            adminuser_serializer=AdminUserSerializer(adminuser_id,many=True)
            return JsonResponse(adminuser_serializer.data,safe=False)
        else:
            adminuser_id=AdminUser.objects.get(adminId=id)
            adminuser_serializer=AdminUserSerializer(adminuser_id)
            return JsonResponse(adminuser_serializer.data,safe=False)
    elif request.method=='POST':
        adminuser_data=JSONParser().parse(request)
        adminuser_serializer=AdminUserSerializer(data=adminuser_data)
        if adminuser_serializer.is_valid():
            adminuser_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        adminuser_data=JSONParser().parse(request)
        adminuser_id=AdminUser.objects.get(adminId=adminuser_data['adminId'])
        adminuser_serializer=AdminUserSerializer(adminuser_id,data=adminuser_data)
        if adminuser_serializer.is_valid():
            adminuser_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        adminuser_id=AdminUser.objects.get(adminId=id)
        adminuser_id.delete()
        return JsonResponse("Deleted Successfully",safe=False)
        
@csrf_exempt
def AdminLogApi(request,id=0):
    if request.method=='GET':
        if id==0:
            log_id = AdminLog.objects.all()
            log_serializer=AdminLogSerializer(log_id,many=True)
            return JsonResponse(log_serializer.data,safe=False)
        else:
            log_id=AdminLog.objects.get(logId=id)
            log_serializer=AdminLogSerializer(log_id)
            return JsonResponse(log_serializer.data,safe=False)
    elif request.method=='POST':
        log_data=JSONParser().parse(request)
        log_serializer=AdminLogSerializer(data=log_data)
        if log_serializer.is_valid():
            log_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        log_data=JSONParser().parse(request)
        log_id=AdminLog.objects.get(logId=log_data['logId'])
        log_serializer=AdminLogSerializer(log_id,data=log_data)
        if log_serializer.is_valid():
            log_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        log_id=AdminLog.objects.get(logId=id)
        log_id.delete()
        return JsonResponse("Deleted Successfully",safe=False)
        
@csrf_exempt
def MessageApi(request,id=0):
    if request.method=='GET':
        if id==0:
            message_id = Message.objects.all()
            message_serializer=MessageSerializer(message_id,many=True)
            return JsonResponse(message_serializer.data,safe=False)
        else:
            message_id=Message.objects.get(messageId=id)
            message_serializer=MessageSerializer(message_id)
            return JsonResponse(message_serializer.data,safe=False)
    elif request.method=='POST':
        message_data=JSONParser().parse(request)
        message_serializer=MessageSerializer(data=message_data)
        if message_serializer.is_valid():
            message_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        message_data=JSONParser().parse(request)
        message_id=Message.objects.get(messageId=message_data['messageId'])
        message_serializer=MessageSerializer(message_id,data=message_data)
        if message_serializer.is_valid():
            message_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        message_id=Message.objects.get(messageId=id)
        message_id.delete()
        return JsonResponse("Deleted Successfully",safe=False)

@csrf_exempt
def TempUserApi(request,id=0):
    if request.method=='GET':
        if id==0:
            tempuser_id = TempUser.objects.all()
            tempuser_serializer=TempUserSerializer(tempuser_id,many=True)
            return JsonResponse(tempuser_serializer.data,safe=False)
        else:
            tempuser_id=TempUser.objects.get(tempId=id)
            tempuser_serializer=TempUserSerializer(tempuser_id)
            return JsonResponse(tempuser_serializer.data,safe=False)
    elif request.method=='POST':
        tempuser_data=JSONParser().parse(request)
        tempuser_serializer=TempUserSerializer(data=tempuser_data)
        if tempuser_serializer.is_valid():
            tempuser_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        tempuser_data=JSONParser().parse(request)
        tempuser_id=TempUser.objects.get(tempId=tempuser_data['tempId'])
        tempuser_serializer=TempUserSerializer(tempuser_id,data=tempuser_data)
        if tempuser_serializer.is_valid():
            tempuser_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        tempuser_id=TempUser.objects.get(tempId=id)
        tempuser_id.delete()
        return JsonResponse("Deleted Successfully",safe=False)


@csrf_exempt
def MaleUserApi(request,id=0):
    if request.method=='GET':
        if id==0:
            maleuser_id = MaleUser.objects.all()
            maleuser_serializer=MaleUserSerializer(maleuser_id,many=True)
            return JsonResponse(maleuser_serializer.data,safe=False)
        else:
            maleuser_id=MaleUser.objects.get(userId=id)
            maleuser_serializer=MaleUserSerializer(maleuser_id)
            return JsonResponse(maleuser_serializer.data,safe=False)
    elif request.method=='POST':
        maleuser_data=JSONParser().parse(request)
        maleuser_serializer=MaleUserSerializer(data=maleuser_data)
        if maleuser_serializer.is_valid():
            maleuser_serializer.save()
            #pkid = maleuser_serializer.userId
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        maleuser_data=JSONParser().parse(request)
        maleuser_id=MaleUser.objects.get(userId=maleuser_data['userId'])
        maleuser_serializer=MaleUserSerializer(maleuser_id,data=maleuser_data)
        if maleuser_serializer.is_valid():
            maleuser_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        #maleuser_id=MaleUser.objects.get(userId=id)
        deleteMale(id)
        #maleuser_id.delete()
        return JsonResponse("Deleted Successfully",safe=False)



@csrf_exempt
def FemaleUserApi(request,id=0):
    if request.method=='GET':
        if id==0:
            femaleuser_id = FemaleUser.objects.all()
            femaleuser_serializer=FemaleUserSerializer(femaleuser_id,many=True)
            return JsonResponse(femaleuser_serializer.data,safe=False)
        else:
            femaleuser_id=FemaleUser.objects.get(userId=id)
            femaleuser_serializer=FemaleUserSerializer(femaleuser_id)
            return JsonResponse(femaleuser_serializer.data,safe=False)
    elif request.method=='POST':
        femaleuser_data=JSONParser().parse(request)
        femaleuser_serializer=FemaleUserSerializer(data=femaleuser_data)
        if femaleuser_serializer.is_valid():
            femaleuser_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        femaleuser_data=JSONParser().parse(request)
        femaleuser_id=FemaleUser.objects.get(userId=femaleuser_data['userId'])
        femaleuser_serializer=FemaleUserSerializer(femaleuser_id,data=femaleuser_data)
        if femaleuser_serializer.is_valid():
            femaleuser_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        deleteFemale(id)
        #femaleuser_id=FemaleUser.objects.get(userId=id)
        #femaleuser_id.delete()
        return JsonResponse("Deleted Successfully",safe=False)






@csrf_exempt
def MatchingTableApi(request,id=0):
    if request.method=='GET':
        matchingtable_id = MatchingTable.objects.all()
        matchingtable_serializer=MatchingTableSerializer(matchingtable_id,many=True)
        return JsonResponse(matchingtable_serializer.data,safe=False)
    elif request.method=='POST':
        matchingtable_data=JSONParser().parse(request)
        matchingtable_serializer=MatchingTableSerializer(data=matchingtable_data)
        if matchingtable_serializer.is_valid():
            matchingtable_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        matchingtable_data=JSONParser().parse(request)
        matchingtable_id=MatchingTable.objects.get(matchingId=matchingtable_data['matchingId'])
        matchingtable_serializer=MatchingTableSerializer(matchingtable_id,data=matchingtable_data)
        if matchingtable_serializer.is_valid():
            matchingtable_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        matchingtable_id=MatchingTable.objects.get(matchingId=id)
        matchingtable_id.delete()
        return JsonResponse("Deleted Successfully",safe=False)



@csrf_exempt
def PostApi(request,id=0, type='all'):
    if request.method=='GET':
        if type=='all':
            post_id = Post.objects.all()
            post_serializer=PostSerializer(post_id,many=True)
            return JsonResponse(post_serializer.data,safe=False)
        else:
            post_id = Post.objects.get(postType=type)
            post_serializer=PostSerializer(post_id,many=True)
            return JsonResponse(post_serializer.data,safe=False)
    elif request.method=='POST':
        post_data=JSONParser().parse(request)
        post_serializer=PostSerializer(data=post_data)
        if post_serializer.is_valid():
            post_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        post_data=JSONParser().parse(request)
        post_id=Post.objects.get(postId=post_data['postId'])
        post_serializer=PostSerializer(post_id,data=post_data)
        if post_serializer.is_valid():
            post_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        post_id=Post.objects.get(postId=id)
        post_id.delete()
        return JsonResponse("Deleted Successfully",safe=False)



@csrf_exempt
def SaveFile (request):
    file = request.FILES['uploadedFile']
    fileName = file.name.replace(" ","_")
    file_name = default_storage.save(fileName, file)
    return JsonResponse (file_name, safe = False)
    

@csrf_exempt
def MatchMakingApi(request,id=0):
    if request.method=='GET':
        matchMaking_data = MatchMaking.objects.all()
        matchMaking_serializer=MatchMakingSerializer(matchMaking_data,many=True)
        return JsonResponse(matchMaking_serializer.data,safe=False)
    elif request.method=='POST':
        matchMaking_data=JSONParser().parse(request)
        matchMaking_serializer=MatchMakingSerializer(data=matchMaking_data)
        if matchMaking_serializer.is_valid():
            matchMaking_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        matchMaking_data=JSONParser().parse(request)
        matchMaking_id=MatchMaking.objects.get(id=matchMaking_data['id'])
        matchMaking_serializer=MatchMakingSerializer(matchMaking_id,data=matchMaking_data)
        if matchMaking_serializer.is_valid():
            matchMaking_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        matchMaking_id=MatchMaking.objects.get(id=id)
        matchMaking_id.delete()
        return JsonResponse("Deleted Successfully",safe=False)
