# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-03-20 20:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0014_auto_20170320_1758'),
    ]

    operations = [
        migrations.AddField(
            model_name='actiontype',
            name='no_roll',
            field=models.BooleanField(default=False),
        ),
    ]