import { Component, OnInit } from '@angular/core';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-faq',
  templateUrl: './faq.component.html',
  styleUrls: ['./faq.component.css']
})
export class FaqComponent implements OnInit {

  allpost;
  faqHeading;
  faqs;
  PhotoUrl = this.service.PhotoUrl;
  moreless = 'More FAQ ...';

  constructor(private service:SharedService) { }

  ngOnInit(): void {
    this.refreshPost();
  }

  refreshPost() {
    this.service.getPostList(0, 'Events').subscribe(data=>{
      this.allpost = data;
      this.faqHeading = this.allpost.filter(faqHeading => faqHeading.postCode=='7000')[0];
      this.faqs = this.allpost.filter(faqs => faqs.postType=='FAQ').sort(
        (item1,item2) => item1.postCode - item2.postCode);
    });
  }

  isHome() {
    return this.service.isHome();
  }

}
