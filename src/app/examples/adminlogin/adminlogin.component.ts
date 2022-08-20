import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { ILogin } from 'app/interfaces/login';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-adminlogin',
  templateUrl: './adminlogin.component.html',
  styleUrls: ['./adminlogin.component.css']
})
export class AdminloginComponent implements OnInit {

  constructor(private service:SharedService,
              private router : Router
              ) { }
  test : Date = new Date();
  focus;
  focus1;
  TempList:any = [];
  currentUser;
  adminUser;
  veriCode="";
  wrongCode = false;
  gotTempList = false;
  gotUserList = false;
  userEmail="";
  password="";
  UserList:any = [];
  AdminUserList:any = [];
  MaleUserList:any = [];
  FemaleUserList:any = [];
  dummyvar="";
  errorMessage="";
  code = this.service.getRandomInt(123456,987654);




  ngOnInit(): void {
    localStorage.removeItem('forgot');
    localStorage.removeItem('gotVeriCode');
  }

  isSignedUp() {
    if (localStorage.getItem('isSignedUp') == "True") {return true; }
    else {return false;}
  }
  gotVeriCode() {
    if (localStorage.getItem('gotVeriCode') == "True") {return true; }
    else {return false;}
  }
  clickLogin(passcheck=true) {
    if(this.adminloginValidate(passcheck)) {
      localStorage.removeItem('isSignedUp');
      var UserToken = this.service.getRandomInt(12345678,87654321);
      localStorage.setItem('usertoken', UserToken);
      localStorage.setItem('adminid', this.adminUser.adminId);
      this.service.updateAdminUser({adminId: this.adminUser.adminId, adminToken: UserToken}).subscribe();
      localStorage.setItem('usertype', '0');
      localStorage.setItem('fromloginpage', 'True');
      localStorage.setItem('isLoggedOut','False');
      localStorage.setItem('username',this.adminUser.adminFullName);
      if(localStorage.getItem('forgot')=='True') {
        localStorage.removeItem('forgot');
        this.router.navigate(['/password']);
      }
      else {
        this.router.navigate(['/adminhome']);
      }
    }
  }
  refreshUserList() {
    if(!this.gotUserList) {
      this.service.getAdminList().subscribe(data=>{
        this.AdminUserList = data;
      });
      this.gotUserList = true;
    }
  }

  adminloginValidate(passcheck=true) {
    this.adminUser = this.AdminUserList.find(e => e.adminUserName == this.userEmail);
    if(this.adminUser != null) {
      if(passcheck) {  //passcheck is false when forgot password, want to recover it
        if(this.adminUser.adminPass == this.password) { return true; }
        else {
          this.errorMessage = "Invalid Email or Password or Both";
          return false;
        }
      }
      else {return true;}
    }
    else {
      this.errorMessage = "Invalid Email or Password or Both";
      return false;
    }
  }

  refreshTempList() {
    if(!this.gotTempList) {
      this.service.getTempList().subscribe(data=>{
        this.TempList = data;
      });
      this.gotTempList=true;
    }
  }
  verifyEmail() {
    if(this.forgot()) {
      return this.code == this.veriCode;
    }
    else {
      this.currentUser = this.TempList.find(e => e.tempEmail == localStorage.getItem('userid'))
      if(this.currentUser == null) { return false; }
      else if(this.currentUser.tempVeriCode == this.veriCode) { this.wrongCode=false; return true; }
      else { return false; }
    }
  }
  clickVerify() {
    if(!this.verifyEmail()) { this.wrongCode=true; return false; }
    if(this.forgot()) {
      this.clickLogin(false);
    }
    else {

        var val={
          fullName:this.currentUser.tempName,
          gender:this.currentUser.tempGender,
          state:this.currentUser.tempState,
          cellPhone:this.currentUser.tempCellPhone,
          email:this.currentUser.tempEmail,
          birthYear:this.currentUser.tempBirthYear,
          age:this.service.getAge(this.currentUser.tempBirthYear),
          matchShowLimit:5,
          userPass:this.currentUser.tempPass,
          status:"Inactive",
          photo:"anonymous.png",
          openingDate:this.service.getDateTime(),
          lastEdit:this.service.getDateTime()
        };
        if(this.currentUser.tempGender == "Male") {
          this.service.addMaleUser(val).subscribe(res=>{
          //alert(res.toString());
        });
      }
      else {
        this.service.addFemaleUser(val).subscribe(res=>{
          //alert(res.toString());
        });
      }
      this.service.deleteTempUser(this.currentUser.tempId).subscribe(res=>{
        alert(res.toString());
      });
      localStorage.setItem('isSignedUp', "True");
      localStorage.removeItem('userid');
    }
    localStorage.removeItem('gotVeriCode');
    //this.router.navigate(['/login']);
  }
  clickForgot() {
    localStorage.setItem('forgot','True');
  }
  clickRemember() {
    localStorage.setItem('forgot','False');
  }
  forgot() {
    if(localStorage.getItem('forgot')=='True') {return true;}
    else {return false;}
  }
  sendCode() {
    if(this.adminloginValidate(false)) {
      localStorage.setItem('usertype','0');
    }
    else {
      this.errorMessage = "Your Email is not registered! Please Sign Up.";
      return false;
    }
    var emailVal={
      subject: "Verification code from MUNA Matrimonial",
      message: "Your verification code is " + this.code,
      toEmail: [this.userEmail]
    }
    this.service.sendEmail(emailVal).subscribe(res=>{
      //alert(res.toString());
    });
    if(localStorage.getItem('usertype')=='0') {
      this.service.updateAdminUser({adminId: this.adminUser.adminId, adminPass: this.code}).subscribe();
    }
    else if(this.currentUser.gender == 'Male') {
      this.service.updateMaleUser({userId: this.currentUser.userId, userPass: this.service.mEncrypt(this.code)}).subscribe();
    }
    else {
      this.service.updateFemaleUser({userId: this.currentUser.userId, userPass: this.service.mEncrypt(this.code)}).subscribe();
    }
    localStorage.setItem('gotVeriCode','True');
  }


