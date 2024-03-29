# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-21 16:48
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0073_remove_character_picture'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='character',
            name='relationships',
        ),
        migrations.AddField(
            model_name='relationship',
            name='other_character',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='slave', to='players.Character'),
        ),
        migrations.AlterField(
            model_name='character',
            name='concept',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='relationship',
            name='character',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='master', to='players.Character'),
        ),
        migrations.AlterField(
            model_name='relationship',
            name='description',
            field=models.CharField(max_length=100),
        ),
    ]
