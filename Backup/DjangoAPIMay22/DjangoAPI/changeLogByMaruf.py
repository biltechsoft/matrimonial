#settings.py
#after line 139
STATIC_URL = 'static/'
#............
EMAIL_USE_TLS = True
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_PASSWORD = 'puma787476'
EMAIL_HOST_USER = 'marufbuet0906@gmail.com'
EMAIL_PORT = 587
DEFAULT_FROM_EMAIL = EMAIL_HOST_USER

#Utility lib settings
SHELL_PLUS = 'plain'





#created a new file in folder UserApp/email.py
#email.py contains
#.................
from django.core.mail import send_mail, BadHeaderError
from django.http.response import JsonResponse
from django.conf import settings
from UserApp.response import create_response, HttpResponseCode, HttpRedirectUrl

def send_email(obj):
    subject = obj['subject']
    message = obj['message']
    to_email = obj['toEmail']
    from_email = settings.EMAIL_HOST_USER
    if subject and message and from_email:
        try:
            send_mail(subject, message, from_email, to_email)
        except BadHeaderError:
            return BadHeaderError
        return JsonResponse("An email has been sent",safe=False)
    else:
        return JsonResponse("Email sending error",safe=False)


#models.py a new class TempUser added after class AdminUser
#...............
class TempUser(models.Model):
    tempId = models.AutoField(primary_key=True)
    tempName=models.CharField(max_length=100,null=True)
    tempPass=models.CharField(max_length=100,null=True)
    tempEmail=models.CharField(max_length=100,null=True)
    tempGender=models.CharField(max_length=20,null=True)
    tempDateOfBirth=models.DateField(null=True)
    tempState=models.CharField(max_length=100,null=True)
    tempCellPhone=models.CharField(max_length=100,null=True)
    tempVeriCode=models.CharField(max_length=100,null=True)
    tempDateTime=models.DateTimeField(null=True)
#models.py the field name "maleId" and "femaleId" are replaced with "userId"
class MaleUser(models.Model):
    userId=models.AutoField(primary_key=True)
class FemaleUser (models.Model):
    userId=models.AutoField(primary_key=True)

#a new field name userToken is added after
#'lastEdit' field in both maleuser and FemaleUser
userToken=models.CharField(max_length=100,null=True)
#and accordingly in serializer.py

#a new field name immigrationStatusOther is added after
#'immigrationStatus' field in both maleuser and FemaleUser
immigrationStatusOther=models.CharField(max_length=100,null=True)
#and accordingly in serializer.py

#a new field name religiousPracticeOther is added after
#'religiousPractice' field in both maleuser and FemaleUser
religiousPracticeOther=models.CharField(max_length=100,null=True)
#and accordingly in serializer.py

#a new field name preReligiousOther is added after
#'preReligious' field in both maleuser and FemaleUser
preReligiousOther=models.CharField(max_length=100,null=True)
#and accordingly in serializer.py

#a new field name preImmigrationStatusOther is added after
#'preImmigrationStatus' field in both maleuser and FemaleUser
preImmigrationStatusOther=models.CharField(max_length=100,null=True)
#and accordingly in serializer.py

#serializers.py new serializer TempUserSerializer added after AdminUserSerializer
#accordingly change in line 2
from UserApp.models import AdminUser,TempUser,MaleUser,FemaleUser,MatchingTable,Post
#..............
class TempUserSerializer(serializers.ModelSerializer):
    class Meta:
        model=TempUser
        fields=('tempId','tempName','tempPass','tempEmail','tempGender','tempDateOfBirth','tempState','tempCellPhone','tempVeriCode','tempDateTime')

#serializers.py MaleUserSerializer and FemaleUserSerializer both has first field name "userId" in stead of maleId and femaleId
class MaleUserSerializer(serializers.ModelSerializer):
    class Meta:
        model=MaleUser
        fields=('userId',........)


class FemaleUserSerializer(serializers.ModelSerializer):
    class Meta:
        model=FemaleUser
        fields=('userId',......)


#serializers.py a new field name userToken is added after
#'lastEdit' field in both maleuser and FemaleUser in serializers.py

#serializers.py a new field name immigrationStatusOther is added after
#'immigrationStatus' field in both maleuser and FemaleUser in serializers.py

#serializers.py a new field name religiousPracticeOther is added after
#'religiousPractice' field in both maleuser and FemaleUser in serializers.py

#serializers.py a new field name preReligiousOther is added after
#'preReligious' field in both maleuser and FemaleUser in serializers.py

#serializers.py a new field name preImmigrationStatusOther is added after
#'preImmigrationStatus' field in both maleuser and FemaleUser in serializers.py



#urls.py new path added for send email
#..............
#added new re_path element in urlpatterns list as first item before adminuser
    re_path(r'^sendmail$',views.email_view),






#views.py for new class TempUser change in line 6 & 7 as
from UserApp.models import AdminUser,TempUser,MaleUser,FemaleUser,MatchingTable,Post
from UserApp.serializers import AdminUserSerializer,TempUserSerializer,MaleUserSerializer,FemaleUserSerializer,MatchingTableSerializer,PostSerializer
#views.py new api_view for sending email and corresponding imports
#..............
import smtplib
from rest_framework.decorators import api_view
from rest_framework.decorators import permission_classes
from rest_framework.permissions import IsAuthenticated
from UserApp.email import send_email

@api_view(["POST"])
def email_view(request):
    if request.method == "POST":
        return send_email(request.data)

#new view for tempuser
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

#ID wise "GET" implemented in all table (AdminUser, MaleUser, FemaleUser)
#The following lines are replaced........
if request.method=='GET':
    adminuser_id=AdminUser.objects.get(adminId=id)
    adminuser_serializer=AdminUserSerializer(adminuser_id)
    return JsonResponse(adminuser_serializer.data,safe=False)
#...replaced with these......
if request.method=='GET':
    if id==0:
        adminuser_id = AdminUser.objects.all()
        adminuser_serializer=AdminUserSerializer(adminuser_id,many=True)
        return JsonResponse(adminuser_serializer.data,safe=False)
    else:
        adminuser_id=AdminUser.objects.get(adminId=id)
        adminuser_serializer=AdminUserSerializer(adminuser_id)
        return JsonResponse(adminuser_serializer.data,safe=False)

#similar things are done in maleuser and FemaleUser
if request.method=='GET':
    if id==0:
        maleuser_id = MaleUser.objects.all()
        maleuser_serializer=MaleUserSerializer(maleuser_id,many=True)
        return JsonResponse(maleuser_serializer.data,safe=False)
    else:
        maleuser_id=MaleUser.objects.get(maleId=id)
        maleuser_serializer=MaleUserSerializer(maleuser_id)
        return JsonResponse(maleuser_serializer.data,safe=False)
#FemaleUser
if request.method=='GET':
    if id==0:
        femaleuser_id = FemaleUser.objects.all()
        femaleuser_serializer=FemaleUserSerializer(femaleuser_id,many=True)
        return JsonResponse(femaleuser_serializer.data,safe=False)
    else:
        femaleuser_id=FemaleUser.objects.get(femaleId=id)
        femaleuser_serializer=FemaleUserSerializer(femaleuser_id)
        return JsonResponse(femaleuser_serializer.data,safe=False)
