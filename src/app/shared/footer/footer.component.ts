import { Component, OnInit } from '@angular/core';
import {SharedService} from 'app/shared.service';

@Component({
    selector: 'app-footer',
    templateUrl: './footer.component.html',
    styleUrls: ['./footer.component.scss']
})
export class FooterComponent implements OnInit {
    test : Date = new Date();

    constructor(private service:SharedService) { }
    allpost;
    links;
    ngOnInit() {
        this.refreshPost();
      }
    
      refreshPost() {
        this.service.getPostList(0, 'Services').subscribe(data=>{
          this.allpost = data;
          this.links = this.allpost.filter(links => (links.postCode.startsWith('92') && links.postStatus=='Active'));
        });
      }
}