  /*isgreater() {
    this.OpeningDate='0001-01-11 00:00:00';
    this.LastEdit='0001-01-11 00:00:03';
    if(this.OpeningDate > this.LastEdit) {
      this.dummyvar="It Works";
    }
    else { this.dummyvar="It doesn't work. "; }
    return true;
  }*/

/*  createClick(){



      localStorage.setItem('isSignedUp', "true");
      this.router.navigate(['/login']);

      this.service.addMaleUser(val).subscribe(res=>{
        alert(res.toString());
      });


      var emailVal={
        subject: "Greetings from MUNA",
        message: "Your verification code is " + this.code,
        toEmail: [this.Email]
      }

      this.service.sendEmail(emailVal).subscribe(res=>{
        alert(res.toString());
      });
    }


  //fields of user table
  maleusers: any=  [];
  modalTitle="";

  MaleId=0;
  FemaleId=0;

  FullName=null;
  NickName=null;
  Gender=null;
  Address=null;
  City=null;
  State=null;
  Zip=null;
  CellPhone=null;
  WorkPhone=null;
  HomePhone=null;
  Email=null;
  PersonalWebsite=null;
  Age=null;
  DateOfBirth=null;
  Height=null;
  Weight=null;
  PlaceOfBirth=null;
  Health=null;
  MaritalStatus=null;
  Children=null;
  ChildrenNumber=null;
  ChildrenAges=null;
  ImmigrationStatus=null;
  HighSchool=null;
  HighSchoolYear=null;
  Bachelors=null;
  BachelorsYear=null;
  Masters=null;
  MastersYear=null;
  Doctorate=null;
  DoctorateYear=null;
  OtherDegree=null;
  OtherDegreeYear=null;
  Employed=null;
  Employment=null;
  Position=null;
  Income=null;
  ReligiousPractice=null;
  ReligiousPracticeBrief=null;
  RevertTime=null;

  Beard=null;
  Wear=null;

  Smoker=null;
  PreReligious=null;
  PreReligiousBrief=null;

  PreWear=null;
  preBeard=null;

  PreSmoking=null;
  PreEthnic=null;
  PreEthnicSpecific=null;
  PreImmigrationStatus=null;
  PreMaritalStatus=null;
  PreChildren=null;
  PreEducation=null;
  PreEmployment=null;
  PreIncome=null;
  PreAgeGap=null;
  GuarName=null;
  GuarAddress=null;
  GuarCity=null;
  GuarState=null;
  GuarCountry=null;
  GuarPhone=null;
  GuarEmail=null;
  GuarProfession=null;
  FamilyBrief=null;
  RefName1=null;
  RefRelation1=null;
  RefPhone1=null;
  RefName2=null;
  RefRelation2=null;
  RefPhone2=null;
  RefName3=null;
  RefRelation3=null;
  RefPhone3=null;
  Photo=null;
  Cv=null;
  Album=null;
  GovIssuedId=null;
  MatchShowLimit=5;
  UserPass=null;
  Status=null;
  OpeningDate = this.service.getDateTime();
  //OpeningDate=null;
  LastEdit=null;*/



}
