import { Component, OnInit } from '@angular/core';
import {SharedService} from 'app/shared.service';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {

  constructor(private service:SharedService) { }

  ngOnInit(): void {
  }

  isAdmin() {
    return this.service.isAdmin();
  }

}
