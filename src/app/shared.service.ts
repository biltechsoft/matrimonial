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
  validateName(str) {
    var re = /^[ a-zA-Z\-\']+$/im.test(str);
    if(str=='' || str==null) {
      return true;
    }
    return re;
  }
  validateZIP(str) {
    var re = /^[0-9]{5}(?:-[0-9]{4})?$/im.test(str);
    if(str=='' || str==null) {
      return true;
    }
    return re;
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

  loginauth(userid,usertype) {
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
    else if(usertype=='1') {
        this.getMaleUserList(userid).subscribe(data=>{
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
    else if (usertype=='2') {
        this.getFemaleUserList(userid).subscribe(data=>{
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
  genderMap(gender) {
    return (gender=='Male' ? '1' : '2');
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
     //localStorage.removeItem('username');
     localStorage.removeItem('userage');
     localStorage.removeItem('gender');
     localStorage.removeItem('menuadmin');
     localStorage.removeItem('ppchange');
     localStorage.setItem('isLoggedOut','True');

     this.returnPage();
   }

   profilePercentage(user) {
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
  'height','weight','maritalStatus','children','immigrationStatus',
  'highSchool','bachelors','highestEducation','employed',
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
  ];

  CAPTCHA = ['5240352216.png','3344096560.png','1036151883.png','8946670272.png','9073184552.png','92815072.png','1240966975.png','3416603686.png','7392407956.png','163127775.png','9980863916.png','5171549484.png','8162800795.png','9172954692.png','4720433703.png','9516990230.png','5498160409.png','8610464611.png','2348122374.png','3822642952.png','9598094323.png','4944819396.png','3571574519.png','4839033585.png','718645902.png','135229659.png','702214659.png','4387484894.png','3612755916.png','8904114924.png','4728796601.png','7682630432.png','2101441115.png','3648133125.png','5635622093.png','3057219989.png','7711439497.png','6274736457.png','4372272228.png','6573617566.png','2326204882.png','9563612918.png','9078545525.png','996634721.png','8520896027.png','3195317600.png','4943065677.png','8081933241.png','5093888170.png','2939710919.png','6505216911.png','3058249572.png','2734599140.png','2763631862.png','9034753052.png','9383419416.png','9021962499.png','9021747176.png','7416437512.png','2707407142.png','6622904826.png','4180344385.png','3021202486.png','3773747553.png','6761563257.png','3082569641.png','765462704.png','539998784.png','6346953003.png','9978799220.png','2280910322.png','9126284022.png','629865948.png','8779548142.png','7149936509.png','4653704425.png','4692999826.png','8376881097.png','8990340995.png','5362903460.png','4064438530.png','1640709945.png','3552494676.png','5575277955.png','3727214827.png','9723296624.png','5533278932.png','2187595154.png','344395773.png','4147504469.png','6744235480.png','3906416333.png','815617868.png','9870734431.png','3504144892.png','2556514978.png','1648512317.png','9879012398.png','4913315946.png','8164634628.png','9543524357.png','4800446513.png','1289809689.png','3419616602.png','7837247072.png','4662247326.png','889360843.png','477127228.png','3522836544.png','9823428683.png','9906838556.png','3946852036.png','7165517789.png','7064763792.png','5486781609.png','2641111944.png','2852584343.png','8181468477.png','868726627.png','96468889.png','6669852293.png','5306020649.png','9989236963.png','6416282613.png','8635087827.png','8428919917.png','3191093848.png','9707319559.png','5908008160.png','3102925213.png','4974803828.png','2174345160.png','7239389271.png','7865453041.png','5437719801.png','4152940059.png','6545073027.png','5769223327.png','5459582540.png','3495054877.png','2657566472.png','8791065757.png','7702638349.png','2294722833.png','8332060582.png','2147252966.png','2700544781.png','9220460356.png','3788501327.png','4141301586.png','9063450500.png','4525596535.png','9368940464.png','2908723282.png','9325520215.png','581925048.png','4048010986.png','4421320334.png','7550138413.png','7889615419.png','2974866190.png','4013956804.png','9204222576.png','3979860207.png','2063712992.png','5894570278.png','2962784777.png','489152672.png','3559450076.png','135369776.png','1609774604.png','5229290588.png','8398065881.png','3592759565.png','286656901.png','1454692477.png','2444940053.png','4836377454.png','146741167.png','6072910548.png','2313629833.png','5152157068.png','3176080567.png','1677666543.png','4614540325.png','1906324493.png','1850443665.png','7730635606.png','1923385514.png','4762472127.png','4718139357.png','3846224527.png','4858092755.png','2946807677.png','9565511878.png','9690770639.png','6845463905.png','4859665093.png','2019472995.png','1171036412.png','5891595720.png','2024552933.png','9830420740.png','3521223717.png','6720284243.png','738489702.png','5894770378.png','7164081297.png','6376322157.png','9938348894.png','507869809.png','6339150320.png','1936562885.png','4780948945.png','4259445118.png','5132492810.png','6837582858.png','3497197196.png','4904661643.png','1216423955.png','566940316.png','7865159306.png','2453605275.png','2306240734.png','2474753334.png','5324129039.png','8382717542.png','3537397377.png','9603731382.png','1498530104.png','3759822286.png','6662229328.png','7487537149.png','5706103588.png','5260900826.png','622868366.png','3188062135.png','4634737702.png','1950843053.png','4816032955.png','3565880470.png','1431565380.png','6956284901.png','210681514.png','265964552.png','3945307362.png','8632840894.png','6013213668.png','8944157827.png','3025663166.png','2633171225.png','4888349529.png','6057278709.png','937497903.png','9743547232.png','1815827352.png','1131481909.png','8950684280.png','2710636568.png','5848681932.png','5898964655.png','8272233518.png','6592916810.png','2166904823.png','5396422961.png','8782215668.png','9805466848.png','5160975013.png','5028630391.png','2856431008.png','6615965980.png','3450506902.png','1443669631.png','8988893896.png','5686328081.png','9573834798.png','5015719725.png','6110510420.png','2811979047.png','1922831662.png','3116439953.png','5252259235.png','3114824720.png','9137800985.png','2977663536.png','471931970.png','8848013437.png','5781891978.png','6957848930.png','3746783359.png','7607238003.png','9651214669.png','8806577087.png','6998135644.png','7578867278.png','741817889.png','6085916812.png','7627639853.png','4164694077.png','55986118.png','335224942.png','6245733826.png','4451072834.png','4391059868.png','6685620568.png','5345226276.png','7974002515.png','5152124481.png','3278763295.png','5131989117.png','4266611698.png','4164693736.png','2330025255.png','9376792475.png','9648837415.png','1411224854.png','3222728707.png','3909219583.png','2642503659.png','1950655557.png','1803951742.png','2352623020.png','4134419310.png','1163699369.png','9453186831.png','8308697088.png','4790542949.png','11894287.png','6540460141.png','1959814039.png','7575038164.png','3215964751.png','8698765285.png','7986278379.png','5196173964.png','8207027519.png','8594693540.png','7354504397.png','9734698073.png','2425833164.png','6598293314.png','8332696124.png','8385552746.png','6921103610.png','2390406564.png','3221110337.png','2296218659.png','4338089599.png','509585553.png','2560342459.png','5442633252.png','5919211374.png','9107717079.png','5452696296.png','6725677151.png','3845471266.png','8199915186.png','9321820563.png','6152851277.png','5467954954.png','3084709943.png','5223916873.png','6388926935.png','5281918760.png','9029623898.png','5890116758.png','4045311755.png','5251259952.png','8622542704.png','4389139959.png','9095464657.png','8237525232.png','2508172528.png','806401177.png','2746751915.png','3740435497.png','5872095486.png','1451184278.png','8201170025.png','6896520461.png','6470905601.png','2581685335.png','7750623231.png','9024555895.png','9379329241.png','6539096801.png','7541016416.png','6277044495.png','1695474442.png','1081968341.png','7504641047.png','7083031276.png','978281824.png','7376130245.png','2463466971.png','2698530328.png','7039528862.png','1162053724.png','3930970916.png','2629161232.png','2032613549.png','786737983.png','9500451076.png','3279467965.png','2212442368.png','7020914528.png','2360329178.png','796787744.png','9485148600.png','7839347511.png','9887818021.png','3470859136.png','6885192895.png','8699211647.png','6383915381.png','1711610735.png','3438126413.png','3146225852.png','996588880.png','8087494005.png','1354689282.png','4629959151.png','945464758.png','3319698855.png','9909913922.png','2873744366.png','2856263982.png','6766042884.png','7612384337.png','9179898443.png','9785201052.png','1244711219.png','9231004020.png','4587340834.png','9654941698.png','3876186758.png','7812793331.png','9429474363.png','6990600158.png','6002267440.png','2023204568.png','5768134102.png','2640836080.png','4924672234.png','9984651642.png','8471913900.png','5778439384.png','5797793320.png','6901431761.png','7354511640.png','6385648140.png','7836443389.png','3862975501.png','2243566433.png','5407414556.png','6581329417.png','7042974165.png','5883433781.png','6058141102.png','2484738801.png','7025420331.png','8251915371.png','2264224218.png','6403282369.png','262675762.png','9063848791.png','4890455886.png','3229854443.png','2949925783.png','348344161.png','1979586122.png','2202453705.png','3627331766.png','133086192.png','326401136.png','1483529533.png','2095118927.png','5181973443.png','6227209977.png','4624947533.png','7252769080.png','3050954344.png','8027903466.png','3337625677.png','4228534360.png','4486032815.png','4651804553.png','7651425998.png','6291857153.png','9434199278.png','4783018046.png','5810163772.png','7185721914.png','8918563717.png','8217997668.png','8225747836.png','4632210766.png','2307712804.png','5556587760.png','3904657444.png','2357068670.png','2492950757.png','2932039406.png','845982388.png','4900655473.png','6607436134.png','7225266287.png','4098407607.png','7408425989.png','8888274665.png','5338249020.png','9713985126.png','6031445540.png','6791701389.png','6721796381.png','1799455079.png','9829969335.png','5992832560.png','430069442.png','8758132602.png','1086098379.png','8046698957.png','3010865187.png','4293285186.png','6301380059.png','4120774585.png','200078383.png','1367170636.png','1161439372.png','6090467681.png','6521515008.png','7389523069.png','2775872286.png','8382355557.png','5494484471.png','2553911919.png','7609251020.png','7812530781.png','1974211131.png','9753399678.png','773499453.png','1978713397.png','2718513210.png','3189157429.png','5972475492.png','766318461.png','2056147717.png','7960364898.png','6866567979.png','8850610886.png','6821322346.png','328409186.png','7398297573.png','167529924.png','2431690423.png','6406301066.png','4486035276.png','3436649077.png','7820173747.png','666932504.png','9504666557.png','992460025.png','2469120610.png','576692694.png','2087133898.png','6679576130.png','1709497635.png','406539655.png','1530778453.png','2361020851.png','4133242714.png','9663924432.png','9401383530.png','4803671419.png','8206057376.png','7923887145.png','4921967701.png','5278784509.png','9557248173.png','4838448974.png','5580269201.png','1910840089.png','7211416632.png','3958605079.png','3640785107.png','3856149412.png','8596272309.png','5613034096.png','3795634327.png','3197548019.png','7320202435.png','2555607578.png','7860079340.png','2233779271.png','3415064532.png','469071329.png','4345191052.png','9851610307.png','7571001802.png','105920858.png','3796180233.png','7364958598.png','8829686238.png','1994368014.png','792389222.png','9368861792.png','2516395160.png','8478046622.png','5398332085.png','5382882693.png','3365501981.png','684218354.png','2728017185.png','4027146782.png','8874340901.png','5625776298.png','8370817256.png','6396215494.png','8232791414.png','4296812572.png','5714299807.png','3776074265.png','4645066990.png','6943211473.png','2038237406.png','7952482857.png','1903402572.png','1252686908.png','5021802205.png','4577845449.png','2168468105.png','6432288691.png','3833490470.png','8569858078.png','4038654566.png','7629403031.png','5196093787.png','3278174947.png','8670351188.png','8830620076.png','673854123.png','3291398687.png','2303513655.png','3226431789.png','9753543731.png','6199850132.png','8661370034.png','9625634311.png','4841047989.png','4349137150.png','9294424004.png','6307563196.png','4390046662.png','4895572304.png','8403012156.png','5342053583.png','74726828.png','7357384996.png','8155191038.png','3684301715.png','5227960404.png','8767160633.png','9187083731.png','7136380145.png','9611022714.png','9790894852.png','5031369256.png','4311345389.png','2799884935.png','1763115923.png','2898487229.png','2589207957.png','398714527.png','4905067487.png','2138877707.png','442036473.png','1770779832.png','3882775739.png','4818113469.png','4315605834.png','5641761404.png','8036779392.png','5055146826.png','5645764093.png','1438299201.png','968413906.png','7761490100.png','9194596144.png','5508123984.png','9353594324.png','3333797318.png','9991340875.png','6885206572.png','2903363664.png','8981689035.png','3739539171.png','1598366867.png','9112511574.png','7378785672.png','5468455816.png','3031980916.png','403606696.png','4863249277.png','2278599779.png','3974620344.png','6943273645.png','9697359633.png','8707007430.png','9875022046.png','5416356721.png','6075953046.png','2191127489.png','6663574620.png','1153985295.png','3489799101.png','1196862036.png','5562050691.png','4616672574.png','9900928171.png','5411738344.png','7011080060.png','5728298970.png','1196249557.png','9763509518.png','7568318996.png','859840366.png','6710926591.png','1773356855.png','3437667401.png','6123991359.png','1502921996.png','8512371805.png','5411701751.png','8385225575.png','1645241859.png','5282749845.png','5785339999.png','8627402538.png','8625071411.png','4016725716.png','5420836210.png','6446837893.png','3543173670.png','9871395271.png','2693415368.png','4150638104.png','9004497053.png','967127756.png','3104229576.png','3849764724.png','1934070758.png','6339535297.png','1998910320.png','1175908999.png','4368095715.png','8331035858.png','2381734781.png','5134433186.png','9448044138.png','8567671900.png','5086647840.png','159170423.png','2897447911.png','866474581.png','8304113143.png','9299507752.png','8461426774.png','9399101947.png','2901435312.png','1821750064.png','7695172634.png','2961152142.png','3097581689.png','586375570.png','5777748377.png','2276427405.png','9955327669.png','1906814773.png','1995583457.png','4197157674.png','8091544636.png','3329741400.png','6836053147.png','5975035026.png','8142127597.png','7675320339.png','6300655512.png','1145508863.png','3052977086.png','3092988304.png','5432805432.png','9677038611.png','7447625564.png','1683998140.png','5649880919.png','6837819409.png','2896773308.png','135719615.png','2140721852.png','3223665598.png','6539800817.png','4560351398.png','1127598498.png','7225893158.png','3280171804.png','6561943983.png','7895292116.png','7797165138.png','9925327862.png','9431137272.png','2895758362.png','7797525419.png','9887792954.png','3008355519.png','5736691221.png','4714966050.png','6982988190.png','1272652076.png','609470103.png','3900653196.png','6410649418.png','3524236101.png','5899609575.png','8292655503.png','4894568348.png','6514376384.png','5801224901.png','2401315770.png','9928350575.png','4950470403.png','8831947902.png','4461308681.png','5911701999.png','2082128869.png','8865310229.png','3822730149.png','6737374777.png','2207211327.png','8931021852.png','7740506363.png','5406327444.png','5677186274.png','6352104750.png','7442552739.png','9946146593.png','3931634199.png','7425445578.png','1344500071.png','6082636824.png','4110765720.png','3846397107.png','3486520043.png','9898244384.png','3174805321.png','8368321977.png','2084959341.png','6612799939.png','2225431155.png','9687707732.png','4561540693.png','2064306595.png','5801876950.png','1314420899.png','2678189342.png','463546590.png','4936350649.png','6109061087.png','3063887957.png','1349108135.png','3828030395.png','5209369817.png','6316308217.png','9240980962.png','5470081419.png','8661511144.png','4903005762.png','266659300.png','2359426877.png','9438477156.png','5043139184.png','3634172977.png','5657434607.png','8040704289.png','8312513484.png','4916855458.png','7323229472.png','7358600532.png','2309919169.png','2395746382.png','6281296190.png','8124462015.png','6930594985.png','9320983599.png','3125734802.png','7986547458.png','7214828928.png','9315983931.png','6704482080.png','3374800202.png','9525268455.png','2339431480.png','4010807273.png','4833985916.png','4793847934.png','710363391.png','4023151332.png','3062785197.png','354211389.png','1712810.png','920783936.png','1311647888.png','8626508082.png','4479156676.png','9236590693.png','5202291172.png','2179459544.png','5828801078.png','9284155261.png','8662173350.png','1555761187.png','2753704194.png','7138920138.png','2426089981.png','4035757807.png','1338131976.png','2003225900.png','2284151471.png','811771833.png','8725507632.png','47605655.png','2863214262.png','1064488308.png','4776699428.png','6078593688.png','3708186279.png','1958006024.png','6388798621.png','3237167978.png','85025983.png','1642898333.png','9353124013.png','7743784303.png','978985603.png','1128223764.png','7429910950.png','5706381761.png','2171192499.png','9389001522.png','6944388348.png','9704642955.png','6532370705.png','8200408135.png','4795278162.png','5136888808.png','5239144289.png','9308997294.png','2151800541.png','3698518595.png','1448342542.png','58645702.png','2870336230.png','7288870680.png','6204198191.png','967077217.png','7035718862.png','5094678362.png','4006603412.png','2717720420.png','8975202780.png','3648681607.png','5790703985.png','3106021522.png','6049310699.png','6382234640.png','4985332478.png','3476996166.png','8582357912.png','1023215075.png','8186438104.png','4699526181.png','5107722967.png','3723812725.png','8161357644.png','270995903.png','6380359687.png','7705797773.png','7488358717.png','7217891026.png','6351474754.png','9120358828.png','8441232947.png','1996470070.png','4818565734.png','1152921004.png','701906262.png','485787227.png','8268714132.png','7536988422.png','7373959514.png','3102141810.png','368900199.png','3531677002.png','4875001221.png','8817803661.png','1027684619.png','9086423442.png','9203844287.png','4579533050.png','5019991277.png','7133522972.png','5445806173.png','7404944395.png','6713132080.png','2440100424.png','6102091699.png','1579649355.png','2468763257.png','6610538419.png','7954396284.png','6504866493.png','8894978767.png','4530685128.png','8084380626.png','3352427407.png','4946407556.png','1346650982.png','5441399019.png','394494221.png','7717321783.png','434201840.png','5070072367.png','33840375.png','3343434829.png','9195920438.png','1958733903.png','1081481976.png','1005807770.png','3192387337.png','5309954902.png','9438066111.png','6756552256.png','9680620324.png','519247369.png','8572452100.png','1416794179.png','151469734.png','4475319643.png','9652268929.png','7270322598.png','9125716751.png','1744713024.png','2270851508.png','8717922324.png','5184780222.png','6438332237.png','524956774.png','9406505314.png','7945990249.png','4526107790.png','8416402867.png','3854464151.png','6924438448.png','5718273331.png','8961077218.png','7127509480.png','972603922.png','2820664909.png','9258566326.png','5173675341.png','287681373.png'
];

CAPTCHA_CODE = ['226md','22d5n','2356g','23mdg','23n88','243mm','244e2','245y5','24f6w','24pew','25257','253dc','25egp','25m6p','25p2m','25w53','264m5','268g2','28348','28x47','2b827','2bg48','2cegf','2cg58','2cgyx','2en7g','2enf4','2fxgd','2g783','2g7nm','2gyb6','2mg87','2mpnn','2n73f','2nbc5','2nbcx','2nf26','2npg6','2nx38','2p2y8','2pfpn','2w4y7','2wc38','2wx73','2x7bm','2xc2n','2ycn8','2yggg','325fb','32cnn','32dnn','33b22','33f7m','33n73','33ng4','33p4e','34b84','34fxm','34pcn','368y5','36bc2','36nx4','36w25','373gb','377xx','378e5','37d52','37ep6','387g2','38n57','3b4we','3bd8f','3bfnd','3bnyf','3bx86','3c7de','3cpwb','3d7bd','3den6','3dgmf','3ebnn','3ebpw','3eny7','3fbxd','3g2w6','3mxdn','3n2b4','3n3cf','3n7mx','3ndxd','3nfdn','3nnpw','3nw7w','3ny45','3p4nn','3p67n','3pe4g','3w2bw','3wnd3','3x325','3x5fm','3xcgg','3xng6','3ye2e','3ygde','3ym7f','428b6','42dw4','42nxy','42xpy','43gey','43mn5','43p5d','43xfe','4433m','445cc','44c22','44fyb','44xe8','44ype','467d5','46mbm','4743p','474ff','478nx','47e4p','47m2b','488de','4b2pw','4c8n8','4cfw8','4cn7b','4d22m','4dgf7','4dw3w','4egem','4exnn','4f8yp','4fc36','4fp5g','4gb3f','4gycb','4m2w5','4n2yg','4n3mn','4nc37','4nnf3','4w6mw','4w76g','4yc85','4ycex','4ynf3','52447','5325m','537nf','53mn8','53wb8','53wp3','556wd','55w5c','55y2m','56c34','56m6y','56ncx','573bn','573d8','574d7','57b27','57gnx','57wdp','58b5m','58pnp','5bb66','5bg8f','5bgp2','5bnd7','5dxnm','5ep3n','5expp','5f3gf','5fyem','5g5e5','5gcd3','5mcy7','5mf7c','5mfff','5mgn4','5mnpd','5n245','5n3w4','5n728','5n732','5ng6e','5nggg','5nm6d','5nnff','5np4m','5npdn','5nxnn','5p3mm','5p8fm','5pm6b','5wddw','5x5nx','5x7x5','5xd2e','5xwcg','5ywwf','5yxgp','62fgn','62nb3','63824','63pxe','646x8','64b3p','64m82','658xe','65ebm','65m85','65nmw','662bw','664dn','664nf','66wp5','675p3','677g3','678w3','67dey','6825y','68wfd','68x48','6b46g','6b4w6','6bdn5','6bnnm','6bxwg','6c3n6','6c3p5','6cm6m','6cwxe','6dd2y','6dmx7','6e2dg','6e554','6e6pn','6ecbn','6end3','6f2yc','6f857','6fg8c','6fgdw','6fn84','6g45w','6ge3p','6gnm3','6m5eg','6mege','6mn8n','6mygb','6n443','6n5fd','6n6gg','6ng6n','6ng6w','6p2ge','6p7gx','6pfy4','6pwcn','6wb76','6wg4n','6wnyc','6xen4','6xpme','6xxdx','6ydyp','728n8','72m6f','73mnx','74853','74eyg','75pfw','7634y','76353','76n7p','76nxn','76y6f','77387','77n6g','77wp4','785n4','78dw6','78eec','7b4bm','7bb7b','7bwm2','7cdge','7cgym','7d44m','7dgc2','7dwx4','7dxbd','7dyww','7e2y7','7f8b3','7fde7','7fmcy','7g3nf','7gce6','7gmf3','7gnge','7gp47','7m8px','7mgmf','7nnnx','7p852','7pcd7','7pn5g','7w67m','7wn74','7wnpm','7wyp4','7xcyd','7xd5m','7y2x4','7yf62','823p2','82fx2','832f3','84py4','84w7x','85622','85dxn','85pew','865wm','8684m','87d4c','87nym','88bgx','88y52','8b735','8bbm4','8bbw8','8c23f','8c2wy','8cccc','8cm46','8d2nd','8d4wm','8d8ep','8db67','8e32m','8eggg','8fexn','8g4yp','8gecm','8gf7n','8gmc4','8gmnx','8n2pg','8n34n','8n4n8','8n56m','8n5p3','8n5pn','8n62n','8n65n','8nbew','8ne4g','8nn73','8np22','8npd5','8npe3','8pfxx','8w754','8w875','8wy7d','8xef7','8y63f','8y6b3','8ypdn','b26nd','b28g8','b2g8e','b2nen','b35f6','b3xpn','b43nw','b4d7c','b4ncn','b4ndb','b4y5x','b55d6','b5dn4','b5fm7','b5nmm','b5pnn','b685n','b6f2p','b84xc','bbymy','bc8nf','bcwnn','bd3b7','bdbb3','bdg84','be3bp','be6np','befbd','bf52c','bgb48','bgd4m','bgem5','bgxcd','bm3p8','bmxpe','bn5mw','bnc2f','bnc5f','bny23','bny4w','bp2d4','bp6mw','bpwd7','bw44w','bw5nf','bw5ym','bw6n6','bwmee','bx5ed','bxxfc','by5y3','byc82','byfgn','c2fb7','c2g4d','c2pg6','c2yn8','c353e','c3572','c3n8x','c43b4','c4527','c482b','c4bgd','c4bny','c4mcm','c55c6','c5xne','c6745','c6f8g','c6we6','c753e','c7gb3','c7nn8','c86md','c8fxy','c8n8c','cb8cf','cc845','ccf2w','ccn2x','cd4eg','cd6p4','cdcb3','cdf77','cdfen','cdmn8','cen55','cewnm','cfc2y','cfc56','cffp4','cfn53','cfp86','cfw6e','cg5dd','cgcgb','cm6yb','cndmc','cnex4','cnmnn','cnwyc','cpc8c','cpe63','cwdnx','cwgyx','cwmny','cx3wg','cy3nw','d22bd','d22n7','d22y5','d236n','d2n8x','d2nbn','d2ycw','d378n','d3c7y','d3c8y','d3ycn','d4n82','d4ppy','d666m','d66cn','d6fcn','d75b5','d7c5x','d7en3','d7nn3','d8dce','d8xcn','dbex3','dbfen','dbny3','dbpcd','dc436','dce8y','dcnp8','dd5w5','dd764','ddcdd','ddcne','ddmyg','ddnpf','ddpyb','ddxpp','de45x','de7f8','deep5','defyx','deneb','dfnx4','dgcm4','dmw8n','dmx8p','dmxp8','dn26n','dn2ym','dn5df','dnmd8','dnne7','dnxdp','dpbyd','dw3nn','dw6mn','dw8d3','dxwcw','dy3cx','dyp7n','dyxnc','e25xg','e2d66','e2mg2','e3cfe','e3ndn','e43ym','e46pd','e46yw','e4gd7','e5n66','e667x','e6b7y','e6m6p','e72cd','e76n4','e7nx4','e7x45','e84n2','e8dxn','e8e5e','ebcbx','ec6pm','ecd4w','edg3p','edwny','ee8fg','een23','ef4mn','ef4np','efb3f','efe62','efg72','efgx5','efx34','egxmp','emwpn','en32e','en4n4','eng53','enn7n','ennmm','enpw2','ep85x','eppg3','ewcf5','ewnx8','ewyg7','excmn','exycn','f228n','f22bn','f2fge','f2m8n','f35xp','f364x','f4fn2','f4wfn','f5cm2','f5e5e','f6bpw','f6ne5','f6ww8','f74x3','f753f','f75cx','f7cey','f83pn','f858x','f85y3','f8f8g','fbp2c','fc2ff','fc6xb','fcey3','fcmem','fcne6','fdpgd','feyc8','ffd6p','ffnxn','ffpxf','fg38b','fg7mg','fg8n4','fgb36','fnbfw','fncnb','fp382','fp3wy','fp5wn','fp762','fpw76','fw3b2','fwxdp','fxpw3','fy2nd','fyfbn','fywb8','g247w','g2577','g2fnw','g3dy6','g3ex3','g55b4','g6n7x','g78gn','g7fmc','g7gnf','g7wxw','g842c','g888x','g8gnd','gbxyy','gc277','gc2wd','gc83b','gcfgp','gcx6f','gd4mf','gd8fb','gdng3','gecmf','gegw4','gewfy','geyn5','gf2g4','gfbx6','gfp54','gfxcc','ggd7m','gm2c2','gm6nn','gm7n8','gmmne','gn2d3','gn2xy','gnbde','gnbn4','gnc3n','gnf85','gng6e','gny6b','gp22x','gp7c5','gpnxn','gpxng','gw468','gw53m','gwn53','gwnm6','gxx2p','gxxpf','gy433','gy5bf','gy8xb','gymmn','m22e3','m23bp','m2576','m2nf4','m3588','m3b5p','m3wfw','m448b','m457d','m4fd8','m4g8g','m5meg','m5ym2','m67b3','m6n4x','m74dm','m75bf','m8gmx','m8m4x','mb4en','mbf58','mbp2y','mc35n','mc8w2','mcc2x','mcg43','mcyfx','md344','mddgb','mdxpn','mdyp7','men4f','mfb3x','mfc35','mg5nn','mgdwb','mggce','mgw3n','mm3nn','mmc5n','mmfm6','mmg2m','mmg38','mmy5n','mn5c4','mnef5','mp7wp','mpmy5','mpxfb','mw5p2','mwdf6','mwxwp','mx8bb','mxnw4','mxyxw','my84e','myc3c','mye68','myf82','n265y','n2by7','n2c85','n2gmg','n336e','n373n','n3bm6','n3ffn','n3m6x','n3x4c','n3xfg','n464c','n4b4m','n4cpy','n4wwn','n4xx5','n5cm7','n5n8b','n5w5g','n5wbg','n5x2n','n6f4b','n6nn2','n6xc5','n7dyb','n7ebx','n7enn','n7ff2','n7g4f','n7meb','n8fp6','n8pfe','n8wxm','n8ydd','nb267','nb45d','nbcgb','nbf8m','nbfx5','nbmx7','nbp3e','nbwnn','nbwpn','nc4yg','ncfgb','ncw4g','ncww7','ncyx8','nd5wg','ndecc','ndg2b','ndme7','ndyfe','ne325','neecd','neggn','nf2n8','nf7bn','nf8b8','nfbg8','nfcb5','nfcwy','nfd8g','nfg23','nfndw','ng2gw','ng46m','ng6yp','ng756','ngn26','nm248','nm46n','nmw46','nmy2x','nn4wx','nn6mg','nn6w6','nnf8b','nnfx3','nngxc','nnn57','nnn5p','nnp4e','nny5e','npxb7','nw5b2','nwfde','nwg2m','nwncn','nxc83','nxcmn','nxf2c','nxn4f','nxx25','nxxf8','ny3dw','ny3nn','ny5dp','ny8np','nybcx','p24gn','p2dw7','p2m6n','p2x7x','p2ym2','p4nm4','p4pde','p57fn','p5g5m','p5nce','p6mn8','p7fyp','p8c24','p8ngx','p8wwf','pbpgc','pcede','pcm7f','pcmcc','pcpg6','pdcp4','pdw38','pdyc8','pe4xn','pf4nb','pf5ng','pg2pm','pg2yx','pg4bf','pgg3n','pgm2e','pgmn2','pgwnp','pm363','pm47f','pmd3w','pme86','pmf5w','pmg55','pn7pn','pnmxf','pnnwy','pp546','pp87n','ppwyd','ppx77','pw5nc','pwebm','pwmbn','pwn5e','px2xp','px8n8','pxdwp','pxne8','pybee','pyefb','pyf65','pym7p','w2e87','w2n7e','w2yp7','w46ep','w48cw','w4cdc','w4cnn','w4nfx','w4x2m','w52fn','w6ny4','w6pxy','w6yne','w75w8','w7e6m','w8bnx','w8f36','wb3ed','wbncw','wc2bd','wce5n','wd2gb','wddcp','wdww8','wecfd','wf684','wfy5m','wg625','wgnwp','wm47f','wm746','wmpmp','wnmyn','wnpec','wwmn6','wxcn8','wxy4n','wyc25','wye85','x277e','x2cnn','x347n','x362g','x37bf','x38fn','x3deb','x3fwf','x44n4','x458w','x4f7g','x4gg5','x4pnp','x5f54','x5nyn','x6b5m','x6pdb','x7422','x74b2','x7547','x76mn','x7746','x775w','x8e8n','x8xnp','xbcbx','xbem6','xc68n','xce8d','xcf88','xcmbp','xdcn4','xdn65','xe6eb','xe8xm','xemyg','xf4p4','xf5g7','xfg65','xfgxb','xfn6n','xgcxy','xmcym','xnd3y','xnfx5','xngxc','xnn4d','xnnc3','xp24p','xw465','xwx7d','xxbm5','xxney','xxw44','xymfn','xyncc','xyyyw','y2436','y2xg4','y2ye8','y32yy','y33nm','y3c58','y48c3','y4ec2','y4g3b','y4n6m','y53c2','y5dpp','y5g87','y5n6d','y5w28','y7d75','y7mnm','y7x8p','y866y','ybfx6','ycmcw','ycnfc','yd38e','yd3m3','yd755','ydd3g','ydg8n','yemy4','yew6p','yeyn4','yf28d','yf347','yf424','yfdn7','yg5bb','ygce8','yge7c','ygenn','ygfwe','ymp7g','ypp8f','ypw3d','yw667','yw7ny','yw8y5','ywn6f','yx2d4','yxd7m','yy824','yyg5g','yyn57'
];

}
