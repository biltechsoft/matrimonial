# Generated by Django 4.0 on 2022-05-13 16:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('UserApp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='postCode',
            field=models.CharField(default='0000', max_length=4),
            preserve_default=False,
        ),
    ]
