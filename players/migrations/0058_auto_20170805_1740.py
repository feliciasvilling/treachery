# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-05 17:40
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0057_auto_20170804_1343'),
    ]

    operations = [
        migrations.AddField(
            model_name='character',
            name='defined',
            field=models.BooleanField(default=True),
        ),
        migrations.AlterField(
            model_name='character',
            name='nature',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='players.Nature'),
        ),
    ]
