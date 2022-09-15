import { Component, OnInit } from '@angular/core';
import {SharedService} from 'app/shared.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
    selector: 'app-profile',
    templateUrl: './profile.component.html',
    styleUrls: ['./profile.component.scss']
})

export class ProfileComponent implements OnInit {

    constructor(private service:SharedService, private router : Router,
    private arout : ActivatedRoute) { }

    currentUser;
    userId;
    val = false;
    gotid;
    PhotoFilePath;
    pct;  //percentage of profile completeness
    topMatches;
    topMatchPct;
    requested;
    users;
    matchUsers;
    PhotoUrl = this.service.PhotoUrl;
    pad=false;
    reqSentIndex;
    userid; usertype;

    ngOnInit() {
      this.userid = Number(this.arout.snapshot.paramMap.get("id"));
      this.usertype = this.arout.snapshot.paramMap.get("g");
      this.service.loginauth(this.userid, this.usertype);
      this.getCurrentUser(this.userid, this.usertype);
    }
    genderMap(gender) {
      return (gender=='Male' ? '1' : '2');
    }
    requestInfo(user,i) {
      if(this.currentUser.reqSent == null) { this.currentUser.reqSent = ""; }
      else { this.currentUser.reqSent += ","; }
      var val = { userId: this.currentUser.userId, reqSent: this.currentUser.reqSent+=user.userId };
      if(this.currentUser.gender == 'Male') {
        this.service.updateMaleUser(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
        });
      }
      else if(this.currentUser.gender == 'Female') {
        this.service.updateFemaleUser(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
        });
      }
    }
    isReqSent(user) {
      if(this.currentUser.reqSent == null) { return false; }
      else { return this.currentUser.reqSent.split(',').includes(user.userId.toString()); }
    }
    giveAccess(user,i) {
      //delete reqSent and add it to reqAccepted
      if(this.currentUser.reqSent == user.userId.toString()) { this.currentUser.reqSent = null; }
      else {
        var newReqSent = this.currentUser.reqSent.split(',').filter(x => x !== user.userId.toString());
        this.currentUser.reqSent = newReqSent[0];
        for(var r=1; r<newReqSent.length; r++) {
          this.currentUser.reqSent += ',' + newReqSent[r];
        }
      }
      if(this.currentUser.reqAccepted == null) { this.currentUser.reqAccepted = ""; }
      else { this.currentUser.reqAccepted += ","; }
      var val = { userId: this.currentUser.userId,
                  reqSent: this.currentUser.reqSent,
                  reqAccepted: this.currentUser.reqAccepted += user.userId };
      if(this.currentUser.gender == 'Male') {
        this.service.updateMaleUser(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
        });
      }
      else if(this.currentUser.gender == 'Female') {
        this.service.updateFemaleUser(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
        });
      }
    }
    isReqAccepted(user) {
      if(this.currentUser.reqAccepted == null) { return false; }
      else { return this.currentUser.reqAccepted.split(',').includes(user.userId.toString()); }
    }
    isReqRejected(user) {
      if(this.currentUser.reqRejected == null) { return false; }
      else { return this.currentUser.reqRejected.split(',').includes(user.userId.toString()); }
    }
    rejectAccess(user,i) {
      if(confirm('Are you sure you want to reject the request?')) {
        //delete reqSent and add it to reqRejected
        if(this.currentUser.reqSent == user.userId.toString()) { this.currentUser.reqSent = null; }
        else {
          var newReqSent = this.currentUser.reqSent.split(',').filter(x => x !== user.userId.toString());
          this.currentUser.reqSent = newReqSent[0];
          for(var r=1; r<newReqSent.length; r++) {
            this.currentUser.reqSent += ',' + newReqSent[r];
          }
        }
        if(this.currentUser.reqRejected == null) { this.currentUser.reqRejected = ""; }
        else { this.currentUser.reqRejected += ","; }
        var val = { userId: this.currentUser.userId,
                    reqSent: this.currentUser.reqSent,
                    reqRejected: this.currentUser.reqRejected += user.userId };
        if(this.currentUser.gender == 'Male') {
          this.service.updateMaleUser(val).subscribe(res=>{
            //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
          });
        }
        else if(this.currentUser.gender == 'Female') {
          this.service.updateFemaleUser(val).subscribe(res=>{
            //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
          });
        }
      }
    }
    setXuser(id) {
      localStorage.setItem('xuser',id.toString());
    }

    profileComplete() {
      this.pct = Number(this.currentUser.profileCompleteness);
      if (this.currentUser.status == 'Active') {

        return true;
      }
    }
    getTopMatches(Id) {
      return this.users.filter(user => user.userId.toString()==Id);
    }

    getCurrentUser(userid,usertype) {
        if(usertype=='1') {
          this.service.getMaleUserList(userid).subscribe(data=>{
            this.currentUser = data;
            this.PhotoFilePath=this.service.PhotoUrl+this.currentUser.photo;
            this.topMatches = this.currentUser.matchId.split(',',this.currentUser.matchShowLimit);
            this.topMatchPct = this.currentUser.matchPercentage.split(',',this.currentUser.matchShowLimit);
            this.requested = (this.currentUser.reqAccepted+','+this.currentUser.reqSent
              +','+this.currentUser.reqRejected).split(',').filter(x => x !== null);
            //this.pct = this.profilePercentage(this.currentUser);
          });
          this.service.getFemaleUserList().subscribe(data=>{
            this.users = data;
          });
      }
      else if(usertype=='2') {
          this.service.getFemaleUserList(userid).subscribe(data=>{
            this.currentUser = data;
            this.PhotoFilePath=this.service.PhotoUrl+this.currentUser.photo;
            this.topMatches = this.currentUser.matchId.split(',',this.currentUser.matchShowLimit);
            this.topMatchPct = this.currentUser.matchPercentage.split(',',this.currentUser.matchShowLimit);
            this.requested = (this.currentUser.reqAccepted+','+this.currentUser.reqSent
              +','+this.currentUser.reqRejected).split(',').filter(x => x !== null);
            //this.pct = this.profilePercentage(this.currentUser,false);
          });
          this.service.getMaleUserList().subscribe(data=>{
            this.users = data;
          });
      }
    }
    /*getU() {
      if(localStorage.getItem('usertype')=='0') {
        if(localStorage.getItem('userid') != this.gotid) {
          this.getCurrentUser(this.userid, this.usertype);
          this.gotid=localStorage.getItem('userid');
        }
      }
      return true;
    }*/
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
