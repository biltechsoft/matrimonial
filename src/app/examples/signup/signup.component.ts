import { Component, OnInit } from '@angular/core';
import { NgbDateStruct } from '@ng-bootstrap/ng-bootstrap';
import { HttpClient } from '@angular/common/http';
import {SharedService} from 'app/shared.service';
import { ILogin } from 'app/interfaces/login';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
    selector: 'app-signup',
    templateUrl: './signup.component.html',
    styleUrls: ['./signup.component.scss']
})
export class SignupComponent implements OnInit {


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
    DateOfBirth=null;
    UserPass=null;

    UserList:any = [];
    UserList1:any = [];
    UserList2:any = [];

    constructor(private service:SharedService,
                private router : Router
                ) { }

    passMisMatched=false;
    status = true;
    code = this.service.getRandomInt(123456,987654);
    regedEmail;
    userAlreadyExist = false;
    YEARS = this.service.getYEARS();
    STATES = this.service.STATES;

    ngOnInit() {
      this.refreshUserList();
      this.refreshPost();
    }

    refreshPost() {
      this.service.getPostList(0, 'Services').subscribe(data=>{
        this.allpost = data;
        this.policy = this.allpost.filter(policy => policy.postCode=='9100')[0].param1.split('\n');
      });
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
    stateValidate() {
      if(this.State == "") { return false; }
      else { return true; }
    }
    birthYearValidate() {
      if(this.BirthYear == "") { return false; }
      else { return true; }
    }
    passwordValidate() {
      if(this.pass1 == "") { return false; }
      else { return true; }
    }

    refreshUserList() {
      this.service.getMaleUserList().subscribe(data=>{
        this.UserList1 = data;
      });
      this.service.getFemaleUserList().subscribe(data=>{
        this.UserList2= data;
      });
    }

    createClick(){

         this.userAlreadyExist = false;
         this.status = true;
         if(this.FullName==null) { this.FullName=""; this.status=false; }
         if(this.Email==null) { this.Email=""; this.status=false; }
         if(this.CellPhone==null) { this.CellPhone=""; this.status=false; }
         if(this.Gender==null) { this.Gender=""; this.status=false; }
         if(this.State==null) { this.State=""; this.status=false; }
         if(this.BirthYear==null) { this.BirthYear=""; this.status=false; }
         if(this.pass1==null) { this.pass1=""; this.status=false; }
         if(!this.passMatched()) { this.passMisMatched = true; this.status=false; }
         if(this.preRegistered()) { this.userAlreadyExist = true; this.status=false;}

         if(!this.status) { return false; }

        //var dateBirth=null;
        //if(this.DateOfBirth != null) { dateBirth = this.DateOfBirth.year+'-'+this.DateOfBirth.month+'-'+this.DateOfBirth.day; }

        var val={
        tempName:this.FullName,
        tempGender:this.Gender,
        tempState:this.State,
        tempCellPhone:this.CellPhone,
        tempEmail:this.Email,
        //tempDateOfBirth:dateBirth,
        tempBirthYear:this.BirthYear,
        tempVeriCode:this.code,
        tempPass:this.UserPass,
        tempDateTime:this.service.getDateTime()
        };

        this.service.addTempUser(val).subscribe(res=>{
          //alert(res.toString());
        });

        var emailVal={
          subject: "Greetings from MUNA Matrimonial",
          message: "Your verification code is " + this.code,
          toEmail: [this.Email]
        }

        this.service.sendEmail(emailVal).subscribe(res=>{
          //alert(res.toString());
          Swal.fire('Verification Code Sent!', res.toString(),'success');
        });

        localStorage.setItem('userid', this.Email);
        localStorage.setItem('gotVeriCode', "True");  //for first time registration
        localStorage.setItem('removeVeriCode', "False");
        this.router.navigate(['/login']);
      }


    preRegistered() {
      this.regedEmail = this.UserList1.find(e => e.email == this.Email)
      if(this.regedEmail == null) {
        this.regedEmail = this.UserList2.find(e => e.email == this.Email)
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

}
