# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-07-26 18:54
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0030_auto_20170726_1147'),
    ]

    operations = [
        migrations.AddField(
            model_name='session',
            name='season',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='players.Season'),
        ),
    ]
