# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-03 20:01
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0049_remove_character_humanity'),
    ]

    operations = [
        migrations.AddField(
            model_name='goal',
            name='label',
            field=models.CharField(default='hidden', max_length=100),
            preserve_default=False,
        ),
    ]