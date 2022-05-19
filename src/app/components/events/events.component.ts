import { Component, OnInit } from '@angular/core';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-events',
  templateUrl: './events.component.html',
  styleUrls: ['./events.component.css']
})
export class EventsComponent implements OnInit {

  allpost;
  eventHeading="";
  events;
  maxEventLen = 160;

  constructor(private service:SharedService) { }

  ngOnInit(): void {
    this.refreshPost();
  }

  refreshPost() {
    this.service.getPostList(0, 'Events').subscribe(data=>{
      this.allpost = data;
      this.eventHeading = this.allpost.filter(eventHeading => eventHeading.postCode=='2000')[0].param1;
      this.events = this.allpost.filter(events => events.postType=='Event');
      //this.currentService = this.services[0];
    });
  }

}
