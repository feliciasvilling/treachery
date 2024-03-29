# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-01 23:50
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0042_auto_20170801_2315'),
    ]

    operations = [
        migrations.CreateModel(
            name='Advantage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('costs', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='AdvantageRating',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('learned', models.BooleanField(default=False)),
                ('learning', models.BooleanField(default=False)),
                ('mentor', models.BooleanField(default=False)),
                ('value', models.PositiveIntegerField(default=1)),
                ('exp', models.PositiveIntegerField(default=0)),
                ('advantage', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='players.Advantage')),
                ('character', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='players.Character')),
            ],
        ),
        migrations.CreateModel(
            name='LearnAdvantage',
            fields=[
                ('action_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='players.Action')),
                ('advantage', models.ForeignKey(help_text='What advantage do you want to improve?', on_delete=django.db.models.deletion.CASCADE, to='players.AdvantageRating')),
                ('trainer', models.ForeignKey(blank=True, help_text='Do you have anyone to train you? If so, who?', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='AdvantageTrainee', to='players.Character')),
            ],
            bases=('players.action',),
        ),
    ]
