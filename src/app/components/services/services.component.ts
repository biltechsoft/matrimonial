import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-services',
  templateUrl: './services.component.html',
  styleUrls: ['./services.component.css']
})
export class ServicesComponent implements OnInit {
  test : Date = new Date();
  focus;
  focus1;
  isAdmin;
  allpost;

  constructor(private service:SharedService) { }

  ngOnInit(): void {
    if(!this.isHome()) { this.refreshPost(); }
  }
  refreshPost() {
    this.service.getPostList().subscribe(data=>{
      this.allpost = data;
    });
  }
  isAdmin() {
    return this.service.isAdmin();
  }
  isHome() {
    return this.service.isHome();
  }


}
