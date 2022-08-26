import { Component, OnInit } from '@angular/core';
import { render } from 'creditcardpayments/creditCardPayments';

@Component({
  selector: 'app-donate',
  templateUrl: './donate.component.html',
  styleUrls: ['./donate.component.css']
})
export class DonateComponent implements OnInit {

  constructor() {

  }

  ngOnInit(): void {
    render(
      {
          id: "#payments",
          currency: "USD",
          value: "10.00",
          onApprove: (details) => {
            alert("Donation Successfull");

          }
        }
      );
  }

}
