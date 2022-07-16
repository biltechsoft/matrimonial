import { Component, OnInit } from '@angular/core';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

  allpost;
  aboutHeading="";
  about; programs;
  PhotoUrl = this.service.PhotoUrl;
  team;

  constructor(private service:SharedService) { }

  ngOnInit(): void {
    this.refreshPost();
  }

  refreshPost() {
    this.service.getPostList(0, 'About').subscribe(data=>{
      this.allpost = data;
      this.aboutHeading = this.allpost.filter(eventHeading => eventHeading.postCode=='5000')[0].param1;
      this.about = this.allpost.filter(about => about.postType=='About')[0];
      this.team = this.allpost.filter(team => (team.postType=='Team' && team.postStatus=='Active')).sort(
        (item1,item2) => item1.postCode - item2.postCode);
      this.getPrograms();
    });
  }

  getPrograms() {
    this.programs = this.about.param5.split('\n');
  }

}
