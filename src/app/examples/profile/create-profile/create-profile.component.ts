import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { NgbDateStruct } from '@ng-bootstrap/ng-bootstrap';
import { HttpClient } from '@angular/common/http';
import {SharedService} from 'app/shared.service';
import { ILogin } from 'app/interfaces/login';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-create-profile',
  templateUrl: './create-profile.component.html',
  styleUrls: ['./create-profile.component.css']
})
export class CreateProfileComponent implements OnInit {

  constructor(private service:SharedService,
    private router : Router) { }
    
    
    test : Date = new Date();
    focus;
    focus1;
    date: {year: number, month: number};
    pass1=null;
    pass2="";
    agreed=false;

    allpost;
    policy;

    TempId=0;
    FullName=null;
    Gender=null;
    State=null;
    CellPhone=null;
    Email=null;
    BirthYear=null;
    Education=null;
    Address=null;
    //Height=null;
    //Weight=null;
    ImmigrationStatus=null;
    Employed=null;
    Employment=null;
    Position=null;
    Income=null;
    Comment=null;
    DateOfBirth=null;
    UserPass=null;
    extra="";

    maxIncome=999999999;
    UserList:any = [];
    UserList1:any = [];
    UserList2:any = [];
    
    
    passMisMatched=false;
    status = true;
    code = this.service.getRandomInt(123456,987654);
    regedEmail;
    userAlreadyExist = false;
    YEARS = this.service.getYEARS(18);
    STATES = this.service.STATES;

    ngOnInit() {
      this.refreshUserList();
      this.refreshPost();
    }

    initalizeVar() {
      this.FullName=null;
      this.Gender=null;
      this.State=null;
      this.CellPhone=null;
      this.Email=null;
      this.BirthYear=null;
      this.Education=null;
      this.Address=null;
      //Height=null;
      //Weight=null;
      this.ImmigrationStatus=null;
      this.Employed=null;
      this.Employment=null;
      this.Position=null;
      this.Income=null;
      this.Comment=null;
    }

    refreshPost() {
      this.service.getPostList(0, 'Services').subscribe(data=>{
        this.allpost = data;
        this.policy = this.allpost.filter(policy => policy.postCode=='9100')[0].param1.split('\n');
      });
    }
    enterPress() {
      if(this.agreed) {
        this.createClick();
      }
    }
    fullNameValidate() {
      if(this.FullName == "") { return false; }
      else { return this.service.validateName(this.FullName); }
    }
    emailValidate() {
      if(this.Email == "") { return false; }
      else { return this.service.validateEmail(this.Email); }
    }
    telephoneCheck() {
      if(this.CellPhone == "") { return false; }
      return this.service.telephoneCheck(this.CellPhone);
    }
    genderValidate() {
      if(this.Gender == "") { return false; }
      else { return true; }
    }
    addressValidate() {
      if(this.Address == "") { return false; }
      else { return true; }
    }
    stateValidate() {
      if(this.State == "") { return false; }
      else { return true; }
    }
    birthYearValidate() {
      if(this.BirthYear == "") { return false; }
      else { return true; }
    }
    educationValidate() {
      if(this.Education == "") { return false; }
      else { return true; }
    }
    immigrationValidate() {
      if(this.ImmigrationStatus == "") { return false; }
      else { return true; }
    }
    employedValidate() {
      if(this.Employed == "") { return false; }
      else { return true; }
    }
    employmentValidate() {
      if(this.Employed == "Yes" && this.Employment == "") { return false; }
      else { return true; }
    }
    positionValidate() {
      if(this.Employed == "Yes" && this.Position == "") { return false; }
      else { return true; }
    }
    incomeValidate() {
      if(this.Income==0) { this.Income=""; }
      else {
        this.Income = Math.round(this.Income);
        if(this.Income > this.maxIncome) {
          this.Income = this.maxIncome;
      }
      }
      
    }

    passwordValidate() {
      if(!this.service.validatePass(this.pass1)) { return false; }
      else { return true; }
    }

    validateFields() {
      if(!this.fullNameValidate() || !this.emailValidate() || !this.telephoneCheck()) {
        Swal.fire('Invalid Field!', 'Please enter valid text!','warning');
          return false;
      } else {
        return true;
      }
    }

    refreshUserList() {
      this.service.getMaleUserList().subscribe(data=>{
        this.UserList1 = data;
        if(localStorage.getItem('gotConventionTemp') == "True") {
          this.emailConventionProfile(data);
          localStorage.setItem('gotConventionTemp', "False");
        }
      });
      this.service.getFemaleUserList().subscribe(data=>{
        this.UserList2= data;
        if(localStorage.getItem('gotConventionTemp') == "True") {
          this.emailConventionProfile(data);
          localStorage.setItem('gotConventionTemp', "False");
        }
      });
    }

