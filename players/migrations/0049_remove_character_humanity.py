# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-02 01:55
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0048_remove_character_max_willpower'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='character',
            name='humanity',
        ),
    ]
