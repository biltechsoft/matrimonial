import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Location, LocationStrategy, PathLocationStrategy } from '@angular/common';
import { Observable } from 'rxjs';
import { ILogin } from './interfaces/login';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class SharedService {
//readonly APIUrl = "http://127.0.0.1:8000";
//readonly PhotoUrl = "http://127.0.0.1:8000/media/";

readonly APIUrl = "https://munamatrimonial.com/api/WWxoV2RWbFhNV2hrU0Vwd1lsYzVkV0ZYUm5OTmFsRXdUWHBSUFE9PQ==";
readonly PhotoUrl = "https://munamatrimonial.com/api/weriojfklmsdklfksdweiof/media/";
readonly PhotoAPIUrl = "https://munamatrimonial.com/api/weriojfklmsdklfksdweiof";

//readonly APIUrl = "https://marufbuet.pythonanywhere.com";
//readonly PhotoUrl = "https://marufbuet.pythonanywhere.com/media/";
  currentUser;
  adminUser;
  isadmin=false;
  checked = false;
  xuser = { gender: null, userId: 0 };  //for view matching id profile, by default 0 (no match)

  constructor(public location: Location, private http:HttpClient, private router : Router) { }



  getRandomInt(min, max) {
     min = Math.ceil(min);
     max = Math.floor(max);
     return Math.floor(Math.random() * (max - min + 1)) + min;
   }
   getDateTime(today=new Date()) {
     //return datetime in the format '2022-12-22 00:00:04'
     //database datetime format '2022-01-28T15:07:37Z'
     //var today = new Date();
     var dd = String(today.getDate());
     var mm = String(today.getMonth() + 1); //January is 0!
     var hh = String(today.getHours());
     var mn = String(today.getMinutes());
     var ss = String(today.getSeconds());
     var yyyy = today.getFullYear();
     return yyyy+'-'+mm+'-'+dd+' '+hh+':'+mn+':'+ss;
   }
   getYear(today=new Date()) {
     var yyyy = Number(today.getFullYear());
     return yyyy;
   }
   getYEARS() {
     var year = this.getYear();
     var YEARS = [];
     for(var i=0; i<=50; i++)
     {
       YEARS[i] = year-18-i;  //Assuming minimum marriage age is 18
     }
     return YEARS;
   }
   /*getAge(birthDate) {
     var todate = new Date();
     var bdate = new Date(birthDate);
     var diff = todate.getTime() - bdate.getTime();
     var diffDays = Math.ceil(diff / (1000 * 3600 * 24));
     var age = Math.round(diffDays / 365);
     //localStorage.setItem('userage',this.currentUser.age);
     return age;
   }*/
   getAge(birthYear) {
     return this.getYear()-birthYear;
   }
   isAdmin() {
     if(localStorage.getItem('usertype')=='0') {return true;}
   }
   isHome() {
     var titlee = this.location.prepareExternalUrl(this.location.path());
     if(titlee.charAt(0) === '#'){
         titlee = titlee.slice( 1 );
     }
       if( titlee === '/home' ) {
           return true;
       }
       else {
           return false;
       }
   }

  mEncrypt(val) {
    return btoa(btoa(btoa(val)));
  }

  validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(email=='' || email==null) {
      return true;
    }
    return re.test(email);
  }
  telephoneCheck(str) {
    var isphone = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im.test(str);
    if(str=='' || str==null) {
      return true;
    }
    return isphone;
  }

  getAdminList(id=0): Observable<any[]> {
    if(id==0) {
      return this.http.get<any[]> (this.APIUrl + '/adminuser');
    }
    else {
      return this.http.get<any[]> (this.APIUrl + '/adminuser/' + id);
    }
  }
  addAdminUser(val:any) {
    return this.http.post (this.APIUrl + '/adminuser', val);
  }
  updateAdminUser(val:any) {
    return this.http.put (this.APIUrl + '/adminuser', val);
  }
  deleteAdminUser(val:any) {
    return this.http.delete (this.APIUrl + '/adminuser/' + val);
  }

  getMessageList(id=0): Observable<any[]> {
    if(id==0) {
      return this.http.get<any[]> (this.APIUrl + '/message');
    }
    else {
      return this.http.get<any[]> (this.APIUrl + '/message/' + id);
    }
  }
  addMessage(val:any) {
    return this.http.post (this.APIUrl + '/message', val);
  }
  updateMessage(val:any) {
    return this.http.put (this.APIUrl + '/message', val);
  }
  deleteMessage(val:any) {
    return this.http.delete (this.APIUrl + '/message/' + val);
  }

  getTempList(): Observable<any[]> {
    return this.http.get<any[]> (this.APIUrl + '/tempuser');
  }
  addTempUser(val:any) {
    return this.http.post (this.APIUrl + '/tempuser', val);
  }
  updateTempUser(val:any) {
    return this.http.put (this.APIUrl + '/tempuser', val);
  }
  deleteTempUser(val:any) {
    return this.http.delete (this.APIUrl + '/tempuser/' + val);
  }

  getMaleUserList(id=0): Observable<any[]> {
    if(id==0) {
      return this.http.get<any[]> (this.APIUrl + '/maleuser');
    }
    else {
      return this.http.get<any[]> (this.APIUrl + '/maleuser/' + id);
    }
  }
  addMaleUser(val:any) {
    return this.http.post (this.APIUrl + '/maleuser', val);
  }
  updateMaleUser(val:any) {
    return this.http.put (this.APIUrl + '/maleuser', val);
  }
  deleteMaleUser(val:any) {
    return this.http.delete (this.APIUrl + '/maleuser/' + val);
  }

  getFemaleUserList(id=0): Observable<any[]> {
    if(id==0) {
      return this.http.get<any[]> (this.APIUrl + '/femaleuser');
    }
    else {
      return this.http.get<any[]> (this.APIUrl + '/femaleuser/' + id);
    }
  }
  addFemaleUser(val:any) {
    return this.http.post (this.APIUrl + '/femaleuser', val);
  }
  updateFemaleUser(val:any) {
    return this.http.put (this.APIUrl + '/femaleuser', val);
  }
  deleteFemaleUser(val:any) {
    return this.http.delete (this.APIUrl + '/femaleuser/' + val);
  }

  getPostList(id=0, type='all'): Observable<any[]> {
    if(id==0) {
      return this.http.get<any[]> (this.APIUrl + '/post');
    }
    else {
      return this.http.get<any[]> (this.APIUrl + '/post/' + type);
    }
  }
  addPost(val:any) {
    return this.http.post (this.APIUrl + '/post', val);
  }
  updatePost(val:any) {
    return this.http.put (this.APIUrl + '/post', val);
  }
  deletePost(val:any) {
    return this.http.delete (this.APIUrl + '/post/' + val);
  }

  sendEmail(val:any) {
    return this.http.post (this.APIUrl + '/sendmail', val);
  }
  makeMatching() {
    return this.http.get<any[]> (this.APIUrl + '/matchmaking');
  }
  getMatchingTable() {
    return this.http.get<any[]> (this.APIUrl + '/matchingtable');
  }
  updateMatchingTable(val:any) {
    return this.http.put (this.APIUrl + '/matchingtable', val);
  }

  UploadPhoto(val:any) {
    return this.http.post (this.PhotoAPIUrl + '/SaveFile', val);
  }
  deletePhoto(val:any) {
    return this.http.post (this.PhotoAPIUrl + '/DeleteFilelskhdjfklsdhfg', val);
  }

  returnPage() {
    if(localStorage.getItem('usertype')!='0') {
      this.router.navigate(['/login']);
    }
    else {
      this.router.navigate(['/admin']);
    }
  }

  loginauth() {
    if(localStorage.getItem('isLoggedOut') == 'True') {
      this.returnPage();
      return true;
    }
    if(localStorage.getItem('fromloginpage') == "True") {
      localStorage.removeItem('fromloginpage');
      return true;
    }
    else if(localStorage.getItem('usertype')=='0') {
        this.getAdminList(Number(localStorage.getItem('adminid'))).subscribe(data=>{
          this.adminUser = data;
          var token = this.adminUser.adminToken;
          if(token == localStorage.getItem('usertoken')) {
            var UserToken = this.getRandomInt(12345678,87654321);
            localStorage.setItem('usertoken', UserToken);
            this.updateAdminUser({adminId: this.adminUser.adminId, adminToken: UserToken}).subscribe();
            this.isadmin=true;
          }
          else {
            this.logout();
            this.router.navigate(['/admin']);
          }
        });
        return true;
    }
    else if(localStorage.getItem('usertype')=='1') {
        this.getMaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
          this.currentUser = data;
          var token = this.currentUser.userToken;
          if(token == localStorage.getItem('usertoken')) {
            var UserToken = this.getRandomInt(12345678,87654321);
            localStorage.setItem('usertoken', UserToken);
            this.updateMaleUser({userId: this.currentUser.userId, userToken: UserToken}).subscribe();
          }
          else {
            this.logout();
            this.router.navigate(['/login']);
          }
        });
        return true;
    }
    else if (localStorage.getItem('usertype')=='2') {
        this.getFemaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
          this.currentUser = data;
          var token = this.currentUser.userToken;
          if(token == localStorage.getItem('usertoken')) {
            var UserToken = this.getRandomInt(12345678,87654321);
            localStorage.setItem('usertoken', UserToken);
            this.updateFemaleUser({userId: this.currentUser.userId, userToken: UserToken}).subscribe();
          }
          else {
            this.logout();
            this.router.navigate(['/login']);
          }
        });
        return true;
    }
    this.returnPage();
  }
  loggedin() {
    if(localStorage.getItem('isLoggedOut') == 'False') {
      return true;
    }
    else { return false; }
  }
  logout() :void {
    if(localStorage.getItem('usertype')=='0') {
      this.getAdminList(Number(localStorage.getItem('adminid'))).subscribe(data=>{
        this.adminUser = data;
        var UserToken = this.getRandomInt(12345678,87654321);
        this.updateAdminUser({adminId: this.adminUser.adminId, userToken: UserToken}).subscribe();
      });
    }
    else if(localStorage.getItem('usertype')=='1') {
       this.getMaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
         this.currentUser = data;
         var UserToken = this.getRandomInt(12345678,87654321);
         this.updateMaleUser({userId: this.currentUser.userId, userToken: UserToken}).subscribe();
       });
     }
     else if(localStorage.getItem('usertype')=='2') {
       this.getFemaleUserList(Number(localStorage.getItem('userid'))).subscribe(data=>{
         this.currentUser = data;
         var UserToken = this.getRandomInt(12345678,87654321);
         this.updateFemaleUser({userId: this.currentUser.userId, userToken: UserToken}).subscribe();
       });
     }

     //localStorage.removeItem('usertype');
     localStorage.removeItem('usertoken');
     localStorage.removeItem('adminid');
     localStorage.removeItem('userid');
     localStorage.removeItem('username');
     localStorage.removeItem('userage');
     localStorage.removeItem('gender');
     localStorage.removeItem('menuadmin');
     localStorage.removeItem('ppchange');
     localStorage.setItem('isLoggedOut','True');

     this.returnPage();
   }

   profilePercentage(user, male=true) {
     var param = [
       Number(user.fullName != null),
       Number(user.city != null),
       Number(user.state != null),
       Number(user.cellPhone != null),
       Number(user.email != null),
       Number(user.age != null),
       Number(user.height != null),
       Number(user.weight != null),
       Number(user.maritalStatus != null),
       Number(user.children != null),
       Number(user.immigrationStatus != null),
       Number(user.highSchool != null),
       Number(user.bachelors != null),
       Number(user.highestEducation != null),
       Number(user.employed != null),
       Number(user.religiousPractice != null),
       Number(user.smoker != null),
       Number(user.preReligious != null),
       Number(user.preSmoking != null),
       Number(user.PreEthnicSpecific != null),
       Number(user.preImmigrationStatus != null),
       Number(user.preMaritalStatus != null),
       Number(user.preChildren != null),
       Number(user.preEducation != null),
       Number(user.preEmployment != null),
       Number(user.preIncome != null),
       Number(user.preAgeGap != null),
       Number(user.photo != null)
     ];
     if (male) {
       param.push(Number(user.beard != null));
       param.push(Number(user.preWear != null));
     }
     else {
       param.push(Number(user.wear != null));
       param.push(Number(user.preBeard != null));
     }
     var sum = 0;
     for(var i=0; i<this.REQUIRED.length; i++) {
       sum = sum + Number(user[this.REQUIRED[i]] != null);
     }
     sum = sum + Number(user.photo != this.constPhoto[0]);
     for (var i=1; i<this.constPhoto.length; i++) {
       sum = sum + Number(!user.gallery.includes(this.constPhoto[i]));
     }
     return Math.floor(sum*100/(this.constPhoto.length+this.REQUIRED.length-2));
     //total number of parameters taken in this two array
     //-2 for wear and beard
   }

  //The fixed photo that should not be deleted
  constPhoto = ['anonymous.png', 'gallery1.jpg', 'gallery2.jpg', 'gallery3.jpg', 'gallery4.jpg'];

  REQUIRED = ['fullName','city','state','cellPhone','email','birthYear',
  'height','weight','maritalStatus','children','childrenNumber','immigrationStatus',
  'highSchool','bachelors','masters','doctorate','highestEducation','employed',
  'income','religiousPractice','beard','wear','smoker','preReligious','preWear','preBeard',
  'preSmoking','preEthnicSpecific','preImmigrationStatus','preMaritalStatus',
  'preChildren','preEducation','preEmployment','preIncome','preAgeGap','guarName',
  'guarPhone','guarEmail','refName1','refRelation1','refPhone1'];

  STATES = [
    {
      "State": "Alabama",
      "Abbrev": "Ala.",
      "Code": "AL"
    },
    {
      "State": "Alaska",
      "Abbrev": "Alaska",
      "Code": "AK"
    },
    {
      "State": "Arizona",
      "Abbrev": "Ariz.",
      "Code": "AZ"
    },
    {
      "State": "Arkansas",
      "Abbrev": "Ark.",
      "Code": "AR"
    },
    {
      "State": "California",
      "Abbrev": "Calif.",
      "Code": "CA"
    },
    {
      "State": "Colorado",
      "Abbrev": "Colo.",
      "Code": "CO"
    },
    {
      "State": "Connecticut",
      "Abbrev": "Conn.",
      "Code": "CT"
    },
    {
      "State": "Delaware",
      "Abbrev": "Del.",
      "Code": "DE"
    },
    {
      "State": "District of Columbia",
      "Abbrev": "D.C.",
      "Code": "DC"
    },
    {
      "State": "Florida",
      "Abbrev": "Fla.",
      "Code": "FL"
    },
    {
      "State": "Georgia",
      "Abbrev": "Ga.",
      "Code": "GA"
    },
    {
      "State": "Hawaii",
      "Abbrev": "Hawaii",
      "Code": "HI"
    },
    {
      "State": "Idaho",
      "Abbrev": "Idaho",
      "Code": "ID"
    },
    {
      "State": "Illinois",
      "Abbrev": "Ill.",
      "Code": "IL"
    },
    {
      "State": "Indiana",
      "Abbrev": "Ind.",
      "Code": "IN"
    },
    {
      "State": "Iowa",
      "Abbrev": "Iowa",
      "Code": "IA"
    },
    {
      "State": "Kansas",
      "Abbrev": "Kans.",
      "Code": "KS"
    },
    {
      "State": "Kentucky",
      "Abbrev": "Ky.",
      "Code": "KY"
    },
    {
      "State": "Louisiana",
      "Abbrev": "La.",
      "Code": "LA"
    },
    {
      "State": "Maine",
      "Abbrev": "Maine",
      "Code": "ME"
    },
    {
      "State": "Maryland",
      "Abbrev": "Md.",
      "Code": "MD"
    },
    {
      "State": "Massachusetts",
      "Abbrev": "Mass.",
      "Code": "MA"
    },
    {
      "State": "Michigan",
      "Abbrev": "Mich.",
      "Code": "MI"
    },
    {
      "State": "Minnesota",
      "Abbrev": "Minn.",
      "Code": "MN"
    },
    {
      "State": "Mississippi",
      "Abbrev": "Miss.",
      "Code": "MS"
    },
    {
      "State": "Missouri",
      "Abbrev": "Mo.",
      "Code": "MO"
    },
    {
      "State": "Montana",
      "Abbrev": "Mont.",
      "Code": "MT"
    },
    {
      "State": "Nebraska",
      "Abbrev": "Nebr.",
      "Code": "NE"
    },
    {
      "State": "Nevada",
      "Abbrev": "Nev.",
      "Code": "NV"
    },
    {
      "State": "New Hampshire",
      "Abbrev": "N.H.",
      "Code": "NH"
    },
    {
      "State": "New Jersey",
      "Abbrev": "N.J.",
      "Code": "NJ"
    },
    {
      "State": "New Mexico",
      "Abbrev": "N.M.",
      "Code": "NM"
    },
    {
      "State": "New York",
      "Abbrev": "N.Y.",
      "Code": "NY"
    },
    {
      "State": "North Carolina",
      "Abbrev": "N.C.",
      "Code": "NC"
    },
    {
      "State": "North Dakota",
      "Abbrev": "N.D.",
      "Code": "ND"
    },
    {
      "State": "Ohio",
      "Abbrev": "Ohio",
      "Code": "OH"
    },
    {
      "State": "Oklahoma",
      "Abbrev": "Okla.",
      "Code": "OK"
    },
    {
      "State": "Oregon",
      "Abbrev": "Ore.",
      "Code": "OR"
    },
    {
      "State": "Pennsylvania",
      "Abbrev": "Pa.",
      "Code": "PA"
    },
    {
      "State": "Rhode Island",
      "Abbrev": "R.I.",
      "Code": "RI"
    },
    {
      "State": "South Carolina",
      "Abbrev": "S.C.",
      "Code": "SC"
    },
    {
      "State": "South Dakota",
      "Abbrev": "S.D.",
      "Code": "SD"
    },
    {
      "State": "Tennessee",
      "Abbrev": "Tenn.",
      "Code": "TN"
    },
    {
      "State": "Texas",
      "Abbrev": "Tex.",
      "Code": "TX"
    },
    {
      "State": "Utah",
      "Abbrev": "Utah",
      "Code": "UT"
    },
    {
      "State": "Vermont",
      "Abbrev": "Vt.",
      "Code": "VT"
    },
    {
      "State": "Virginia",
      "Abbrev": "Va.",
      "Code": "VA"
    },
    {
      "State": "Washington",
      "Abbrev": "Wash.",
      "Code": "WA"
    },
    {
      "State": "West Virginia",
      "Abbrev": "W.Va.",
      "Code": "WV"
    },
    {
      "State": "Wisconsin",
      "Abbrev": "Wis.",
      "Code": "WI"
    },
    {
      "State": "Wyoming",
      "Abbrev": "Wyo.",
      "Code": "WY"
    }
  ]

}
