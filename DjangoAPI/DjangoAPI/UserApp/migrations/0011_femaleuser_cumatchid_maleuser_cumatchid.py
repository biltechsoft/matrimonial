# Generated by Django 4.0 on 2022-09-17 09:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('UserApp', '0010_femaleuser_lockedid_maleuser_lockedid_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='femaleuser',
            name='cuMatchId',
            field=models.CharField(max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='maleuser',
            name='cuMatchId',
            field=models.CharField(max_length=1000, null=True),
        ),
    ]
