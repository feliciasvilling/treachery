# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-04 01:00
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0053_character_pronoun'),
    ]

    operations = [
        migrations.AlterField(
            model_name='character',
            name='pronoun',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='players.Pronoun'),
        ),
    ]
