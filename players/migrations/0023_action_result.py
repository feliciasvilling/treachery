# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-03-30 17:22
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0022_auto_20170329_0900'),
    ]

    operations = [
        migrations.AddField(
            model_name='action',
            name='result',
            field=models.PositiveIntegerField(default=0),
        ),
    ]