import { Component, OnInit } from '@angular/core';
import {SharedService} from 'app/shared.service';
import { Router, ActivatedRoute } from '@angular/router';
import Swal from 'sweetalert2';
//import { threadId } from 'worker_threads';

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
    topMatches; topMatcheUsers;
    topMatchPct;
    requested; requestedUsers;
    reqAccepted;
    reqLock;
    users;
    matchUsers;
    PhotoUrl = this.service.PhotoUrl;
    pad=false;
    reqSentIndex;
    userid; usertype;
    ruser; ri; //for rejectAccess (user, i)
    rejectNote=0;
    rejectionNote = this.service.rejectionNote;
    profileStatus = this.service.profileStatus;
    unlockMsg = "I would like to request to UNLOCK my ID. I am not interested with the person anymore with whom my ID is temporarily LOCKED.";

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
          this.getCurrentUser(this.userid, this.usertype);
        });
      }
      else if(this.currentUser.gender == 'Female') {
        this.service.updateFemaleUser(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
          this.getCurrentUser(this.userid, this.usertype);
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
      //for giving requested id access too
      if(user.reqSent == null || user.reqSent == this.currentUser.userId.toString()) { user.reqSent = null; }
      else {
        var newReqSent2 = user.reqSent.split(',').filter(x => x !== this.currentUser.userId.toString());
        user.reqSent = newReqSent2[0];
        for(var r=1; r<newReqSent2.length; r++) {
          user.reqSent += ',' + newReqSent2[r];
        }
      }
      if(user.reqAccepted == null) { user.reqAccepted = ""; }
      else { user.reqAccepted += ","; }
      var val = { userId: this.currentUser.userId,
                  reqSent: this.currentUser.reqSent,
                  reqAccepted: this.currentUser.reqAccepted += user.userId };
      var val2 = { userId: user.userId,
                  reqSent: user.reqSent,
                  reqAccepted: user.reqAccepted += this.currentUser.userId };
      if(this.currentUser.gender == 'Male') {
        this.service.updateMaleUser(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
          this.service.updateFemaleUser(val2).subscribe(); //for giving requested id access too
        });
      }
      else if(this.currentUser.gender == 'Female') {
        this.service.updateFemaleUser(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
          this.service.updateMaleUser(val2).subscribe();  //for giving requested id access too
        });
      }
      //add admin activity
      var logval = {
        adminId: Number(localStorage.getItem('adminid')),
        userId: this.userid,
        userType: this.usertype,
        xuserId: user.userId,
        action: 4,  //from this.service.actionType
        description: 'accepted profile request',
        note: null,
        actionTime: this.service.getDateTime()
      }
      this.service.addAdminLog(logval).subscribe();
    }
    isReqAccepted(user) {
      if(this.currentUser.reqAccepted == null) { return false; }
      else { return this.currentUser.reqAccepted.split(',').includes(user.userId.toString()); }
    }
    isReqRejected(user) {
      if(this.currentUser.reqRejected == null) { return false; }
      else { return this.currentUser.reqRejected.split(',').includes(user.userId.toString()); }
    }
    //ruser; ri; //for rejectPP / profileReject (user, i)
    clickReject(user,i) {
      this.ruser = user;
      this.ri = i;
    }
    rejectAccess(user,i) {
      //if(confirm('Are you sure you want to reject the request?')) {
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
        //create rejection for both id
        if(user.reqSent == null || user.reqSent == this.currentUser.userId.toString()) { user.reqSent = null; }
        else {
          var newReqSent2 = user.reqSent.split(',').filter(x => x !== this.currentUser.userId.toString());
          user.reqSent = newReqSent2[0];
          for(var r=1; r<newReqSent2.length; r++) {
            user.reqSent += ',' + newReqSent[r];
          }
        }
        if(user.reqRejected == null) { user.reqRejected = ""; }
        else { user.reqRejected += ","; }
        var val = { userId: this.currentUser.userId,
                    reqSent: this.currentUser.reqSent,
                    reqRejected: this.currentUser.reqRejected += user.userId };
        var val = { userId: user.userId,
                    reqSent: user.reqSent,
                    reqRejected: user.reqRejected += this.currentUser.userId };
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
        //add admin activity
        var logval = {
          adminId: localStorage.getItem('adminid'),
          userId: this.userid,
          userType: this.usertype,
          xuserId: user.userId,
          action: 5,  //from this.service.actionType
          description: 'rejected profile request',
          note: this.rejectNote,
          actionTime: this.service.getDateTime()
        }
        this.service.addAdminLog(logval).subscribe();
      //}
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
      var iduser = this.users.filter(user => user.userId.toString()==Id);
      if(iduser.length>0) {
        return iduser;
      } else {
        return 0;
      }
      
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
            this.reqAccepted = this.currentUser.reqAccepted ? this.currentUser.reqAccepted.split(',') : this.currentUser.reqAccepted;
            //this.pct = this.profilePercentage(this.currentUser);
            this.service.getFemaleUserList().subscribe(dat=>{
              this.users = dat;
              this.topMatcheUsers = dat.filter(user => this.topMatches.includes(user.userId.toString()));
              this.requestedUsers = dat.filter(user => this.requested.includes(user.userId.toString()));
            });
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
            this.reqAccepted = this.currentUser.reqAccepted ? this.currentUser.reqAccepted.split(',') : this.currentUser.reqAccepted;
              //this.pct = this.profilePercentage(this.currentUser,false);
              this.service.getMaleUserList().subscribe(dat=>{
                this.users = dat;
                this.topMatcheUsers = dat.filter(user => this.topMatches.includes(user.userId.toString()));
                this.requestedUsers = dat.filter(user => this.requested.includes(user.userId.toString()));
              });
          });
          
      }
    }

    getName(Id) {
      return this.users.filter(user => user.userId.toString() == Id)[0].fullName;
    }
    toggleGender(gender) {
      return (gender=='Male' ? 'Female' : 'Male');
    }

    isLocked(Id) {
      return this.users.filter(user => user.userId.toString() == Id)[0].status == this.profileStatus[3];
    }
    requestLock() {   
      var val = {
        userId: this.currentUser.userId,
        reqLock: this.reqLock
      };

      if (this.currentUser.gender == 'Male') {
        this.service.updateMaleUser(val).subscribe(res => {
          //this.getCurrentUser(this.userid, this.usertype);
          alert(res.toString());
        });
      }
      else {
        this.service.updateFemaleUser(val).subscribe(res => {
          //this.getCurrentUser(this.userid, this.usertype);
        });
      }
    }

    sendMessage(LOCK) {
      var msg = this.unlockMsg;
      if(LOCK) {
        msg = 'I would like to request to LOCK my ID with the following ID: \n' +
                this.toggleGender(this.currentUser.gender) + ' ID : ' + this.reqLock + ' - ' + this.getName(this.reqLock) + 
                '\n\nMy Information:\n' +
                this.currentUser.gender+ ' ID : ' + this.currentUser.userId + ' - ' + this.currentUser.fullName;
      }
      var val={
        senderId:this.currentUser.fullName,
        userType:this.usertype,
        senderEmail:this.currentUser.email,
        messageDetail:msg,
        dateTime:this.service.getDateTime()
      };
  
      this.service.addMessage(val).subscribe(res=>{
        if(res.toString().includes('Successfully')) {
          //alert("Your message is sent! Admin will reply through your email ASAP!");
          Swal.fire('Sent!', 'Your request is sent! Admin will take step ASAP!','success');
          
        }
        //alert(res.toString());
      });
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
