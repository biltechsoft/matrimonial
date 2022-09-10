import { Component, OnInit, Renderer2 } from '@angular/core';
import { NgbDateStruct } from '@ng-bootstrap/ng-bootstrap';
import { Router } from '@angular/router';
import {SharedService} from 'app/shared.service';

@Component({
    selector: 'app-components',
    templateUrl: './components.component.html',
    styles: [`
    ngb-progressbar {
        margin-top: 5rem;
    }
    `]
})

export class ComponentsComponent implements OnInit {
    page = 4;
    page1 = 5;
    focus;
    focus1;
    focus2;
    date: {year: number, month: number};
    model: NgbDateStruct;
    photos;
    modalTitle="";
    webtitle=""; webslogan="";
    allpost; sliders; psliders;
    PhotoUrl = this.service.PhotoUrl;
    constructor(  private renderer : Renderer2,
                  private service:SharedService,
                  private router : Router
                  ) {}
    isWeekend(date: NgbDateStruct) {
        const d = new Date(date.year, date.month - 1, date.day);
        return d.getDay() === 0 || d.getDay() === 6;
    }

    isDisabled(date: NgbDateStruct, current: {month: number}) {
        return date.month !== current.month;
    }

    ngOnInit() {
        /*let input_group_focus = document.getElementsByClassName('form-control');
        let input_group = document.getElementsByClassName('input-group');
        for (let i = 0; i < input_group.length; i++) {
            input_group[i].children[0].addEventListener('focus', function (){
                input_group[i].classList.add('input-group-focus');
            });
            input_group[i].children[0].addEventListener('blur', function (){
                input_group[i].classList.remove('input-group-focus');
            });
        }*/
        this.refreshPost();
    }
    refreshPost() {
      this.service.getPostList().subscribe(data=>{
        this.allpost = data;
        this.getSlider();
        var ban = this.allpost.filter(banner => banner.postType=='Banner');
        this.webtitle = ban[0].param1;
        this.webslogan = ban[0].param2;
      });
    }
    getSlider() {
      this.sliders = this.allpost.filter(slider => (slider.postType=='Slider' && slider.postStatus=='Active'));
      this.sliders = this.sliders.sort((item1, item2) => item2.postCode - item1.postCode);
      this.psliders = this.sliders;
      for(var j=0,i=this.psliders.length; i<9; i++,j++) {
        this.psliders[i] = this.psliders[j];
      }
    }
    isAdmin() {
      return this.service.isAdmin();
    }
    loggedin = this.service.loggedin();
    editClick(type) {
      this.modalTitle='Edit '+type;
    }
    uploadPhoto(event:any, slider){
      if(slider != 0) {
        this.service.deletePhoto({id:1,filetodel:slider.postPhoto}).subscribe();
      }
      var file=event.target.files[0];
      const formData:FormData=new FormData();
      formData.append('uploadedFile',file,file.name);

      this.service.UploadPhoto(formData).subscribe((data:any)=>{
        if(slider==0) {
          var val = {
            postType: 'Slider',
            postPhoto: data.toString(),
            postDetails: 'Success Story!'
          };
          this.service.addPost(val).subscribe();
        }
        else {
          var valu = {
            postId: slider.postId,
            postPhoto: data.toString()
          };
          this.service.updatePost(valu).subscribe();
        }
        this.refreshPost();
      });
    }
    updateSlider() {
      for(var i=0; i<this.sliders.length; i++) {
        this.service.updatePost(this.sliders[i]).subscribe();
      }
      this.refreshPost();
    }
    deleteSlider(slider) {
      this.service.deletePost(slider.postId).subscribe();
      this.service.deletePhoto({id:1,filetodel:slider.postPhoto}).subscribe();
      this.refreshPost();
    }
}
