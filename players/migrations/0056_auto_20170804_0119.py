# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-04 01:19
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0055_auto_20170804_0110'),
    ]

    operations = [
        migrations.AlterField(
            model_name='character',
            name='picture',
            field=models.ImageField(blank=True, null=True, upload_to='photos/'),
        ),
    ]
