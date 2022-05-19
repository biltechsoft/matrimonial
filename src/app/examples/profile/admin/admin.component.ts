import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  constructor(private http:HttpClient,
              private service:SharedService,
              private router : Router) { }
  adminusers: any=  [];
  maleusers: any=  [];
  femaleusers: any=  [];
  users: any=[];
  matchingtables: any=[];
  allpost: any=[];

  adminUser;
  modalTitle="";
  AdminId=0;
  AdminUserName="";
  AdminPass="";
  AdminFullName="";
  AdminLevel="";
  AdminStatus="";
  superadmin=1;

  PostId=0;
  PostCode="";
  PostType="";
  PageTitle="";
  PostPhoto="";
  PostStatus="";
  Params: any=[];
  Param1="";
  Param2="";
  Param3="";
  Param4="";
  Param5="";
  PhotoFilePath="";
  NewPhotoUploaded=false;
  ptype;

  PostTypeFilter:string="";
  PageTitleFilter:string="";
  allpostWithoutFilter: any=[];

  MatchingId =0;
  MatchingIndicator=null;
  MalePoint=null;
  FemalePoint=null;
  MatchingDetails=null;

  FullName=null;
  CellPhone=null;
  Email=null;
  DateOfBirth=null;

  requestId=[0];
  //alerts = this.notify.alerts;
  acceptedIndex: any=[];
  rejectedIndex: any=[];
  matchingVar = "Matching is being Processed...";

  viewMoreString;
  maxPostDetailLen=40;
  maxPhotoNameLen=15;


  ngOnInit(): void {
    this.ptype = this.postTypes[0];
    this.service.loginauth();
    this.refreshList();
    this.getCurrentAdmin();
    //this.activeMenu(localStorage.getItem('menuadmin'));
  }
  refreshList(){
    this.service.getAdminList().subscribe(data=>{
        this.adminusers=data;
    });
    this.refreshMaleList();
    this.refreshFemaleList();
    this.refreshMatchingTable();
    this.refreshPost();
  }
  refreshMaleList() {
    this.service.getMaleUserList().subscribe(data=>{
      this.maleusers = data;
      this.users=data;
    });
  }
  refreshFemaleList() {
    this.service.getFemaleUserList().subscribe(data=>{
      this.femaleusers = data;
      this.users=data;
    });
  }
  refreshMatchingTable() {
    this.service.getMatchingTable().subscribe(data=>{
      this.matchingtables = data;
    });
  }
  refreshPost() {
    this.service.getPostList().subscribe(data=>{
      this.allpost = data;
      this.allpostWithoutFilter=data;
    });
  }
  getCurrentAdmin() {
      this.service.getAdminList(Number(localStorage.getItem('adminid'))).subscribe(data=>{
        this.adminUser = data;
        if(this.adminUser.adminUserName == "munasuperadmin") {
          this.menu[0].status=true;
          this.menu[1].status=false;
          this.superadmin=0;
        }
      });
  }

  activeMenu(item) {
    for(var i=0; i<this.menu.length; i++) {
      this.menu[i].status = (i == item);
      if(i == item) {
        this.menu[i].sub = !this.menu[i].sub;
      }
      else {
        this.menu[i].sub = false;
      }
    }
    this.refreshList();
    //localStorage.setItem('menuadmin', item);
  }

  addClick(i){
    if(this.menu[0].status) {
      this.modalTitle="Add Admin";
      this.AdminId=0;
      this.AdminUserName="";
      this.AdminPass="";
      this.AdminFullName="";
      this.AdminLevel="";
      this.AdminStatus="";
    }
    else if(this.menu[6].status) {
      this.modalTitle="Add Post";
      this.PostId=0;
      this.PostCode='0000';
      this.PostType=null;
      this.PageTitle=null;
      this.PostPhoto=null;
      this.PostStatus=null;
      this.Params = [null, null, null, null, null];
      this.PhotoFilePath="";
      this.NewPhotoUploaded=false;
    }


    this.matchingVar = "Matching is being Processed...";
    if(this.menu[1].status && i==0) {  //i=0 for submenu 'Run Matching'
      this.service.makeMatching().subscribe(res=>{
        if(res.toString().includes('Done')) { this.matchingVar = 'Matching Done!'; }
      });
    }
  }

  editClick(admin:any){
    if(this.menu[0].status) {
      this.modalTitle="Edit Admin";
      this.AdminId=admin.adminId;
      this.AdminUserName=admin.adminUserName;
      this.AdminPass=admin.adminPass;
      this.AdminFullName=admin.adminFullName;
      this.AdminLevel=admin.adminLevel;
      this.AdminStatus=admin.adminStatus;
    }
    else if(this.menu[6].status) {
      var post = admin;
      this.modalTitle="Edit Post";
      this.PostId=post.postId;
      this.PostCode=post.postCode;
      this.PostType=post.postType;
      this.PageTitle=post.pageTitle;
      this.PostPhoto=post.postPhoto;
      this.PostStatus=post.postStatus;
      this.Params[0]=post.param1;
      this.Params[1]=post.param2;
      this.Params[2]=post.param3;
      this.Params[3]=post.param4;
      this.Params[4]=post.param5;
      this.PhotoFilePath=this.service.PhotoUrl+post.postPhoto;
      this.ptypechange();
    }
  }

  createClick(){
    var val={
      adminUserName:this.AdminUserName,
      adminPass:this.AdminPass,
      adminFullName:this.AdminFullName,
      adminLevel:this.AdminLevel,
      adminStatus:this.AdminStatus
    };
    this.service.addAdminUser(val).subscribe(res=>{
      alert(res.toString());
      this.refreshList();
    });
  }
  createUser() {
    var val= {
      fullName: this.FullName,
      email: this.Email,
      gender: 'Male',
      cellPhone: this.CellPhone,
      dateOfBirth: this.DateOfBirth,
      age:this.service.getAge(this.DateOfBirth),
      userPass: this.service.mEncrypt('1234'),  //default password 1234
      matchShowLimit:5,
      status:"Inactive",
      openingDate:this.service.getDateTime(),
      lastEdit:this.service.getDateTime()
    };
    if(this.menu[2].status) {
      this.service.addMaleUser(val).subscribe(res=>{
        alert(res.toString());
        this.refreshList();
      });
    }
    if(this.menu[3].status) {
      val.gender = 'Female';
      this.service.addFemaleUser(val).subscribe(res=>{
        alert(res.toString());
        this.refreshList();
      });
    }
  }

  addPostClick() {
    if(this.NewPhotoUploaded) { this.updatePost(); }
    else { this.createPost(); }
  }
  createPost(){
    var val={
      postCode: this.PostCode,
      pageTitle: this.PageTitle,
      postType: this.PostType,
      postPhoto: this.PostPhoto,
      postStatus: this.PostStatus,
      param1: this.Params[0],
      param2: this.Params[1],
      param3: this.Params[2],
      param4: this.Params[3],
      param5: this.Params[4]
    };
    this.service.addPost(val).subscribe(res=>{
      alert(res.toString());
      this.refreshList();
    });
  }
  updatePost(){
    var val={
      postId: this.PostId,
      postCode: this.PostCode,
      pageTitle: this.PageTitle,
      postType: this.PostType,
      postPhoto: this.PostPhoto,
      postStatus: this.PostStatus,
      param1: this.Params[0],
      param2: this.Params[1],
      param3: this.Params[2],
      param4: this.Params[3],
      param5: this.Params[4]
    };
    this.service.updatePost(val).subscribe(res=>{
      alert(res.toString());
      this.refreshPost();
    });
  }
  deletePost(post){
    if(confirm('Are you sure?')){
    this.service.deletePost(post.postId).subscribe(res=>{
      this.service.deletePhoto({id:1,filetodel:post.PostPhoto}).subscribe();
      alert(res.toString());
      this.refreshPost();
    });
    }
  }
  ptypechange() {
    for(var i=0; i<this.postTypes.length; i++) {
      if(this.postTypes[i].name == this.PostType) {
        this.ptype = this.postTypes[i];
      }
    }
  }
  editUser(currentUser) {
    localStorage.setItem('userid',currentUser.userId);
    localStorage.setItem('gender',currentUser.gender);
    //this.router.navigate(['/edit-profile']);
  }
  updateClick(){
    var val={
      adminId:this.AdminId,
      adminUserName:this.AdminUserName,
      adminPass:this.AdminPass,
      adminFullName:this.AdminFullName,
      adminLevel:this.AdminLevel,
      adminStatus:this.AdminStatus
    };
    this.service.updateAdminUser(val).subscribe(res=>{
      alert(res.toString());
      this.refreshList();
    });
  }

  updateUser(user) {
    var val = {
      userId: user.userId,
      matchShowLimit: user.matchShowLimit,
      status: user.status
    }
    if(user.gender=='Male') {
      this.service.updateMaleUser(val).subscribe(res=>{
        this.refreshList();
      });
    }
    else {
      this.service.updateFemaleUser(val).subscribe(res=>{
        this.refreshList();
      });
    }
  }
  deleteClick(id:any){
    if(confirm('Are you sure?')){
    this.service.deleteAdminUser(id).subscribe(res=>{
      alert(res.toString());
      this.refreshList();
    });
    }
  }
  deleteUser(usr){
    if(confirm('Are you sure?')){
      if(usr.gender == 'Female') {
        this.service.deleteFemaleUser(usr.userId).subscribe(res=>{
          alert(res.toString());
          this.refreshFemaleList();
        });
      }
      else {
        this.service.deleteMaleUser(usr.userId).subscribe(res=>{
          alert(res.toString());
          this.refreshMaleList();
        });
      }
    }
  }
  editMatchingClick(matching:any){
    this.modalTitle="Edit Matching Point";
    this.MatchingId=matching.matchingId;
    this.MatchingIndicator=matching.matchingIndicator;
    this.MalePoint=matching.malePoint;
    this.FemalePoint=matching.femalePoint;
    this.MatchingDetails=matching.matchingDetails;
  }
  updateMatchingClick(){
    var val={
      matchingId:this.MatchingId,
      matchingIndicator:this.MatchingIndicator,
      malePoint:this.MalePoint,
      femalePoint:this.FemalePoint,
      matchingDetails:this.MatchingDetails
    };

    this.service.updateMatchingTable(val).subscribe(res=>{
      alert(res.toString());
      this.refreshList();
    });
  }

  anyRequest(user) {
    if (user.status == 'Pending') { return true; }
    else if (user.reqSent != null) {
      return true;
    }
  }
  requestIndex(user) {
    if (user.status == 'Pending') { return 0; }
    else if (user.reqSent != null) {
      return 1;
    }
  }

  profileActivate(user,i) {
    if(user.gender == 'Male') {
      var val = { userId: user.userId, status: 'Active' };
      this.service.updateMaleUser(val).subscribe(res=>{
        //alert(res.toString());
        //this.refreshMaleList();
        if(res.toString() == 'Updated Successfully') { this.acceptedIndex.push(i); }
      });
    }
    else if(user.gender == 'Female') {
      var val = { userId: user.userId, status: 'Active' };
      this.service.updateFemaleUser(val).subscribe(res=>{
        //alert(res.toString());
        //this.refreshFemaleList();
        if(res.toString() == 'Updated Successfully') { this.acceptedIndex.push(i); }
      });
    }
  }
  profileReject(user,i) {
    if(confirm('Are you sure you want to reject the request?')){
      if(user.gender == 'Male') {
        var val = { userId: user.userId, status: 'Inactive' };
        this.service.updateMaleUser(val).subscribe(res=>{
          //alert(res.toString());
          //this.refreshMaleList();
          if(res.toString() == 'Updated Successfully') { this.rejectedIndex.push(i); }
        });
      }
      else if(user.gender == 'Female') {
        var val = { userId: user.userId, status: 'Inactive' };
        this.service.updateFemaleUser(val).subscribe(res=>{
          //alert(res.toString());
          //this.refreshFemaleList();
          if(res.toString() == 'Updated Successfully') { this.rejectedIndex.push(i); }
        });
      }
    }
  }
  actionPerformed(i) {
    if(this.acceptedIndex.includes(i)) { return 'Accepted'; }
    else if(this.rejectedIndex.includes(i)) { return 'Rejected'; }
    else { return ''; }
  }

  viewMore(string) {
    this.viewMoreString = string;
  }
  uploadPhoto(event:any){
    if(this.PostId!=0 && !(this.PostPhoto=="" || this.PostPhoto==null)) {
      this.service.deletePhoto({id:1,filetodel:this.PostPhoto}).subscribe();
    }
    var file=event.target.files[0];
    const formData:FormData=new FormData();
    formData.append('uploadedFile',file,file.name);

    this.service.UploadPhoto(formData).subscribe((data:any)=>{
      this.PostPhoto = data.toString();
      this.PhotoFilePath=this.service.PhotoUrl+data.toString();
      if(this.PostId==0) { this.createPost(); }
      else { this.updatePost(); }
      this.NewPhotoUploaded=true;
    });
  }

  FilterFn(){
    var PostTypeFilter = this.PostTypeFilter;
    var PageTitleFilter = this.PageTitleFilter;

    this.allpost = this.allpostWithoutFilter.filter(function (el:any){
        return el.postType.toString().toLowerCase().includes(
          PostTypeFilter.toString().trim().toLowerCase()
        )
    });
  }


  menu = [
    {
      id: 0,
      name: "Admin Panel",
      submenu: ['Create Admin'],
      status: false,  //for demonstrating this item section
      sub: false  //for showing submenu
    },
    {
      id: 1,
      name: "Dashboard",
      submenu: ['Run Matching'],
      status: true,
      sub: false
    },
    {
      id: 2,
      name: "Male User",
      submenu: ['Create Male User'],
      status: false,
      sub: false
    },
    {
      id: 3,
      name: "Female User",
      submenu: ['Create Female User'],
      status: false,
      sub: false
    },
    {
      id: 4,
      name: "Matching Criteria",
      submenu: [],
      status: false,
      sub: false
    },
    {
      id: 5,
      name: "Message",
      submenu: [],
      status: false,
      sub: false
    },
    {
      id: 6,
      name: "Site Management",
      submenu: ['Add Post'],
      status: false,
      sub: false
    },
  ];

  requestType = ["Profile Activation Request", "View Matching Profile"];

  profileStatus = ['Inactive','Pending','Active','Deactivated'];

  topMatchLimits = [5,6,7,8,9,10];

  postSTATUS = ['Active', 'Inactive'];

  pageTitles = ['Home', 'Services', 'Events', 'About Us', 'FAQ', 'Donate', 'Contact Us'];

  postTypes = [
    {
      id: 0,
      name: "Banner",
      param: ['Website Title', 'Website Slogan'],
      paramlen: ['1', '1'],
      status: false //for showing submenu
    },
    {
      id: 1,
      name: "Slider",
      param: ['Caption'],
      paramlen: ['1'],
      status: false //for showing submenu
    },
    {
      id: 2,
      name: "Heading",
      param: ['Heading'],
      paramlen: ['5'],
      status: false //for showing submenu
    },
    {
      id: 3,
      name: "Service",
      param: ['Service Name', 'Service Icon', 'Service Details'],
      paramlen: ['1', '1', '10'],
      status: false //for showing submenu
    },
    {
      id: 4,
      name: "Event",
      param: ['Caption', 'Date & Time', 'Event Venue', 'Event Details'],
      paramlen: ['1', '1', '1', '15'],
      status: false //for showing submenu
    },
    {
      id: 5,
      name: "About",
      param: ['Mission', 'Vision', 'Program Heading', 'Program List'],
      paramlen: ['1', '5', '5', '15'],
      status: false //for showing submenu
    },
    {
      id: 6,
      name: "Team",
      param: ['Name', 'Designation', 'Links'],
      paramlen: ['1', '1', '10'],
      status: false //for showing submenu
    },
    {
      id: 7,
      name: "FAQ",
      param: ['Question', 'Answer'],
      paramlen: ['5', '10'],
      status: false //for showing submenu
    },
    {
      id: 8,
      name: "Donate",
      param: ['Link'],
      paramlen: ['1'],
      status: false //for showing submenu
    },
    {
      id: 9,
      name: "Contact",
      param: ['Address', 'Phone', 'Email', 'Social', 'Map'],
      paramlen: ['5', '1', '1', '5', '5'],
      status: false //for showing submenu
    }];



}
