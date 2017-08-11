# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-04 13:43
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0056_auto_20170804_0119'),
    ]

    operations = [
        migrations.CreateModel(
            name='AssignXP',
            fields=[
                ('action_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='players.Action')),
            ],
            bases=('players.action',),
        ),
        migrations.CreateModel(
            name='StatusAssignment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField(choices=[(-1, -1), (0, 0), (1, 1)], default=0)),
            ],
        ),
        migrations.AlterField(
            model_name='character',
            name='picture',
            field=models.ImageField(blank=True, null=True, upload_to=''),
        ),
        migrations.AddField(
            model_name='statusassignment',
            name='assigner',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='status_assignment', to='players.Character'),
        ),
        migrations.AddField(
            model_name='statusassignment',
            name='session',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='players.Session'),
        ),
        migrations.AddField(
            model_name='statusassignment',
            name='target',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='status_assigned', to='players.Character'),
        ),
        migrations.AddField(
            model_name='assignxp',
            name='target',
            field=models.ForeignKey(help_text='Who do you want to revard for providing the juciest gossip?', on_delete=django.db.models.deletion.CASCADE, to='players.Character'),
        ),
    ]
