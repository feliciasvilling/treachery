# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-03-20 17:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0012_auto_20170320_1702'),
    ]

    operations = [
        migrations.AddField(
            model_name='eventreport',
            name='resources',
            field=models.PositiveIntegerField(default=0),
        ),
    ]
