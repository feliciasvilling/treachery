# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-03-29 09:00
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0021_auto_20170322_1753'),
    ]

    operations = [
        migrations.AlterField(
            model_name='rumor',
            name='rumor_type',
            field=models.CharField(choices=[('Influence', 'Influence'), ('Animal', 'Animal'), ('Faction', 'Faction'), ('Fact', 'Fact'), ('Vampire', 'Vampire')], default='Influence', max_length=15),
        ),
    ]