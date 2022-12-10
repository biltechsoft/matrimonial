import { NgModule } from '@angular/core';
import { CommonModule, } from '@angular/common';
import { BrowserModule  } from '@angular/platform-browser';
import { Routes, RouterModule, CanActivate } from '@angular/router';

import { ComponentsComponent } from './components/components.component';
import { ServicesComponent } from './components/services/services.component';
import { EventsComponent } from './components/events/events.component';
import { AboutComponent } from './components/about/about.component';
import { FaqComponent } from './components/faq/faq.component';
import { DonateComponent } from './components/donate/donate.component';
import { ContactComponent } from './components/contact/contact.component';
import { PrivacyComponent } from './components/privacy/privacy.component';
import { ProfileComponent } from './examples/profile/profile.component';
import { EditProfileComponent } from './examples/profile/edit-profile/edit-profile.component';
import { MessageComponent } from './examples/profile/message/message.component';
import { NotificationComponent } from './examples/profile/notification/notification.component';
import { TopMatchesComponent } from './examples/profile/top-matches/top-matches.component';
import { ViewProfileComponent } from './examples/profile/view-profile/view-profile.component';
import { AdminComponent } from './examples/profile/admin/admin.component';
import { AdminloginComponent } from './examples/adminlogin/adminlogin.component';
import { PasswordComponent } from './examples/password/password.component';

import { SignupComponent } from './examples/signup/signup.component';
import { LoginComponent } from './examples/login/login.component';
import { LandingComponent } from './examples/landing/landing.component';
import { NucleoiconsComponent } from './components/nucleoicons/nucleoicons.component';
//import { MaleuserComponent } from './maleuser/maleuser.component';

import { AuthGuard } from './guards/auth.guard';


const routes: Routes =[
    { path: '', redirectTo: 'home', pathMatch: 'full' },
    { path: 'home',             component: ComponentsComponent },
    { path: 'servicess',        component: ServicesComponent },
    { path: 'events',           component: EventsComponent },
    { path: 'abouts',           component: AboutComponent },
    { path: 'faqs',             component: FaqComponent },
    { path: 'donate',           component: DonateComponent },
    { path: 'contacts',         component: ContactComponent },
    { path: 'privacy',          component: PrivacyComponent },
    { path: 'user-profile/:g/:id',     component: ProfileComponent}, //canActivate : [AuthGuard] },
    { path: 'edit-profile/:g/:id',     component: EditProfileComponent },
    { path: 'message',          component: MessageComponent },
    { path: 'notification',     component: NotificationComponent },
    { path: 'top-matches',      component: TopMatchesComponent },
    { path: 'view-profile/:g/:id/:xid',     component: ViewProfileComponent },
    { path: 'admin',            component: AdminloginComponent },
    { path: 'adminhome',        component: AdminComponent },
    //{ path: 'maleuser',         component: MaleuserComponent },
    { path: 'signup',           component: SignupComponent },
    { path: 'login',            component: LoginComponent },
    { path: 'password/:g/:id',         component: PasswordComponent },
    { path: 'landing',          component: LandingComponent },
    { path: 'nucleoicons',      component: NucleoiconsComponent }
];

@NgModule({
  imports: [
    CommonModule,
    BrowserModule,
    RouterModule.forRoot(routes,{
      useHash: true
    })
  ],
  exports: [
  ],
})
export class AppRoutingModule { }
