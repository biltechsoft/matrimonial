# Generated by Django 4.0 on 2022-10-01 00:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('UserApp', '0014_alter_adminlog_action_alter_adminlog_note'),
    ]

    operations = [
        migrations.AddField(
            model_name='adminlog',
            name='xuserId',
            field=models.IntegerField(null=True),
        ),
    ]
