# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-01 19:10
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0037_auto_20170801_1904'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='influenceforge',
            name='action_ptr',
        ),
        migrations.RemoveField(
            model_name='influenceforge',
            name='influence',
        ),
        migrations.RemoveField(
            model_name='ghoulaidaction',
            name='betrayal',
        ),
        migrations.RemoveField(
            model_name='primogensaidaction',
            name='betrayal',
        ),
        migrations.DeleteModel(
            name='InfluenceForge',
        ),
    ]