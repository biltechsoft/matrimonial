# Generated by Django 4.0 on 2022-05-14 10:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('UserApp', '0003_post_param1_post_param2_post_param3_post_param4_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='post',
            old_name='postTitle',
            new_name='pageTitle',
        ),
    ]