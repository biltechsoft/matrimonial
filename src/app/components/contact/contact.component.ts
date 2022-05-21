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

  constructor(private service:SharedService) { }

  ngOnInit(): void {
    this.refreshPost();
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


}
