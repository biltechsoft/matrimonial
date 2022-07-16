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
  currentEvent; currentEventDetails;
  PhotoUrl = this.service.PhotoUrl;
  moreEvent = false; moreless = 'View More ...';

  constructor(private service:SharedService) { }

  ngOnInit(): void {
    this.refreshPost();
  }

  refreshPost() {
    this.service.getPostList(0, 'Events').subscribe(data=>{
      this.allpost = data;
      this.eventHeading = this.allpost.filter(eventHeading => eventHeading.postCode=='4000')[0].param1;
      this.events = this.allpost.filter(events => (events.postType=='Event' && events.postStatus=='Active')).sort(
        (item1,item2) => item2.postCode - item1.postCode);
      this.viewMore(0);
    });
  }

  viewMore(id) {
    this.currentEvent = this.events[id];
    this.currentEventDetails = this.events[id].param4.split('\n');
  }

  viewMoreEvent() {
    this.moreEvent = !this.moreEvent;
    if(this.moreEvent) {
      this.moreless = 'View Less';
    }
    else {
      this.moreless = 'View More ...';
    }
  }

}
