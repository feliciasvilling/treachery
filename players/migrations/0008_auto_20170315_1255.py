# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-03-15 12:55
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0007_character_willpower'),
    ]

    operations = [
        migrations.RenameField(
            model_name='feeding',
            old_name='healing_aggrevated',
            new_name='heal_aggrevated',
        ),
        migrations.RenameField(
            model_name='feeding',
            old_name='healing_bashing',
            new_name='heal_bashing',
        ),
        migrations.RenameField(
            model_name='feeding',
            old_name='healing_lethal',
            new_name='heal_lethal',
        ),
    ]
