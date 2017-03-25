# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-03-21 15:10
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0017_remove_character_health'),
    ]

    operations = [
        migrations.CreateModel(
            name='ExpDisciplineSpending',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('exp', models.BooleanField()),
                ('special_exp', models.PositiveIntegerField()),
                ('character', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='exp_dis_spending', to='players.Character')),
                ('discipline', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='players.Discipline')),
                ('session', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='exp_dis_spending', to='players.Session')),
            ],
        ),
    ]