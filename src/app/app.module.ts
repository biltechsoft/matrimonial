import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { RouterModule } from '@angular/router';
import { AppRoutingModule } from './app.routing';
//import { NgxCaptchaModule } from 'ngx-captcha';

import { AppComponent } from './app.component';
import { NavbarComponent } from './shared/navbar/navbar.component';
import { FooterComponent } from './shared/footer/footer.component';

import { ComponentsModule } from './components/components.module';
import { ExamplesModule } from './examples/examples.module';

import {HttpClientModule} from '@angular/common/http';
import { AdminuserComponent } from './adminuser/adminuser.component';
import { SharedService } from './shared.service';
import { MaleuserComponent } from './maleuser/maleuser.component';
import { FemaleuserComponent } from './femaleuser/femaleuser.component';

import { AuthGuard } from './guards/auth.guard';
import { AdminpanelComponent } from './adminuser/adminpanel/adminpanel.component';
import { DashboardComponent } from './adminuser/dashboard/dashboard.component';
import { InboxComponent } from './adminuser/inbox/inbox.component';



@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    FooterComponent,
    AdminuserComponent,
    MaleuserComponent,
    FemaleuserComponent,
    AdminpanelComponent,
    DashboardComponent,
    InboxComponent
  ],
  imports: [
    BrowserModule,
    NgbModule,
    FormsModule,
    RouterModule,
    ComponentsModule,
    ExamplesModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule
  ],
  providers: [SharedService,
              AuthGuard
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
