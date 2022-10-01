import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import {SharedService} from 'app/shared.service';
import { Modal } from 'bootstrap';

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
  messages: any=[];
  allpost: any=[];
  adminLog: any=[];
  cuser=''; topMatches='';
  firstTime=true;

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

  MessageId;
  SenderName;
  SenderEmail;
  MessageDetail;
  MessageReply;
  MessageDateTime;
  ReplyDateTime;
  currentMessage;

  FullName=null;
  CellPhone=null;
  Email=null;
  DateOfBirth=null;

  requestId=[0];
  //alerts = this.notify.alerts;
  acceptedIndex: any=[];
  rejectedIndex: any=[];
  matchingVar = "Matching is being Processed...";
  rejectNote=0;
  rejectionNote = this.service.rejectionNote;
  ruser; ri; rtype //for rejectPP / profileReject (user, i) rtype (i.e PP/profile)

  viewMoreString;
  maxPostDetailLen=40;
  maxPhotoNameLen=15;


  ngOnInit(): void {
    this.ptype = this.postTypes[0];
    this.service.loginauth(0,'0');
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
    this.refreshMessage();
    this.refreshPost();
    this.refreshAdminLog();
    
    this.acceptedIndex=[];
    this.rejectedIndex=[];
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
  refreshMessage() {
    this.service.getMessageList().subscribe(data=>{
      var m = data;
      this.messages = m.sort((item2, item1) => item1.messageId - item2.messageId);
      this.currentMessage = this.messages[0];
    });
  }
  refreshPost() {
    this.service.getPostList().subscribe(data=>{
      var p = data;
      this.allpost = p.sort((item1, item2) => item1.postCode - item2.postCode);
      this.allpostWithoutFilter=data;
      this.getNewPostCode();
      this.FilterFn();
      //this.postTypes[1].newcode = this.allpost.filter(slider => slider.postCode.startsWith('0'))
    });
  }
  refreshAdminLog() {
    this.service.getAdminLogList().subscribe(data=>{
      var a = data;
      this.adminLog = a.sort((item2, item1) => item1.logId - item2.logId);
    });
  }

  getNewPostCode() {
    for (var i=0; i<this.postTypes.length; i++) {
      var items = this.allpost.filter(item => item.postCode.startsWith(this.postTypes[i].id.toString()));
      if(items != '') {
        var lastCode = items[items.length-1].postCode;
        this.postTypes[i].newcode = (Number(lastCode)+1).toString();
      }
    }
  }
  getCurrentAdmin() {
      this.service.getAdminList(Number(localStorage.getItem('adminid'))).subscribe(data=>{
        this.adminUser = data;
        if(this.adminUser.adminLevel == "TOP") {
          this.menu[0].status=true;
          this.menu[1].status=false;
          this.superadmin=0;
        }
      });
  }

  getAdminName(Id) {
    return this.adminusers.filter(admin => admin.adminId==Id)[0].adminFullName;
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

  addPostClick(id) {
    this.createPost(id);
  }
  requiredcheck(id) {
    if(this.PostCode == '' || this.PostCode == null) {
      alert('Post code cannot be empty!');
      return false;
    }
    else if(this.PageTitle == '' || this.PageTitle == null) {
      alert('Page Title must be selected!');
      return false;
    }
    else if(this.PostType == '' || this.PostType == null) {
      alert('Post Type must be selected!');
      return false;
    }
    else if(this.PostStatus == '' || this.PostStatus == null) {
      alert('Post Status must be selected!');
      return false;
    }
    else {
      var i=0;
      for(i=0; i<this.postTypes[id].param.length; i++) {
        if((this.Params[i] == '' || this.Params[i] == null) && (this.postTypes[id].required[i])) {
          alert(this.postTypes[id].param[i] + ' cannot be empty!');
          return false;
        }
      }
      if(this.postTypes[id].required[i] == -1 && (this.PostPhoto=="" || this.PostPhoto==null)) {
        alert('You must upload Photo!');
        return false;
      }
    }
    return true;
  }
  createPost(id){
    if(this.requiredcheck(id)){
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
  }
  updatePost(id){
    if(this.requiredcheck(id)){
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
  }
  deletePost(post){
    if(this.mustPost.includes(post.postCode)) {
      alert('This item cannot be deleted. You may edit this.');
    }
    else if(confirm('Are you sure you want to delete this?')){
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
        if(this.PostId==0) { this.PostCode = this.postTypes[i].newcode; }
      }
    }
  }

  replyMessage(message) {
    this.MessageId = message.messageId;
    this.SenderName = message.senderId;
    this.SenderEmail = message.senderEmail;
    this.MessageDetail = message.messageDetail;
    this.MessageReply = message.messageReply;
    this.MessageDateTime = message.dateTime;
    this.ReplyDateTime = message.replyDateTime;
    this.currentMessage = message;
  }
  sendReply() {
    var emailVal={
      subject: "Reply to Your Message from MUNA Matrimonial",
      message: this.MessageReply + "\n\nOn response to your message:\n\n \""
                + this.MessageDetail + "\"\nwrote on " + this.MessageDateTime,
      toEmail: [this.SenderEmail]
    };

    this.service.sendEmail(emailVal).subscribe(res=>{
      alert(res.toString());
    });

    this.currentMessage.messageReply=this.MessageReply;
    this.currentMessage.replyDateTime=this.service.getDateTime();

    this.service.updateMessage(this.currentMessage).subscribe(res=>{
      if(res.toString().includes('Successfully')) {
        alert("Your message has been sent to the user's email.");
      }
      //alert(res.toString());
    });
  }
  deleteMessage(message) {
    if(confirm('Are you sure?')){
      this.service.deleteMessage(message.messageId).subscribe(res=>{
        alert(res.toString());
        this.refreshList();
      });
    }
  }

  editUser(currentUser, ppchange=false) {
    localStorage.setItem('userid',currentUser.userId);
    localStorage.setItem('gender',currentUser.gender);
    localStorage.setItem('ppchange',ppchange.toString());
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
  getName(Id,gender) {
    if(gender=='Female' || gender=='1') {  //Female for getting matching gender and 1 for getting own gender
      return this.maleusers.filter(user => user.userId.toString()==Id)[0].fullName;
    }
    return this.femaleusers.filter(user => user.userId.toString()==Id)[0].fullName;
  }
  getUser(Id,gender) {
    if(gender=='Female') {
      return this.maleusers.filter(user => user.userId.toString()==Id)[0];
    }
    return this.femaleusers.filter(user => user.userId.toString()==Id)[0];
  }
  isLocked(Id,gender) {
    if(gender=='Female') {
      return this.maleusers.filter(user => user.userId.toString()==Id)[0].status == 'Locked';
    }
    return this.femaleusers.filter(user => user.userId.toString()==Id)[0].status == 'Locked';
  }
  updateUser(user) {
    if(user.status=='Locked' && user.lockedId==null) {
      this.cuser = user;
      this.topMatches = user.matchId.split(',');
      const element = document.getElementById('statusModal') as HTMLElement;
      const myModal = new Modal(element);
      myModal.show();
    }
    else {
      var val = {
        userId: user.userId,
        matchShowLimit: user.matchShowLimit,
        status: user.status,
        lockedId: (user.status=='Locked' ? Number(user.lockedId) : null),
        //reqRejected: ((user.status=='Active' && user.lockedId!=null) ? (user.reqRejected==null ? user.lockedId : user.reqRejected+','+user.lockedId) : user.reqRejected)
      }
      var val2 = {
        userId: Number(user.lockedId),
        status: (user.status=='Locked' ? 'Locked' : 'Active'),
        lockedId: (user.status=='Locked' ? user.userId : null),
        //reqRejected: (user.status=='Active' ? (nuser.reqRejected==null ? user.userId : nuser.reqRejected+','+user.userId) : nuser.reqRejected)
      }

      if(user.gender=='Male') {
        this.service.updateMaleUser(val).subscribe(res=>{
          this.refreshList();
        });
        if(user.lockedId != null) {
          /*var nuser = this.getUser(user.lockedId,user.gender);
          var val2 = {
            userId: Number(user.lockedId),
            status: (user.status=='Locked' ? 'Locked' : 'Active'),
            lockedId: (user.status=='Locked' ? user.userId : null),
            reqRejected: (user.status=='Active' ? (nuser.reqRejected==null ? user.userId : nuser.reqRejected+','+user.userId) : nuser.reqRejected)
          }*/
          this.service.updateFemaleUser(val2).subscribe(res=>{
            this.refreshList();
          });
        }
      }
      else {
        this.service.updateFemaleUser(val).subscribe(res=>{
          this.refreshList();
        });
        if(user.lockedId != null) {
          this.service.updateMaleUser(val2).subscribe(res=>{
            this.refreshList();
          });
        }
      }
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
    if (user.status == 'Pending' || user.album != null || user.tempGallery != null) {
      return true;
    }
    else if (user.reqSent != null) {
      return true;
    }
  }
  requestIndex(user) {
    if (user.status == 'Pending' || user.album != null || user.tempGallery != null) {
      if (user.status == 'Pending') { return 0; }
      else { return 2; }
    }
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
    //add admin activity
    var logval = {
      adminId: this.adminUser.adminId,
      userId: user.userId,
      userType: Number(this.genderMap(user.gender)),
      action: 1,  //from this.service.actionType
      description: 'rejected profile',
      note: this.rejectNote,
      actionTime: this.service.getDateTime()
    }
    this.service.addAdminLog(logval).subscribe();
    
  }
  changePP(user,i) {
    this.delTempPhoto(user);
    var val = {
      userId: user.userId,
      photo: (user.album!=null ? user.album : user.photo),
      gallery: (user.tempGallery!=null ? user.tempGallery : user.gallery),
      album: null,
      tempGallery: null
    };
    if(user.gender == 'Male') {
      this.service.updateMaleUser(val).subscribe(res=>{
        if(res.toString() == 'Updated Successfully') { this.acceptedIndex.push(i); }
      });
    }
    else if(user.gender == 'Female') {
      this.service.updateFemaleUser(val).subscribe(res=>{
        if(res.toString() == 'Updated Successfully') { this.acceptedIndex.push(i); }
      });
    }
    //add admin activity
    var logval = {
      adminId: this.adminUser.adminId,
      userId: user.userId,
      userType: Number(this.genderMap(user.gender)),
      action: 2,  //from this.service.actionType
      description: 'accepted profile/gallery picture',
      note: null,
      actionTime: this.service.getDateTime()
    }
    this.service.addAdminLog(logval).subscribe();
  }
  //ruser; ri; rtype //for rejectPP / profileReject (user, i) rtype (i.e PP/profile)
  clickReject(user,i,type) {
    this.ruser = user;
    this.ri = i;
    this.rtype = type; //type=0 for profileReject, type=1 for rejectPP
  }
  rejectPP(user,i) {
    this.delTempPhoto(user, false);
    var val = { userId: user.userId, album: null, tempGallery: null };
    if(user.gender == 'Male') {
      this.service.updateMaleUser(val).subscribe(res=>{
        if(res.toString() == 'Updated Successfully') { this.rejectedIndex.push(i); }
      });
    }
    else if(user.gender == 'Female') {
      this.service.updateFemaleUser(val).subscribe(res=>{
        if(res.toString() == 'Updated Successfully') { this.rejectedIndex.push(i); }
      });
    }
    //add admin activity
    var logval = {
      adminId: this.adminUser.adminId,
      userId: user.userId,
      userType: Number(this.genderMap(user.gender)),
      action: 3,  //from this.service.actionType
      description: 'rejected profile/gallery picture',
      note: this.rejectNote,
      actionTime: this.service.getDateTime()
    }
    this.service.addAdminLog(logval).subscribe();
  }
  delTempPhoto(user, accept=true) {
    var del = (user.album!=null ? (accept?user.photo:user.album) : '');
    if(del != '' && !this.service.constPhoto.includes(del)) {
      this.service.deletePhoto({id:1,filetodel:del}).subscribe();
    }
    if(user.tempGallery!= null) {
      var gal = user.gallery.split(',');
      var tmp = user.tempGallery.split(',');
      for (var i=0; i<gal.length; i++) {
        del = (gal[i]!=tmp[i] ? (accept?gal[i]:tmp[i]) : '');
        if(del != '' && !this.service.constPhoto.includes(del)) {
          this.service.deletePhoto({id:1,filetodel:del}).subscribe();
        }
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
  uploadPhoto(event:any, id){
    if(!(this.PostPhoto=="" || this.PostPhoto==null)) {
      this.service.deletePhoto({id:1,filetodel:this.PostPhoto}).subscribe();
    }
    var file=event.target.files[0];
    const formData:FormData=new FormData();
    formData.append('uploadedFile',file,file.name);

    this.service.UploadPhoto(formData).subscribe((data:any)=>{
      this.PostPhoto = data.toString();
      this.PhotoFilePath=this.service.PhotoUrl+data.toString();
      //if(this.PostId==0) { this.createPost(id); }
      //else { this.updatePost(id); }
      //this.NewPhotoUploaded=true;
    });
  }
  genderMap(gender) {
    return (gender=='Male' ? '1' : '2');
  }
  reverseGender(usertype) {
    return (usertype=='1' ? '2' : '1');
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
    {
      id: 7,
      name: "Activity",
      submenu: [],
      status: false,
      sub: false
    },
  ];

  requestType = ["Profile Activation Request", "View Matching Profile", "Change Profile/Gallery Picture"];

  profileStatus = ['Inactive','Pending','Active','Locked','Deactivated'];

  topMatchLimits = [5,6,7,8,9,10];

  postSTATUS = ['Active', 'Inactive'];

  serviceIcons = ['calendar', 'university', 'shopping-bag', 'book', 'child',
                  'question', 'user', 'film', 'home', 'file-o', 'flag', 'headphones',
                  'picture-o', 'pencil', 'play', 'pause', 'question', 'question-circle',
                  'info-circle', 'random', 'comment', 'external-link', 'sign-in',
                  'unlock', 'credit-card', 'cut', 'scissors', 'truck', 'magic',
                  'sitemap', 'umbrella', 'building-o', 'spinner', 'circle', 'file',
                  'xing', 'xing-square', 'gittip', 'gratipay', 'graduation-cap',
                  'language', 'automobile', 'car', 'cab', 'plug', 'slideshare',
                  'dashcube', 'heartbeat', 'street-view', 'hand-pointer-o',
                  'hand-peace-o', 'industry', 'map-pin', 'codiepie', 'shopping-basket',
                  'hashtag', 'audio-description', 'viadeo', 'handshake-o',
                  'drivers-license', 'id-badge', 'times-rectangle-o', 'window-close-o',
                  'envelope-open', 'id-card', 'address-card-o', 'universal-access'];

  adminLevels = ['TOP', 'MODERATOR'];

  pageTitles = ['Home', 'Services', 'Events', 'About Us', 'FAQ', 'Donate', 'Contact Us', 'Signup'];

  postTypes = [
    {
      id: 0,
      name: "Banner",
      param: ['Website Title', 'Website Slogan'],
      paramlen: ['1', '1'],
      required: [1,0],
      newcode: '0000',
      status: false //for showing submenu
    },
    {
      id: 1,
      name: "Slider",
      param: ['Caption'],
      paramlen: ['1'],
      required: [0,-1],  //for photo required, -1
      newcode: '1111',
      status: false //for showing submenu
    },
    {
      id: 2,
      name: "Heading",
      param: ['Heading'],
      paramlen: ['5'],
      required: [1],
      newcode: '2222',
      status: false //for showing submenu
    },
    {
      id: 3,
      name: "Service",
      param: ['Service Name', 'Service Icon', 'Service Details'],
      paramlen: ['1', '1', '10'],
      required: [1,1,1],
      newcode: '3333',
      status: false //for showing submenu
    },
    {
      id: 4,
      name: "Event",
      param: ['Caption', 'Date & Time', 'Event Venue', 'Event Details'],
      paramlen: ['1', '1', '1', '15'],
      required: [1,1,1,1,-1],
      newcode: '4444',
      status: false //for showing submenu
    },
    {
      id: 5,
      name: "About",
      param: ['Image Height', 'Mission', 'Vision', 'Program Heading', 'Program List'],
      paramlen: ['1', '1', '5', '5', '15'],
      required: [1,1,1,1,1,-1],
      newcode: '5000',
      status: false //for showing submenu
    },
    {
      id: 6,
      name: "Team",
      param: ['Name', 'Designation', 'Links'],
      paramlen: ['1', '1', '10'],
      required: [1,1,1],
      newcode: '6666',
      status: false //for showing submenu
    },
    {
      id: 7,
      name: "FAQ",
      param: ['Question', 'Answer'],
      paramlen: ['5', '10'],
      required: [1,1],
      newcode: '7777',
      status: false //for showing submenu
    },
    {
      id: 8,
      name: "Donate",
      param: ['Link'],
      paramlen: ['1'],
      required: [1],
      newcode: '8888',
      status: false //for showing submenu
    },
    {
      id: 90,
      name: "Contact",
      param: ['Address', 'Phone', 'Email', 'Social', 'Map'],
      paramlen: ['5', '1', '1', '5', '10'],
      required: [1,1,1,1,1],
      newcode: '9000',
      status: false //for showing submenu
    },
    {
      id: 91,
      name: "Privacy Policy",
      param: ['Privacy Policy'],
      paramlen: ['15'],
      required: [1],
      newcode: '9100',
      status: false //for showing submenu
    }];

  //the posts having following postCodes cannot be deleted, just can be edited.
  mustPost = ['0000',
              '3000',
              '4000',
              '4001',
              '4002',
              '4003',
              '4004',
              '5000',
              '5001',
              '6001',
              '6002',
              '6003',
              '6004',
              '7000',
              '7001',
              '7002',
              '7003',
              '9000',
              '9001',
              '9100'
            ];



}
