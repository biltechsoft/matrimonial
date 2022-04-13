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
    gotid;
    pct;  //percentage of profile completeness
    topMatches;
    topMatchPct;
    users;
    matchUsers;

    reqSentIndex;

    ngOnInit() {
      this.getCurrentUser();
    }

    requestInfo(user,i) {
      //if(this.currentUser.reqSent == null) { this.currentUser.reqSent = ""; }
      if(this.currentUser.gender == 'Male') {
        var val = { userId: this.currentUser.userId, reqSent: this.currentUser.reqSent+=user.userId+',' };
        this.service.updateMaleUser(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
        });
      }
      else if(this.currentUser.gender == 'Female') {
        var val = { userId: this.currentUser.userId, reqSent: this.currentUser.reqSent+=user.userId+',' };
        this.service.updateFemaleUser(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
        });
      }
    }
    isReqSent(user) {
      return this.currentUser.reqSent.includes(user.userId.toString());
    }
    giveAccess(user,i) {
      var newReqSent = this.currentUser.reqSent.split(','+user.userId+',');
      if(this.currentUser.gender == 'Male') {
        var val = { userId: this.currentUser.userId, reqSent: this.currentUser.reqSent+=user.userId+',' };
        this.service.updateMaleUser(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
        });
      }
      else if(this.currentUser.gender == 'Female') {
        var val = { userId: this.currentUser.userId, reqSent: this.currentUser.reqSent+=user.userId+',' };
        this.service.updateFemaleUser(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
        });
      }
    }

    profileComplete() {
      this.pct = Number(this.currentUser.profileCompleteness);
      if (this.currentUser.status == 'Active') {
        this.topMatches = this.currentUser.matchId.split(',',this.currentUser.matchShowLimit);
        this.topMatchPct = this.currentUser.matchPercentage.split(',',this.currentUser.matchShowLimit);
        return true;
      }
    }
    getTopMatches(Id) {
      return this.users.filter(user => user.userId.toString()==Id);
    }

    getCurrentUser() {
        if(localStorage.getItem('usertype')=='1' || (localStorage.getItem('usertype')=='0' && localStorage.getItem('gender')=='Male')) {
          this.service.getMaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
            this.currentUser = data;
            //this.pct = this.profilePercentage(this.currentUser);
          });
          this.service.getFemaleUserList().subscribe(data=>{
            this.users = data;
          });
      }
      else if(localStorage.getItem('usertype')=='2' || (localStorage.getItem('usertype')=='0' && localStorage.getItem('gender')=='Female')) {
          this.service.getFemaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
            this.currentUser = data;
            //this.pct = this.profilePercentage(this.currentUser,false);
          });
          this.service.getMaleUserList().subscribe(data=>{
            this.users = data;
          });
      }
    }
    getU() {
      if(localStorage.getItem('usertype')=='0') {
        if(localStorage.getItem('userid') != this.gotid) {
          this.getCurrentUser();
          this.gotid=localStorage.getItem('userid');
        }
      }
      return true;
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
    isAdmin() {
      return this.service.isAdmin();
    }

}