    createClick(){

      this.refreshUserList();
         this.userAlreadyExist = false;
         this.status = true;

         this.status = this.validateFields();
         if(this.FullName==null || this.FullName=="") { this.FullName=""; this.status=false; }
         if(this.Email==null || this.Email=="") { this.Email=""; this.status=false; }
         if(this.CellPhone==null || this.CellPhone=="") { this.CellPhone=""; this.status=false; }
         if(this.Gender==null || this.Gender=="") { this.Gender=""; this.status=false; }
         if(this.State==null || this.State=="") { this.State=""; this.status=false; }
         if(this.BirthYear==null || this.BirthYear=="") { this.BirthYear=""; this.status=false; }
         if(this.Education==null || this.Education=="") { this.Education=""; this.status=false; }
         if(this.Address==null || this.Address=="") { this.Address=""; this.status=false; }
         if(this.ImmigrationStatus==null || this.ImmigrationStatus=="") { this.ImmigrationStatus=""; this.status=false; }
         if(this.Employed==null || this.Employed=="") { this.Employed=""; this.status=false; }
         if(this.Employed=="Yes" && (this.Employment==null || this.Employment=="")) { this.Employment=""; this.status=false; }
         //if(this.Employed=="Yes" && this.Position==null) { this.Position=""; this.status=false; }
         if(this.Income=="") { this.Income=null; }
         if(this.Comment=="") { this.Comment=null; }

         if(this.preRegistered()) { this.userAlreadyExist = true; this.status=false;}

         
         if(!this.status) { return false; }

        //var dateBirth=null;
        //if(this.DateOfBirth != null) { dateBirth = this.DateOfBirth.year+'-'+this.DateOfBirth.month+'-'+this.DateOfBirth.day; }

        var val={
          fullName:this.FullName,
          gender:this.Gender,
          state:this.State,
          cellPhone:this.CellPhone,
          email: this.Email.trim(),
          highestEducation: this.Education,
          address: this.Address,
          immigrationStatus: this.ImmigrationStatus,
          employed: this.Employed,
          employment: this.Employment,
          income: this.Income,
          familyBrief: this.Comment,
          //tempDateOfBirth:dateBirth,
          birthYear:this.BirthYear,
          
          openingDate:this.service.getDateTime(),
          lastEdit:this.service.getDateTime(),
          status: 'Convention'
        };

        if(this.Gender=="Male") {
          this.service.addMaleUser(val).subscribe(res=>{
            Swal.fire('You have successfully registered!', res.toString(),'success');
            //this.refreshUserList();
            //this.initalizeVar();
            window.location.reload();
          });
        } else {
          this.service.addFemaleUser(val).subscribe(res=>{
            Swal.fire('You have successfully registered!', res.toString(),'success');
            //this.refreshUserList();
            //this.initalizeVar();
            window.location.reload();
          });
        }


        /*var emailVal={
          subject: "Greetings from MUNA Matrimonial",
          message: "Your verification code is " + this.code,
          toEmail: [this.Email.trim()]
        }

        this.service.sendEmail(emailVal).subscribe(res=>{
          //alert(res.toString());
          Swal.fire('Verification Code Sent!', res.toString(),'success');
        });*/

        localStorage.setItem('userid', this.Email.trim());
        localStorage.setItem('gender', this.Gender);  //for first time registration
        localStorage.setItem('gotConventionTemp', "True");
        //this.router.navigate(['/create-profile']);
        
        
      }
    
    emailConventionProfile(data) {
      var currentId = data.find(e => e.email == localStorage.getItem('userid'));
      var gen = (localStorage.getItem('gender')).substring(0,1);
      console.log(currentId.userId);
      if(currentId) {
        var emailVal={
          subject: "Greetings from MUNA Matrimonial",
          message: "Your profile ID is " + gen + currentId.userId,
          toEmail: [localStorage.getItem('userid')]
        }

        this.service.sendEmail(emailVal).subscribe(res=>{
          //alert(res.toString());
          Swal.fire(res.toString(), 'You have successfully created your profile. Your ID is: '+gen+currentId.userId+'. Please check you email.','success');
          //window.location.reload();
        });
      }
      
    }

    preRegistered() {
      this.regedEmail = this.UserList1.find(e => e.email == this.Email.trim());
      if(this.regedEmail == null) {
        this.regedEmail = this.UserList2.find(e => e.email == this.Email.trim());
        if(this.regedEmail == null) { return false; }
      }
      else {return true;}
    }
    isnull() {
      return this.regedEmail != null;
    }
    passMatched() {
      if(this.pass1 != "" && this.pass1 == this.pass2) {
        this.UserPass = this.service.mEncrypt(this.pass1);
        return true;
      }
      else if(this.pass1 == null && this.pass2 == '') { return true; }
      return false;
    }
    agreePrivacy() {
      this.agreed = !this.agreed;
      //this.buttonRef.focus();
      //this.button.focus();

    }

    isWeekend(date: NgbDateStruct) {
        const d = new Date(date.year, date.month - 1, date.day);
        return d.getDay() === 0 || d.getDay() === 6;
    }

    isDisabled(date: NgbDateStruct, current: {month: number}) {
        return date.month !== current.month;
    }

    /* for understanding objects
    inventory = [
        {name: 'apples', quantity: 2},
        {name: 'bananas', quantity: 0},
        {name: 'cherries', quantity: 5}
    ];
    inventory1 = [
        {name: 'apples1', quantity: 2},
        {name: 'bananas1', quantity: 0},
        {name: 'cherries1', quantity: 5}
    ];

    total = [this.inventory, this.inventory1];
    */

    EDUCATION_LEVEL = ['Doctorate',
              'Masters',
              'Bachelor',
              'Other'];
    IMSTATS = [{prop:'US Citizen', checked:false},
              {prop:'Permanent Resident', checked:false},
              {prop:'Student Visa', checked:false},
              {prop:'F-1', checked:false},
              {prop:'H1B', checked:false},
              {prop:'EAD', checked:false},
              {prop:'Other', checked:false}];

}
