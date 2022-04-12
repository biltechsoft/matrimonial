import { Component, OnInit } from '@angular/core';
import {SharedService} from 'app/shared.service';
import { Router } from '@angular/router';

@Component({
    selector: 'app-profile',
    templateUrl: './profile.component.html',
    styleUrls: ['./profile.component.scss']
})

export class ProfileComponent implements OnInit {

    constructor(private service:SharedService, private router : Router) { }

    currentUser;
    userId;
    val = false;
    pct;  //percentage of profile completeness
    topMatches;
    matchIds;

    ngOnInit() {
      this.getCurrentUser();
    }

    profileComplete() {
      this.pct = Number(this.currentUser.profileCompleteness);
      if (this.currentUser.status == 'Active') {
        this.getTopMatches();
        return true;
      }
    }
    getTopMatches() {
      this.matchIds = this.currentUser.matchId.split(',',this.currentUser.matchShowLimit);
      this.service.getMaleUserList([61,62]).subscribe(data=>{
        this.topMatches = data;
        //this.pct = this.profilePercentage(this.currentUser);
      });
    }

    getCurrentUser() {
      if(localStorage.getItem('usertype')=='1') {
          this.service.getMaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
            this.currentUser = data;
            //this.pct = this.profilePercentage(this.currentUser);
          });
      }
      else if(localStorage.getItem('usertype')=='2') {
          this.service.getFemaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
            this.currentUser = data;
            //this.pct = this.profilePercentage(this.currentUser,false);
          });
      }
    }
    islogin() {
      if (this.userId == localStorage.getItem('userid')) {
        return true;
      }
      else {
        this.router.navigate(['/login']);
        return false;
      }
    }

}
