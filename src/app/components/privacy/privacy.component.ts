import { Component, OnInit } from '@angular/core';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-privacy',
  templateUrl: './privacy.component.html',
  styleUrls: ['./privacy.component.css']
})
export class PrivacyComponent implements OnInit {

  constructor(private service:SharedService) { }
  allpost;
  policy;
  ngOnInit() {
    this.refreshPost();
  }

  refreshPost() {
    this.service.getPostList(0, 'Services').subscribe(data=>{
      this.allpost = data;
      this.policy = this.allpost.filter(policy => policy.postCode=='9100')[0].param1.split('\n');
    });
  }

}
