from rest_framework import serializers
from UserApp.models import AdminUser,AdminLog,Message,TempUser,MaleUser,FemaleUser,MatchingTable,Post,MatchMaking

class AdminUserSerializer(serializers.ModelSerializer):
    class Meta:
        model=AdminUser
        fields=('adminId','adminUserName','adminPass','adminFullName','adminLevel','adminStatus','adminToken')
        
class AdminLogSerializer(serializers.ModelSerializer):
    class Meta:
        model=AdminLog
        fields=('logId','adminId','userId','xuserId','userType','action','description','note','actionTime')
        
class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model=Message
        fields=('messageId','senderId','userType','senderEmail','messageDetail','messageReply','dateTime','replyDateTime')

class TempUserSerializer(serializers.ModelSerializer):
    class Meta:
        model=TempUser
        fields=('tempId','tempName','tempPass','tempEmail','tempGender','tempBirthYear','tempState','tempCellPhone','tempVeriCode','tempDateTime')

class MaleUserSerializer(serializers.ModelSerializer):
    class Meta:
        model=MaleUser
        fields=('userId','fullName','nickName','gender','address','city','state','zip','cellPhone','workPhone','homePhone','email','personalWebsite','birthYear','age','dateOfBirth','height','weight','placeOfBirth','health','maritalStatus','children','childrenNumber','childrenAges','immigrationStatus','immigrationStatusOther','highSchool','highSchoolYear','bachelors','bachelorsYear','masters','mastersYear','doctorate','doctorateYear','otherDegree','otherDegreeYear','highestEducation','employed','employment','position','income','religiousPractice','religiousPracticeOther','religiousPracticeBrief','revertTime','beard','smoker','preReligious','preReligiousOther','preReligiousBrief','preWear','preSmoking','preEthnic','preEthnicSpecific','preImmigrationStatus','preImmigrationStatusOther','preMaritalStatus','preChildren','preEducation','preEmployment','preIncome','preAgeGap','guarName','guarAddress','guarCity','guarState','guarCountry','guarPhone','guarEmail','guarProfession','familyBrief','refName1','refRelation1','refPhone1','refName2','refRelation2','refPhone2','refName3','refRelation3','refPhone3','photo','cv','album','gallery','tempGallery','govIssuedId','signature','matchShowLimit','lockedId','reqLock','matchId','matchPercentage','cuMatchId','reqSent','reqAccepted','reqRejected','userPass','status','profileCompleteness','openingDate','lastEdit','userToken')


class FemaleUserSerializer(serializers.ModelSerializer):
    class Meta:
        model=FemaleUser
        fields=('userId','fullName','nickName','gender','address','city','state','zip','cellPhone','workPhone','homePhone','email','personalWebsite','birthYear','age','dateOfBirth','height','weight','placeOfBirth','health','maritalStatus','children','childrenNumber','childrenAges','immigrationStatus','immigrationStatusOther','highSchool','highSchoolYear','bachelors','bachelorsYear','masters','mastersYear','doctorate','doctorateYear','otherDegree','otherDegreeYear','highestEducation','employed','employment','position','income','religiousPractice','religiousPracticeOther','religiousPracticeBrief','revertTime','wear','smoker','preReligious','preReligiousOther','preReligiousBrief','preBeard','preSmoking','preEthnic','preEthnicSpecific','preImmigrationStatus','preImmigrationStatusOther','preMaritalStatus','preChildren','preEducation','preEmployment','preIncome','preAgeGap','guarName','guarAddress','guarCity','guarState','guarCountry','guarPhone','guarEmail','guarProfession','familyBrief','refName1','refRelation1','refPhone1','refName2','refRelation2','refPhone2','refName3','refRelation3','refPhone3','photo','cv','album','gallery','tempGallery','govIssuedId','signature','matchShowLimit','lockedId','reqLock','matchId','matchPercentage','cuMatchId','reqSent','reqAccepted','reqRejected','userPass','status','profileCompleteness','openingDate','lastEdit','userToken')


class MatchingTableSerializer(serializers.ModelSerializer):
    class Meta:
        model=MatchingTable
        fields=('matchingId','matchingIndicator','matchingDetails','malePoint','femalePoint')


class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model=Post
        fields=('postId','postCode','postType','pageTitle','postDetails','param1','param2','param3','param4','param5','postPhoto','postStatus')

class MatchMakingSerializer(serializers.ModelSerializer):
    class Meta:
        model =MatchMaking
        fields =('id','maleId','femaleId','percentage','statusMale')