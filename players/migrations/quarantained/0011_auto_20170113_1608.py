# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-01-13 16:08
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0010_auto_20170113_1608'),
    ]

    operations = [
        migrations.AlterField(
            model_name='character',
            name='disciplines',
            field=models.ManyToManyField(blank=True, to='players.DisciplineStat'),
        ),
    ]
