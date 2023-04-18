import { Component, OnInit } from '@angular/core';
import {SharedService} from 'app/shared.service';
import { Router, ActivatedRoute } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-deactivate-profile',
  templateUrl: './deactivate-profile.component.html',
  styleUrls: ['./deactivate-profile.component.css']
})
export class DeactivateProfileComponent implements OnInit {

  constructor(private service:SharedService, private router : Router,
    private arout : ActivatedRoute) { }

  userid; usertype;
  currentUser; PhotoFilePath;
  profileStatus = this.service.profileStatus;
  msg = "blank";
  maleusers; femaleusers;

  ngOnInit(): void {
    this.userid = Number(this.arout.snapshot.paramMap.get("id"));
    this.usertype = this.arout.snapshot.paramMap.get("g");
    this.service.loginauth(this.userid, this.usertype);
    this.getCurrentUser(this.userid, this.usertype);
    //this.refreshFemaleList();
    //this.refreshMaleList();
  }

  getCurrentUser(userid,usertype) {
    if(usertype=='1') {
      this.service.getMaleUserList(userid).subscribe(data=>{
        this.currentUser = data;
        this.PhotoFilePath=this.service.PhotoUrl+this.currentUser.photo;
        this.deactivate_user();
      });
    }
    else if(usertype=='2') {
        this.service.getFemaleUserList(userid).subscribe(data=>{
          this.currentUser = data;
          this.PhotoFilePath=this.service.PhotoUrl+this.currentUser.photo;
          this.deactivate_user();
        });
    }
  }

  refreshMaleList() {
    this.service.getMaleUserList().subscribe(data => {
      var a = data.filter(user => user.userId > 98); //dummy profile upto 98
      this.maleusers = a;
    });
  }
  refreshFemaleList() {
    this.service.getFemaleUserList().subscribe(data => {
      var a = data.filter(user => user.userId > 32);
      this.femaleusers = a;
    });
  }

  deleteRequest() {

  }

  deactivate_user() {
    //this.msg="in deactivate function";this.msg="in deactivate function";
    var val = { userId: this.currentUser.userId,
      status: this.profileStatus[4] 
    };
    
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this! Your profile will not be visible to others anymore and You will not be able to view others' profile.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, Deactivate!'
    }).then((result) => {
      if (result.isConfirmed) {
        if(this.currentUser.gender == 'Male') {
          this.service.updateMaleUser(val).subscribe(res=>{
            if(res.toString() == 'Updated Successfully') { 
              Swal.fire('Profile Deactivated!', 'Your profile is deactivated and will not be visible to others, nor will be considered for further matching. You can contact admin to activate you profile again.','warning');
            }
            this.deleteRequest();
          });
        }
        else if(this.currentUser.gender == 'Female') {
          this.service.updateFemaleUser(val).subscribe(res=>{
            if(res.toString() == 'Updated Successfully') { 
              Swal.fire('Profile Deactivated!', 'Your profile is deactivated and will not be visible to others, nor will be considered for further matching. You can contact admin to activate you profile again.','warning');
            }
          });
        }
      }
      this.router.navigate(['/user-profile',this.usertype,this.currentUser.userId]);
    })
    
  }

}
