import { Component, OnInit } from '@angular/core';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {

  allpost;
  contactHeading=""; contact;
  PhotoUrl = this.service.PhotoUrl;
  Name=null; Email=null; Message=null; Captcha=null;
  UserType=3;  //by default anonymous user
  currentUser;

  CAPTCHA = this.service.CAPTCHA;
  CAPTCHA_CODE = this.service.CAPTCHA_CODE;
  cid;

  constructor(private service:SharedService) { }

  ngOnInit(): void {
    this.refreshPost();
    this.getCurrentUser();
    this.getCaptcha();
  }

  isAdmin() {
    return this.service.isAdmin();
  }

  refreshPost() {
    this.service.getPostList(0, 'Contact').subscribe(data=>{
      this.allpost = data;
      this.contactHeading = this.allpost.filter(contactHeading => contactHeading.postCode=='9000')[0].param1;
      this.contact = this.allpost.filter(contact => contact.postType=='Contact')[0];
    });
  }
  validateName(str) {
    return this.service.validateName(str);
  }
  validateMessage(msg){
    return msg.length > 14; //at least 15 characters
  }
  validateCaptcha(str,code) {
    return str==code;
  }
  getCaptcha() {
    this.cid = this.service.getRandomInt(0,this.CAPTCHA.length-1);  //random captcha index
  }

  sendMessage() {
    if(this.Name==null || this.Name=='' || this.Email==null || this.Email=='' ||
        this.Message==null || this.Message=='') {
          alert("Fields cannot be empty!");
          /*const field = document.getElementById('name');
          field.style.display = 'block';
          field.focus();*/
          return false;
        }
    if(!this.validateName(this.Name)) {
          alert("Spell your name correctly!");
          return false;
        }
    if(!this.validateEmail(this.Email)) {
          alert("Please enter valid email address!");
          return false;
        }
    if(!this.validateMessage(this.Message)) {
          alert("Message should be of at least 15 characters length!");
          return false;
        }
    if(!this.validateCaptcha(this.Captcha, this.CAPTCHA_CODE[this.cid])) {
          alert("Type captcha correctly!");
          return false;
        }
    var val={
      senderId:this.Name,
      userType:this.UserType,
      senderEmail:this.Email,
      messageDetail:this.Message,
      dateTime:this.service.getDateTime()
    };

    this.service.addMessage(val).subscribe(res=>{
      if(res.toString().includes('Successfully')) {
        alert("Your message is sent! Admin will reply through your email ASAP!");
        this.Name=null; this.Email=null; this.Message=null; this.Captcha=null;
        this.getCaptcha();
      }
      //alert(res.toString());
    });
  }

  sendEmail() {
    var emailVal={
      subject: "Greetings from MUNA Matrimonial",
      message: this.Message,
      toEmail: [this.Email]
    }

    this.service.sendEmail(emailVal).subscribe(res=>{
      alert(res.toString());
    });
  }

  validateEmail(email) {
    return this.service.validateEmail(email);
  }

  getCurrentUser() {
    if(localStorage.getItem('usertype')=='1') {
        this.service.getMaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
          this.currentUser = data;
          this.Name = this.currentUser.fullName;
          this.Email = this.currentUser.email;
          this.UserType=1;
        });
    }
    else if(localStorage.getItem('usertype')=='2') {
        this.service.getFemaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
          this.currentUser = data;
          this.Name = this.currentUser.fullName;
          this.Email = this.currentUser.email;
          this.UserType=2;
        });
    }
  }


}
