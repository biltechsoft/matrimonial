import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-edit-profile',
  templateUrl: './edit-profile.component.html',
  styleUrls: ['./edit-profile.component.css']
})
export class EditProfileComponent implements OnInit {

  constructor(private service:SharedService,
              private router : Router,
              private arout : ActivatedRoute) { }
  focus;
  focus1;
  model;
  currentUser;
  gotid;
  PhotoFileName;
  PhotoFilePath;
  PhotoUrl = this.service.PhotoUrl;
  govIdPath; cvPath; signPath;
  prevGovId; prevCV; prevSign;
  gallery; tempGallery;
  prevPhoto; prevAlbum;
  uploading=false;
  pad; pct;
  dum;
  profileNo;
  userid; usertype;

  YEARS = this.service.getYEARS();
  STATES = this.service.STATES;

  ngOnInit(): void {
    this.userid = Number(this.arout.snapshot.paramMap.get("id"));
    this.usertype = this.arout.snapshot.paramMap.get("g");
    this.service.loginauth(this.userid, this.usertype);
    this.getCurrentUser(this.userid, this.usertype);
  }
  /*getU() {
    if(localStorage.getItem('usertype')=='0') {
      if(localStorage.getItem('userid') != this.gotid) {
        this.getCurrentUser(this.currentUser.userId);
        this.gotid=localStorage.getItem('userid');
      }
    }
    return true;
  }*/
  genderMap(gender) {
    return (gender=='Male' ? '1' : '2');
  }
  getCurrentUser(userid,usertype) {
    if(usertype=='1' || (localStorage.getItem('usertype')=='0' && usertype=='1')) {
        this.service.getMaleUserList(userid).subscribe(data=>{
          this.currentUser = data;
          this.WEARS[this.WEARS.length-1].prop = 'No Preference';
          this.getWear(false);
          this.getImstat();
          this.getMarstat();
          this.PhotoFilePath=this.service.PhotoUrl+this.currentUser.photo;

          this.gallery=this.currentUser.gallery.split(',');
          if(this.currentUser.tempGallery == null || this.currentUser.tempGallery == '') {
            this.tempGallery=this.gallery;
          } else {
            this.tempGallery=this.currentUser.tempGallery.split(',');
          }

          if(localStorage.getItem('ppchange')=='true') {
            if(this.currentUser.album != null && this.currentUser.album != '') {
              this.PhotoFilePath=this.service.PhotoUrl + this.currentUser.album;
            }
            this.gallery=this.tempGallery;
          }
          this.govIdPath=this.service.PhotoUrl+this.currentUser.govIssuedId;
          this.cvPath=this.service.PhotoUrl+this.currentUser.cv;
          this.signPath=this.service.PhotoUrl+this.currentUser.signature;
          this.prevSign = this.currentUser.signature;
          this.prevPhoto = this.currentUser.photo;
          this.prevAlbum = this.currentUser.album;
          this.prevGovId = this.currentUser.govIssuedId;
          this.prevCV = this.currentUser.cv;
        });
    }
    else if(usertype=='2' || (localStorage.getItem('usertype')=='0' && usertype=='2')) {
        this.service.getFemaleUserList(userid).subscribe(data=>{
          this.currentUser = data;
          this.getWear(true);
          this.getImstat();
          this.getMarstat();
          this.PhotoFilePath=this.service.PhotoUrl+this.currentUser.photo;

          this.gallery=this.currentUser.gallery.split(',');
          if(this.currentUser.tempGallery == null || this.currentUser.tempGallery == '') {
            this.tempGallery=this.gallery;
          } else {
            this.tempGallery=this.currentUser.tempGallery.split(',');
          }

          if(localStorage.getItem('ppchange')=='true') {
            if(this.currentUser.album != null && this.currentUser.album != '') {
              this.PhotoFilePath=this.service.PhotoUrl + this.currentUser.album;
            }
            this.gallery=this.tempGallery;
          }
          this.govIdPath=this.service.PhotoUrl+this.currentUser.govIssuedId;
          this.cvPath=this.service.PhotoUrl+this.currentUser.cv;
          this.signPath=this.service.PhotoUrl+this.currentUser.signature;
          this.prevSign = this.currentUser.signature;
          this.prevPhoto = this.currentUser.photo;
          this.prevAlbum = this.currentUser.album;
          this.prevGovId = this.currentUser.govIssuedId;
          this.prevCV = this.currentUser.cv;
        });
    }
    return true;
  }
  uploadPhoto(event:any){
    this.uploading = true;
    if(this.currentUser.status == "Active") {
      if(this.currentUser.prevAlbum != null && !this.service.constPhoto.includes(this.currentUser.prevAlbum)) {
        this.service.deletePhoto({id:1,filetodel:this.currentUser.prevAlbum }).subscribe();
      }
      var file=event.target.files[0];
      //file.name='mariuf';
      const formData:FormData=new FormData();
      formData.append('uploadedFile',file,file.name);

      this.service.UploadPhoto(formData).subscribe((data:any)=>{
        this.PhotoFileName=data.toString();
        this.currentUser.album = this.PhotoFileName;
        this.PhotoFilePath=this.service.PhotoUrl+this.PhotoFileName;
        this.clickSave('changepp');
        this.uploading = false;
        //alert('Your picture will be reviewed by Admin. Your profile picture will be visible after admin approval.');
      });
    }
    else {
      if(this.prevPhoto != null && !this.service.constPhoto.includes(this.prevPhoto)) {
        this.service.deletePhoto({id:1,filetodel:this.prevPhoto}).subscribe();
      }
      var file=event.target.files[0];
      //file.name='mariuf';
      const formData:FormData=new FormData();
      formData.append('uploadedFile',file,file.name);

      this.service.UploadPhoto(formData).subscribe((data:any)=>{
        this.PhotoFileName=data.toString();
        this.currentUser.photo = this.PhotoFileName;
        this.PhotoFilePath=this.service.PhotoUrl+this.PhotoFileName;
        this.clickSave();
        this.uploading = false;
      });
    }

  }
  uploadFile(event:any, type){
    //type=11: GovId, type=12: CV, type=13: Signature
    //type=0,1,2,3,... for gallery photo id
    var photo = 'none';  //in case of change in gallery photo this value will be 'changeGalery'
    this.uploading = true;
    var delFile='';

    if(type==11 && this.prevGovId != null) { delFile = this.prevGovId; }
    else if (type==12 && this.prevCV != null) { delFile = this.prevCV; }
    else if (type==13 && this.prevSign != null) { delFile = this.prevSign; }
    //for gallery images to delete
    else if (this.currentUser.status == "Active" &&
    this.tempGallery[type] != this.gallery[type]) {
      delFile = this.tempGallery[type];
    }
    else if (this.currentUser.status != "Active") {
      delFile = this.gallery[type];
    }
    if(delFile != '' && !this.service.constPhoto.includes(delFile)) {
      this.service.deletePhoto({id:1,filetodel:delFile}).subscribe();
    }

    var file=event.target.files[0];
    //file.name='mariuf';
    const formData:FormData=new FormData();
    formData.append('uploadedFile',file,file.name);

    this.service.UploadPhoto(formData).subscribe((data:any)=>{
      var iFileName =data.toString();
      if(type==11) {
        this.currentUser.govIssuedId = iFileName;
        this.govIdPath=this.service.PhotoUrl+iFileName;
      }
      else if(type==12) {
        this.currentUser.cv = iFileName;
        this.cvPath=this.service.PhotoUrl+iFileName;
      }
      else if(type==13) {
        this.currentUser.signature = iFileName;
        this.signPath=this.service.PhotoUrl+iFileName;
      }
      else if(this.currentUser.status == "Active") {
        this.tempGallery[type] = iFileName;
        this.currentUser.tempGallery = '';
        for (var i=0; i<this.tempGallery.length; i++) {
          this.currentUser.tempGallery += this.tempGallery[i];
          if(i<this.tempGallery.length-1) { this.currentUser.tempGallery += ','; }
        }
        photo = 'changeGallery';
        //alert('Your pictures will be reviewed by Admin. Your gallery will be updated after admin approval.');
      }
      else {
        this.gallery[type] = iFileName;
        this.currentUser.gallery = '';
        for (var i=0; i<this.gallery.length; i++) {
          this.currentUser.gallery += this.gallery[i];
          if(i<this.gallery.length-1) { this.currentUser.gallery += ','; }
        }
      }

      this.clickSave(photo);
      this.uploading = false;
    });
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
  profilePercentage() {
    this.currentUser.profileCompleteness = this.service.profilePercentage(this.currentUser);
    this.pct = Number(this.currentUser.profileCompleteness);
    return true;
  }
  //matchedId = [1,5,3];
  clickSave(photo='none') {
    if(!(this.telephoneCheck(this.currentUser.cellPhone) && this.telephoneCheck(this.currentUser.workPhone) &&
        this.telephoneCheck(this.currentUser.homePhone) && this.telephoneCheck(this.currentUser.guarPhone) &&
        this.telephoneCheck(this.currentUser.phone1) &&
        this.telephoneCheck(this.currentUser.phone2) && this.telephoneCheck(this.currentUser.phone3))) {
          alert('Please enter valid phone number!');
          return false;
        }

    else if(!this.validateEmail(this.currentUser.guarEmail)) { alert('Please enter valid email address!'); return false; }
    this.currentUser.userToken = localStorage.getItem('usertoken');
    this.currentUser.lastEdit = this.service.getDateTime();
    //this.currentUser.matchId = String(this.matchedId);
    if(!this.imStatusOther()) { this.currentUser.immigrationStatusOther = null; }
    if(this.currentUser.preEthnic == 'No Preference') { this.currentUser.preEthnicSpecific = this.currentUser.preEthnic; }
    //if(!this.preEmployed()) { this.currentUser.preIncome = 0; }
    if(this.imstatClicked) { this.setImstat(); }
    if(this.marstatClicked) { this.setMarstat(); }
    var activateRequest = false;

    //set a value to null if found '' value
    for(var key in this.currentUser) {
      var value = this.currentUser[key];
      if(value=='') { this.currentUser[key] = null; }
    }

    this.profilePercentage();
    if(this.currentUser.gender == 'Male') {
      if(this.wearClicked) { this.setWear(false); }
      //this.currentUser.profileCompleteness = this.service.profilePercentage(this.currentUser, true);
      if(this.currentUser.status == 'Inactive' && this.currentUser.profileCompleteness >= 80) {
        activateRequest = true;
        this.currentUser.status = 'Pending';
      }
      this.service.updateMaleUser(this.currentUser).subscribe(res=>{
        if(photo=='none') { alert(res.toString()); }
        else if(photo=='changepp') { alert('Your picture will be reviewed by Admin. Your profile picture will be visible after admin approval.'); }
        else if(photo=='changeGallery') { alert('Your pictures will be reviewed by Admin. Your gallery will be updated after admin approval.'); }
        if(activateRequest) { alert('Your Profile is ' + this.currentUser.profileCompleteness + '% complete. A request is sent to admin to approve your ID and after approval you will be able to see your top matches.')}
        this.getCurrentUser(this.currentUser.userId, '1');
      });
    }
    else if (this.currentUser.gender == 'Female') {
      if(this.wearClicked) { this.setWear(true); }
      //this.currentUser.profileCompleteness = this.service.profilePercentage(this.currentUser, false);
      if(this.currentUser.status == 'Inactive' && this.currentUser.profileCompleteness >= 80) {
        activateRequest = true;
        this.currentUser.status = 'Pending';
      }
      this.service.updateFemaleUser(this.currentUser).subscribe(res=>{
        if(photo=='none') { alert(res.toString()); }
        else if(photo=='changepp') { alert('Your picture will be reviewed by Admin. Your profile picture will be visible after admin approval.'); }
        else if(photo=='changeGallery') { alert('Your pictures will be reviewed by Admin. Your gallery will be updated after admin approval.'); }
        if(activateRequest) { alert('Your Profile is ' + this.currentUser.profileCompleteness + '% complete. A request is sent to admin to approve your ID and after approval you will be able to see your top matches.')}
        this.getCurrentUser(this.currentUser.userId, '2');
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
  telephoneCheck(str) {
    return this.service.telephoneCheck(str);
  }
  validateEmail(email) {
    return this.service.validateEmail(email);
  }

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
    this.currentUser.wear = '';
    this.currentUser.preWear = '';
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
    if(this.currentUser.wear == '') { this.currentUser.wear = null; }
    if(this.currentUser.preWear == '') { this.currentUser.preWear = null; }
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
    this.currentUser.preImmigrationStatus = '';
    for(var i=0; i<this.IMSTATS.length; i++) {
      if (this.IMSTATS[i].checked) {
        this.currentUser.preImmigrationStatus = this.currentUser.preImmigrationStatus + this.IMSTATS[i].prop + ',';
      }
    }
    if(this.currentUser.preImmigrationStatus == '') { this.currentUser.preImmigrationStatus = null; }
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
    this.currentUser.preMaritalStatus = '';
    for(var i=0; i<this.MARSTATS.length; i++) {
      if (this.MARSTATS[i].checked) {
        this.currentUser.preMaritalStatus = this.currentUser.preMaritalStatus + this.MARSTATS[i].prop + ',';
      }
    }
    if(this.currentUser.preMaritalStatus == '') { this.currentUser.preMaritalStatus = null; }
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
              {prop:'Permanent Resident', checked:false},
              {prop:'Student Visa', checked:false},
              {prop:'F-1', checked:false},
              {prop:'H1B', checked:false},
              {prop:'EAD', checked:false},
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
