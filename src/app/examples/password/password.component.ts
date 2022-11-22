import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { ILogin } from 'app/interfaces/login';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import {SharedService} from 'app/shared.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-password',
  templateUrl: './password.component.html',
  styleUrls: ['./password.component.css']
})
export class PasswordComponent implements OnInit {

  constructor(private service:SharedService,
              private router : Router,
              private arout : ActivatedRoute
              ) { }
  test : Date = new Date();
  focus;
  focus1;
  TempList:any = [];
  currentUser;
  adminUser;
  userEmail="";
  password="";

  errorMessage="";

  pass1=""; pass2;
  UserPass;
  userid; usertype;

  ngOnInit(): void {
    this.userid = Number(this.arout.snapshot.paramMap.get("id"));
    this.usertype = this.arout.snapshot.paramMap.get("g");
    this.service.loginauth(this.userid, this.usertype);
    this.getCurrentUser(this.userid, this.usertype);
  }
  getCurrentUser(userid, usertype) {
    if(localStorage.getItem('usertype')=='0') {
        this.service.getAdminList(Number(localStorage.getItem('adminid'))).subscribe(data=>{
          this.adminUser = data;
        });
    }
    else if(usertype=='1') {
        this.service.getMaleUserList(userid).subscribe(data=>{
          this.currentUser = data;
        });
    }
    else if(usertype=='2') {
        this.service.getFemaleUserList(userid).subscribe(data=>{
          this.currentUser = data;
        });
    }
    return true;
  }
  passMatched() {
    if(this.pass1 != "" && this.pass1 == this.pass2) {
      this.UserPass = this.service.mEncrypt(this.pass1);
      return true;
    }
    return false;
  }
  passwordValidate() {
    if(!this.service.validatePass(this.pass1)) { return false; }
    else { return true; }
  }
  changePassword() {
    if(!this.passMatched()) {
      this.errorMessage = "Please retype new password correctly.";
      return false;
    }
    if(!this.passwordValidate()) {
      this.errorMessage = "Password must contain uppercase, lowercase, number and special characcter!";
      return false;
    }
    var changed=true;
    var rout = '/user-profile';
    if(localStorage.getItem('usertype')=='0') {
        if(this.adminUser.adminPass == this.password) {
          this.service.updateAdminUser({adminId: this.adminUser.adminId, adminPass: this.pass1}).subscribe();
          rout = '/adminhome';
        }
        else {changed=false;}
    }
    else if(localStorage.getItem('usertype')=='1') {
      if(this.currentUser.userPass == this.service.mEncrypt(this.password)) {
        this.service.updateMaleUser({userId: this.currentUser.userId, userPass: this.UserPass}).subscribe();
      }
      else {changed=false;}
    }
    else if(localStorage.getItem('usertype')=='2') {
      if(this.currentUser.userPass == this.service.mEncrypt(this.password)) {
        this.service.updateFemaleUser({userId: this.currentUser.userId, userPass: this.UserPass}).subscribe();
      }
      else {changed=false;}
    }
    if(!changed) {
      this.errorMessage = "Password Wrong!";
      return false;
    }
    //alert("Password Changed Successfully");
    Swal.fire('Password Changed!', 'Password Changed Successfully','success');
    if(this.usertype=='0') {
      this.router.navigate([rout]);
    }
    this.router.navigate([rout,this.usertype,this.currentUser.userId]);
  }


}
