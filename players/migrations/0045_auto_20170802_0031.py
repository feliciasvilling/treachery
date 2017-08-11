# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-02 00:31
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0044_auto_20170802_0023'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='eventreport',
            name='humanity_exp',
        ),
        migrations.AlterField(
            model_name='eventreport',
            name='aggravated',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='eventreport',
            name='assets',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='eventreport',
            name='blood',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='eventreport',
            name='humanity',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='eventreport',
            name='superficial',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='eventreport',
            name='willpower_points',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='learnadvantage',
            name='advantage',
            field=models.ForeignKey(help_text='What advantage do you want to improve?', on_delete=django.db.models.deletion.CASCADE, to='players.Advantage'),
        ),
    ]
