# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-03 20:22
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0050_goal_label'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='goal',
            name='label',
        ),
    ]