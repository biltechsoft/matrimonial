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
    locked = false;
    anyidAccepted = false;
    acceptedIds;
    lockedProfile;
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
    reverseGenderMap(gender) {
      return (gender=='Male' ? '2' : '1');
    }
    
    requestInfo(user) {
      if(this.currentUser.gender == "Male") {
        var val = { id: user.matchingId, statusReq: 1 };
        this.service.updateMatching(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
          this.getCurrentUser(this.userid, this.usertype);
        });
      }
      else { 
        var val = { id: user.matchingId, statusReq: 2 };
        this.service.updateMatching(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
          this.getCurrentUser(this.userid, this.usertype);
        });
      }  
    }
    isReqSent(user) {
      if(this.currentUser.reqSent == null) { return false; }
      else { return this.currentUser.reqSent.split(',').includes(user.userId.toString()); }
    }
    giveAccess(user) {
      var val = { id: user.matchingId, statusReq: 3 };
        this.service.updateMatching(val).subscribe(res=>{
          //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
          this.getCurrentUser(this.userid, this.usertype);
        });
      
      
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
    lockRequest(reqLock){
      Swal.fire({
        title: 'Surely, You want to send LOCK request?',
        text: "",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, Sure!'
      }).then((result) => {
        if (result.isConfirmed) {
          var val = { id: reqLock, statusReq: this.currentUser.gender=='Male' ? 5 : 6};
          this.service.updateMatching(val).subscribe(res=>{
            //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
            this.getCurrentUser(this.userid, this.usertype);
          });
        }
      })
    }
    cancelLockRequest() {
      var val = { id: this.lockedProfile[0].matchingId, statusReq: 3};
      this.service.updateMatching(val).subscribe(res=>{
        //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
        this.getCurrentUser(this.userid, this.usertype);
        this.locked=false;
        Swal.fire({
          title: 'LOCK Request Cancelled',
          text: "",
          icon: 'success',
          confirmButtonColor: '#3085d6'
        })
      });
    }
    unlockRequest() {
      Swal.fire({
        title: 'Surely, You want to reject this ID and send UNLOCK request?',
        text: "",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, Sure!'
      }).then((result) => {
        if (result.isConfirmed) {
          var val = { id: this.lockedProfile[0].matchingId, statusReq: this.currentUser.gender=='Male' ? 8 : 9};
          this.service.updateMatching(val).subscribe(res=>{
            //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
            this.getCurrentUser(this.userid, this.usertype);
          });
        }
      })
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
      var val = { id: user.matchingId, statusReq: 4 };
      this.service.updateMatching(val).subscribe(res=>{
        //if(res.toString() == 'Updated Successfully') { this.reqSentIndex.push(i); }
        this.getCurrentUser(this.userid, this.usertype);
      });
        
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

    clickConsole() {
      var pas = this.service.mDecrypt('VFZSSmVrNUJQVDA9');
      console.log(pas);
    }

    getCurrentUser(userid,usertype) {
        if(usertype=='1') {
          this.service.getMaleUserList(userid).subscribe(data=>{
            this.currentUser = data;
            this.PhotoFilePath=this.service.PhotoUrl+this.currentUser.photo;
            // this.topMatches = this.currentUser.matchId.split(',',this.currentUser.matchShowLimit);
            // this.topMatchPct = this.currentUser.matchPercentage.split(',',this.currentUser.matchShowLimit);
            // this.requested = (this.currentUser.reqAccepted+','+this.currentUser.reqSent
            //   +','+this.currentUser.reqRejected).split(',').filter(x => x !== null);
            // this.reqAccepted = this.currentUser.reqAccepted ? this.currentUser.reqAccepted.split(',') : this.currentUser.reqAccepted;
            // //this.pct = this.profilePercentage(this.currentUser);
            // this.service.getFemaleUserList().subscribe(dat=>{
            //   this.users = dat;
            //   this.topMatcheUsers = dat.filter(user => this.topMatches.includes(user.userId.toString()));
            //   this.requestedUsers = dat.filter(user => this.requested.includes(user.userId.toString()));
            // });
            this.service.getTopMatchFemales(this.currentUser.userId).subscribe(dat=>{

              this.topMatcheUsers = dat["Matching"];
              this.acceptedIds = this.topMatcheUsers.filter(x => (x.statusReq==3||x.statusReq>4) && x.status==this.profileStatus[2]);
              this.anyidAccepted = this.acceptedIds.length > 0;
              this.lockedProfile = this.topMatcheUsers.filter(x => x.statusReq == 5||x.statusReq == 7 ||x.statusReq == 8);
              if(this.lockedProfile.length>0){
                this.locked=true;
              
              }
            });
          });
          
      }
      else if(usertype=='2') {
          this.service.getFemaleUserList(userid).subscribe(data=>{
            this.currentUser = data;
            this.PhotoFilePath=this.service.PhotoUrl+this.currentUser.photo;
            //this.topMatchPct = this.currentUser.matchPercentage.split(',',this.currentUser.matchShowLimit);
            // this.requested = (this.currentUser.reqAccepted+','+this.currentUser.reqSent
            //   +','+this.currentUser.reqRejected).split(',').filter(x => x !== null);
            // this.reqAccepted = this.currentUser.reqAccepted ? this.currentUser.reqAccepted.split(',') : this.currentUser.reqAccepted;
            
            this.service.getTopMatchMales(this.currentUser.userId).subscribe(dat=>{
              this.topMatcheUsers = dat["Matching"];
              this.acceptedIds = this.topMatcheUsers.filter(x => (x.statusReq==3 ||x.statusReq>4) && x.status==this.profileStatus[2]);
              this.anyidAccepted = this.acceptedIds.length > 0;
              this.lockedProfile = this.topMatcheUsers.filter(x => x.statusReq == 6||x.statusReq == 7 ||x.statusReq == 9);
              if(this.lockedProfile.length>0){
                this.locked=true;
              
              }
            });

            /*this.service.getMatchingList().subscribe(dat=>{
              var matches = dat.filter(user => user.femaleId==this.currentUser.userId);
              var sortedMatches = matches.sort((a,b) => b.percentage - a.percentage);
              for(let i=0; i<this.currentUser.matchShowLimit; i++) {
                this.topMatches[i] = sortedMatches[i].maleId;
                this.topMatchPct[i] = sortedMatches[i].percentage;
              }
              this.topMatches = sortedMatches;
              this.service.getMaleUserList().subscribe(dat=>{
                this.users = dat;
                this.topMatcheUsers = dat.filter(user => this.topMatches.includes(user.userId));
                this.requestedUsers = dat.filter(user => this.requested.includes(user.userId.toString()));
              });
              //this.requestedUsers = dat.filter(user => this.requested.includes(user.userId.toString()));
            });*/

            //this.topMatches = this.currentUser.matchId.split(',',this.currentUser.matchShowLimit);
            //this.pct = this.profilePercentage(this.currentUser,false);
              /*this.service.getMaleUserList().subscribe(dat=>{
                this.users = dat;
                //this.topMatcheUsers = dat.filter(user => this.topMatches.includes(user.userId.toString()));
                this.requestedUsers = dat.filter(user => this.requested.includes(user.userId.toString()));
              });*/
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
