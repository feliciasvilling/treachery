# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-01-20 14:23
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0016_auto_20170120_1421'),
    ]

    operations = [
        migrations.AddField(
            model_name='character',
            name='relationships',
            field=models.ManyToManyField(blank=True, related_name='master', to='players.Relationship'),
        ),
    ]
