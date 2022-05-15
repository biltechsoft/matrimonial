import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-services',
  templateUrl: './services.component.html',
  styleUrls: ['./services.component.css']
})
export class ServicesComponent implements OnInit {
  test : Date = new Date();
  focus;
  focus1;
  allpost;
  serviceHeading="";
  services;
  micon='calendar <br> university';

  constructor(private service:SharedService) { }

  ngOnInit(): void {
    this.refreshPost();
  }
  gcon() {
    return 'university';
  }
  refreshPost() {
    this.service.getPostList(0, 'Services').subscribe(data=>{
      this.allpost = data;
      //this.serviceHeading = this.allpost.filter(serviceHeading => serviceHeading.postCode=='1000');
      this.services = this.allpost.filter(services => services.postType=='Services');
    });
  }
  isAdmin() {
    return this.service.isAdmin();
  }
  isHome() {
    return this.service.isHome();
  }
  jsonparse(str, item) {
    return JSON.parse(str);
  }


}
