from django.urls import re_path
from django.urls import path
from UserApp import views
from rest_framework import routers
from django.conf.urls import include

from django.conf.urls.static import static
from django.conf import settings
from .views import *
# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.

#router = routers.DefaultRouter()

urlpatterns=[
    #path('', include(router.urls)),
    re_path(r'^sendmail$',views.email_view),
    re_path(r'^xlread$',views.fromOldDataBaseToNew),
    re_path(r'^matchmaking$',views.make_matching),
    re_path(r'^testmail$',views.make_testmail),
    re_path(r'^adminuser$',views.AdminUserApi),
    re_path(r'^adminuser/([0-9]+)$',views.AdminUserApi),

    re_path(r'^adminlog$',views.AdminLogApi),
    re_path(r'^adminlog/([0-9]+)$',views.AdminLogApi),
    
    re_path(r'^message$',views.MessageApi),
    re_path(r'^message/([0-9]+)$',views.MessageApi),

    re_path(r'^tempuser$',views.TempUserApi),
    re_path(r'^tempuser/([0-9]+)$',views.TempUserApi),

    re_path(r'^maleuser$',views.MaleUserApi),
    re_path(r'^maleuser/([0-9]+)$',views.MaleUserApi),

    re_path(r'^femaleuser$',views.FemaleUserApi),
    re_path(r'^femaleuser/([0-9]+)$',views.FemaleUserApi),

    re_path(r'^matchingtable$',views.MatchingTableApi),
    re_path(r'^matchingtable/([0-9]+)$',views.MatchingTableApi),

    re_path(r'^post$',views.PostApi),
    re_path(r'^post/([0-9]+)$',views.PostApi),

    re_path (r'^SaveFile$', views.SaveFile),
    
    re_path (r'^matchmakingdemo$', views.MatchMakingApi),
    re_path (r'^matchmakingdemo/([0-9]+)$', views.MatchMakingApi),
    
    path('female-info/<int:maleId>/', FemaleInfoByMaleIdView.as_view(), name='female-info-by-male-id'),
    path('male-info/<int:femaleId>/', MaleInfoByFemaleIdView.as_view(), name='male-info-by-female-id'),
    path('all-male-req/', AllRequestByMaleView.as_view(), name='male-req-id'),
    path('all-female-req/', AllRequestByFemaleView.as_view(), name='female-req-id'),
    path('lock-req-by-male/', LockRequestByMaleView.as_view(), name='lock-req-by-male'),
    path('lock-req-by-female/', LockRequestByFemaleView.as_view(), name='lock-req-by-female')


]+ static (settings.STATIC_URL,document_root = settings.STATIC_ROOT)


