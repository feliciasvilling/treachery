# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-01 18:41
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0035_auto_20170801_1837'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='character',
            name='demeanor',
        ),
    ]
