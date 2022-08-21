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
  Name=null; Email=null; Message=null;
  UserType=3;  //by default anonymous user
  currentUser;

  constructor(private service:SharedService) { }

  ngOnInit(): void {
    this.refreshPost();
    this.getCurrentUser();
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

  sendMessage() {
    if(this.Name==null || this.Name=='' || this.Email==null || this.Email=='' ||
        this.Message==null || this.Message=='') {
          alert("Fields cannot be empty!");
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
        this.Name=null; this.Email=null; this.Message=null;
      }
      //alert(res.toString());
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
