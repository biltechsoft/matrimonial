from django.contrib import admin

from UserApp.models import AdminUser, MaleUser, FemaleUser, MatchingTable,Post,MatchMaking
from import_export.admin import ImportExportModelAdmin
admin.site.register(MatchMaking)
@admin.register(AdminUser)
class AdminUserAdmin(ImportExportModelAdmin):
    list_display=['adminId','adminUserName','adminLevel','adminStatus']
    list_per_page = 20
    list_filter = ['adminId','adminUserName','adminLevel','adminStatus']
    search_fields= ('adminUserName','adminLevel')
    pass


@admin.register(MaleUser)
class MaleUserAdmin(ImportExportModelAdmin):
    list_display=['userId','fullName','state','cellPhone']
    list_per_page = 20
    list_filter = ['userId','fullName','state','cellPhone']
    search_fields= ('fullName','state')
    pass


@admin.register(FemaleUser)
class FemaleUserAdmin(ImportExportModelAdmin):
    list_display=['userId','fullName','state','cellPhone']
    list_per_page = 20
    list_filter = ['userId','fullName','state','cellPhone']
    search_fields= ('fullName','state','cellPhone')
    pass

@admin.register(MatchingTable)
class MatchingTableAdmin(ImportExportModelAdmin):
    list_display=['matchingId','matchingIndicator','matchingDetails','malePoint','femalePoint']
    list_per_page = 20
    list_filter = ['matchingId','matchingIndicator','matchingDetails','malePoint','femalePoint']
    search_fields= ('matchingIndicator','matchingDetails')
    pass


@admin.register(Post)
class PostAdmin(ImportExportModelAdmin):
    list_display=['postId','postType','postDetails']
    list_per_page = 20
    list_filter = ['postId','postType','postDetails']
    search_fields= ('postType','postDetails')
    pass