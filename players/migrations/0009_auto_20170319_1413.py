# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-03-19 14:13
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0008_auto_20170315_1255'),
    ]

    operations = [
        migrations.CreateModel(
            name='GhoulAidAction',
            fields=[
                ('action_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='players.Action')),
                ('name', models.CharField(blank=True, help_text='if the action is targeting a hook, you need to enter the name of the hook here.', max_length=200)),
                ('betrayal', models.BooleanField(default=False, help_text='Do you want to betray rather than help?')),
                ('action', models.ForeignKey(help_text='What kind of action you are helping them with', on_delete=django.db.models.deletion.CASCADE, to='players.ActionType')),
                ('ghoul', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='players.Ghoul')),
                ('helpee', models.ForeignKey(help_text='Who do you want to help?', on_delete=django.db.models.deletion.CASCADE, related_name='ghoul_help', to='players.Character')),
            ],
            bases=('players.action',),
        ),
        migrations.AddField(
            model_name='actionoption',
            name='name',
            field=models.CharField(default='Any Action', max_length=200),
        ),
    ]
