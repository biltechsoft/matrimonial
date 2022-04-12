import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-edit-profile',
  templateUrl: './edit-profile.component.html',
  styleUrls: ['./edit-profile.component.css']
})
export class EditProfileComponent implements OnInit {

  constructor(private service:SharedService,
              private router : Router) { }
  focus;
  focus1;
  model;
  currentUser;
  gotid;
  PhotoFilePath;

  YEARS = this.service.getYEARS();
  STATES = this.service.STATES;

  ngOnInit(): void {
    this.service.loginauth();
    this.getCurrentUser();
    this.gotid=localStorage.getItem('userid');
  }
  getU() {
    if(localStorage.getItem('usertype')=='0') {
      if(localStorage.getItem('userid') != this.gotid) {
        this.getCurrentUser();
        this.gotid=localStorage.getItem('userid');
      }
    }
    return true;
  }
  getCurrentUser() {
    if(localStorage.getItem('usertype')=='1' || (localStorage.getItem('usertype')=='0' && localStorage.getItem('gender')=='Male')) {
        this.service.getMaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
          this.currentUser = data;
          this.WEARS[this.WEARS.length-1].prop = 'No Preference';
          this.getWear(false);
          this.getImstat();
          this.getMarstat();
          this.PhotoFilePath=this.service.PhotoUrl+this.currentUser.photo;
        });
    }
    else if(localStorage.getItem('usertype')=='2' || (localStorage.getItem('usertype')=='0' && localStorage.getItem('gender')=='Female')) {
        this.service.getFemaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
          this.currentUser = data;
          this.getWear(true);
          this.getImstat();
          this.getMarstat();
          this.PhotoFilePath=this.service.PhotoUrl+this.currentUser.photo;
        });
    }
    return true;
  }
  imStatusOther() {
    if(this.currentUser.immigrationStatus == "Other") { return true; }
  }
  relPracticeOther() {
    if(this.currentUser.religiousPractice == "Other") { return true; }
  }
  preReligiousOther() {
    if(this.currentUser.preReligious == "Other") { return true; }
  }
  ownEthnicity() {
    if(this.currentUser.preEthnic == "Own Ethnicity") { return true; }
  }
  specificEthnicity() {
    if(this.currentUser.preEthnic == "Specific Ethnicity") { return true; }
  }
  preImStatusOther() {
    if(this.currentUser.preImmigrationStatus == "Other") { return true; }
  }
  preEmployed() {
    if(this.currentUser.preEmployment == "Yes") { return true; }
  }
  isMale() {
    if(this.currentUser.gender == 'Male') { return true; }
  }
  //matchedId = [1,5,3];
  clickSave() {
    //if(!this.heightOK()) { alert('Height must be integer in inch'); return false; }
    this.currentUser.userToken = localStorage.getItem('usertoken');
    this.currentUser.lastEdit = this.service.getDateTime();
    //this.currentUser.matchId = String(this.matchedId);
    if(!this.imStatusOther()) { this.currentUser.immigrationStatusOther = null; }
    if(this.currentUser.preEthnic == 'No Preference') { this.currentUser.preEthnicSpecific = this.currentUser.preEthnic; }
    //if(!this.preEmployed()) { this.currentUser.preIncome = 0; }
    if(this.imstatClicked) { this.setImstat(); }
    if(this.marstatClicked) { this.setMarstat(); }
    var activateRequest = false;
    if(this.currentUser.gender == 'Male') {
      if(this.wearClicked) { this.setWear(false); }
      this.currentUser.profileCompleteness = this.service.profilePercentage(this.currentUser, true);
      if(this.currentUser.status == 'Inactive' && this.currentUser.profileCompleteness >= 80) {
        activateRequest = true;
        this.currentUser.status = 'Pending';
      }
      this.service.updateMaleUser(this.currentUser).subscribe(res=>{
        alert(res.toString());
        if(activateRequest) { alert('Your Profile is ' + this.currentUser.profileCompleteness + '% complete. A request is sent to admin to approve your ID and after approval you will be able to see your top matches.')}
      });
    }
    else if (this.currentUser.gender == 'Female') {
      if(this.wearClicked) { this.setWear(true); }
      this.currentUser.profileCompleteness = this.service.profilePercentage(this.currentUser, false);
      if(this.currentUser.status == 'Inactive' && this.currentUser.profileCompleteness >= 80) {
        activateRequest = true;
        this.currentUser.status = 'Pending';
      }
      this.service.updateFemaleUser(this.currentUser).subscribe(res=>{
        alert(res.toString());
        if(activateRequest) { alert('Your Profile is ' + this.currentUser.profileCompleteness + '% complete. A request is sent to admin to approve your ID and after approval you will be able to see your top matches.')}
      });
    }
  }
  getAge() {
    this.currentUser.age = this.service.getAge(this.currentUser.birthYear);
    //this.currentUser.age = this.service.getAge(this.currentUser.dateOfBirth);
    localStorage.setItem('userage',this.currentUser.age);
    return true;
  }
  hasChildren() {
    if (this.currentUser.children == 'Yes') { return true; }
    else { return false; }
  }
  isEmployed() {
    if (this.currentUser.employed == 'Yes') { return true; }
    else { return false; }
  }
  /*heightOK() {
    if (Number.isInteger(Number(this.currentUser.height))) { return true; }
    else { return false; }
  }*/

  getWear(female) {
    for(var i=0; i<this.WEARS.length; i++) {
      if(female) {
        if (this.currentUser.wear.includes(this.WEARS[i].prop)) { this.WEARS[i].checked = true; }
      }
      else {
        if (this.currentUser.preWear.includes(this.WEARS[i].prop)) { this.WEARS[i].checked = true; }
      }
    }
  }
  setWear(female) {
    this.currentUser.wear = null;
    this.currentUser.preWear = null;
    for(var i=0; i<this.WEARS.length; i++) {
      if (this.WEARS[i].checked) {
        if(female) {
          this.currentUser.wear = this.currentUser.wear + this.WEARS[i].prop + ',';
        }
        else {
          this.currentUser.preWear = this.currentUser.preWear + this.WEARS[i].prop + ',';
        }
      }
    }
  }
  wearClicked = false;
  wearClick(id) {
    this.wearClicked = true;
    if(id == this.WEARS.length-1 && !this.WEARS[id].checked) {
      for(var i=0; i<this.WEARS.length-1; i++) {
        this.WEARS[i].checked = false;
      }
    }
    else if(!this.WEARS[id].checked) {
      this.WEARS[this.WEARS.length-1].checked = false;
    }
  }

  getImstat() {
    for(var i=0; i<this.IMSTATS.length; i++) {
      if (this.currentUser.preImmigrationStatus.includes(this.IMSTATS[i].prop)) { this.IMSTATS[i].checked = true; }
    }
  }
  setImstat() {
    this.currentUser.preImmigrationStatus = null;
    for(var i=0; i<this.IMSTATS.length; i++) {
      if (this.IMSTATS[i].checked) {
        this.currentUser.preImmigrationStatus = this.currentUser.preImmigrationStatus + this.IMSTATS[i].prop + ',';
      }
    }
  }
  imstatClicked = false;
  imstatClick(id) {
    this.imstatClicked = true;
    if(id == this.IMSTATS.length-1 && !this.IMSTATS[id].checked) {
      for(var i=0; i<this.IMSTATS.length-1; i++) {
        this.IMSTATS[i].checked = false;
      }
    }
    else if(!this.IMSTATS[id].checked) {
      this.IMSTATS[this.IMSTATS.length-1].checked = false;
    }
  }

  getMarstat() {
    for(var i=0; i<this.MARSTATS.length; i++) {
      if (this.currentUser.preMaritalStatus.includes(this.MARSTATS[i].prop)) { this.MARSTATS[i].checked = true; }
    }
  }
  setMarstat() {
    this.currentUser.preMaritalStatus = null;
    for(var i=0; i<this.MARSTATS.length; i++) {
      if (this.MARSTATS[i].checked) {
        this.currentUser.preMaritalStatus = this.currentUser.preMaritalStatus + this.MARSTATS[i].prop + ',';
      }
    }
  }
  marstatClicked = false;
  marstatClick(id) {
    this.marstatClicked = true;
    if(id == this.MARSTATS.length-1 && !this.MARSTATS[id].checked) {
      for(var i=0; i<this.MARSTATS.length-1; i++) {
        this.MARSTATS[i].checked = false;
      }
    }
    else if(!this.MARSTATS[id].checked) {
      this.MARSTATS[this.MARSTATS.length-1].checked = false;
    }
  }



  IMSTATS = [{prop:'US Citizen', checked:false},
              {prop:'Parmanent Resident', checked:false},
              {prop:'Student Visa', checked:false},
              {prop:'F-1', checked:false},
              {prop:'H1B', checked:false},
              {prop:'EAD', checked:false},
              {prop:'Bangladesh', checked:false},
              {prop:'Other', checked:false},
              {prop:'No Preference', checked:false}];
  MARSTATS = [{prop:'Single', checked:false},
              {prop:'Divorced', checked:false},
              {prop:'Widowed', checked:false},
              {prop:'No Preference', checked:false}];
  EDUCATION_LEVEL = ['Doctorate',
              'Masters',
              'Bachelor',
              'Other'];
  RELIGIOUS_PRACTICE = ['Sunni',
              'Shi’ite',
              'Other'];
  WEARS = [{ id:0, prop:'Headscarf', checked: false},
              {id:1, prop:'Jelbab/Abaya', checked: false},
              {id:2, prop:'Niqab', checked: false},
              {id:3, prop:'None', checked: false}];
  ETHNIC_BACKGROUND = ['Bangladeshi',
              'American',
              'Other',
              'No Preference'];

  FullName;
  NickName;
  Gender;
  Address;
  City;
  State;
  Zip;
  CellPhone;
  WorkPhone;
  HomePhone;
  Email;
  PersonalWebsite;
  Age;
  DateOfBirth;
  Height;
  Weight;
  PlaceOfBirth;
  Health;
  MaritalStatus;
  Children;
  ChildrenNumber;
  ChildrenAges;
  ImmigrationStatus;
  HighSchool;
  HighSchoolYear;
  Bachelors;
  BachelorsYear;
  Masters;
  MastersYear;
  Doctorate;
  DoctorateYear;
  OtherDegree;
  OtherDegreeYear;
  Employed;
  Employment;
  Position;
  Income;
  ReligiousPractice;
  ReligiousPracticeBrief;
  RevertTime;
  Beard;
  Smoker;
  PreReligious;
  PreReligiousBrief;
  PreWear;
  PreSmoking;
  PreEthnic;
  PreEthnicSpecific;
  PreImmigrationStatus;
  PreMaritalStatus;
  PreChildren;
  PreEducation;
  PreEmployment;
  PreIncome;
  PreAgeGap;
  GuarName;
  GuarAddress;
  GuarCity;
  GuarState;
  GuarCountry;
  GuarPhone;
  GuarEmail;
  GuarProfession;
  FamilyBrief;
  RefName1;
  RefRelation1;
  RefPhone1;
  RefName2;
  RefRelation2;
  RefPhone2;
  RefName3;
  RefRelation3;
  RefPhone3;
  Photo;
  Cv;
  Album;
  GovIssuedId;
  MatchShowLimit=5;
  UserPass;
  Status;
  OpeningDate;
  LastEdit;


}
