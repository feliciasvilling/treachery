# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-01-15 17:07
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0002_auto_20170115_1640'),
    ]

    operations = [
        migrations.RenameField(
            model_name='aidaction',
            old_name='namn',
            new_name='name',
        ),
        migrations.RenameField(
            model_name='influencedestroy',
            old_name='inflytande',
            new_name='influence',
        ),
        migrations.RenameField(
            model_name='influenceforge',
            old_name='namn',
            new_name='name',
        ),
        migrations.RenameField(
            model_name='influencesteal',
            old_name='inflytande',
            new_name='influence',
        ),
        migrations.RenameField(
            model_name='investequipment',
            old_name='namn',
            new_name='name',
        ),
        migrations.AddField(
            model_name='clan',
            name='clanDisciplines',
            field=models.ManyToManyField(blank=True, null=True, to='players.Discipline'),
        ),
    ]
