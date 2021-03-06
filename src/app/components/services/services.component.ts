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
  maxServiceLen = 160;
  currentServiceHeading; currentService;

  constructor(private service:SharedService) { }

  ngOnInit(): void {
    this.refreshPost();
  }

  refreshPost() {
    this.service.getPostList(0, 'Services').subscribe(data=>{
      this.allpost = data;
      this.serviceHeading = this.allpost.filter(serviceHeading => serviceHeading.postCode=='3000')[0].param1;
      this.services = this.allpost.filter(services => (services.postType=='Service' && services.postStatus=='Active')).sort(
        (item1,item2) => item1.postCode - item2.postCode);
      this.currentService = this.services[0];
    });
  }
  isAdmin() {
    return this.service.isAdmin();
  }

  /*jsonparse(str, item) {
    return JSON.parse(str);
  }*/

  viewMore(service) {
    this.currentServiceHeading = service.param1;
    this.currentService = service.param3.split('\n');
  }


}
