# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-08 21:43
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0066_remove_feeding_has_permission'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ghouldisciplinerating',
            name='ghoul',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='disciplines', to='players.Ghoul'),
        ),
    ]