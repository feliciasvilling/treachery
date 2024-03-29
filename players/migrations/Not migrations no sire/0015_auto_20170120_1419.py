# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-01-20 14:19
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0014_keepersquestion_neglectdomain_patroldomain_primogensaidaction_primogensquestion'),
    ]

    operations = [
        migrations.RenameField(
            model_name='character',
            old_name='hiddenGoal',
            new_name='hiddenGoal1',
        ),
        migrations.RenameField(
            model_name='character',
            old_name='openGoal2',
            new_name='hiddenGoal2',
        ),
        migrations.RenameField(
            model_name='character',
            old_name='openGoal1',
            new_name='openGoal',
        ),
        migrations.RenameField(
            model_name='disciplinerating',
            old_name='elderBlood',
            new_name='elder_blood',
        ),
        migrations.RenameField(
            model_name='disciplinerating',
            old_name='elderPowers',
            new_name='elder_powers',
        ),
        migrations.RenameField(
            model_name='disciplinerating',
            old_name='clan',
            new_name='in_clan',
        ),
        migrations.RenameField(
            model_name='historicalcharacter',
            old_name='hiddenGoal',
            new_name='hiddenGoal1',
        ),
        migrations.RenameField(
            model_name='historicalcharacter',
            old_name='openGoal2',
            new_name='hiddenGoal2',
        ),
        migrations.RenameField(
            model_name='historicalcharacter',
            old_name='openGoal1',
            new_name='openGoal',
        ),
        migrations.RenameField(
            model_name='historicaldisciplinerating',
            old_name='elderBlood',
            new_name='elder_blood',
        ),
        migrations.RenameField(
            model_name='historicaldisciplinerating',
            old_name='clan',
            new_name='in_clan',
        ),
        migrations.RenameField(
            model_name='historicalrelationship',
            old_name='character1',
            new_name='character',
        ),
        migrations.RemoveField(
            model_name='bloodbond',
            name='degree',
        ),
        migrations.RemoveField(
            model_name='historicalrelationship',
            name='character2',
        ),
        migrations.RemoveField(
            model_name='relationship',
            name='character1',
        ),
        migrations.RemoveField(
            model_name='relationship',
            name='character2',
        ),
        migrations.AddField(
            model_name='character',
            name='demeanor',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='+', to='players.Nature'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='character',
            name='sire',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='players.Character'),
        ),
        migrations.AddField(
            model_name='historicalcharacter',
            name='demeanor',
            field=models.ForeignKey(blank=True, db_constraint=False, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='+', to='players.Nature'),
        ),
        migrations.AddField(
            model_name='historicalcharacter',
            name='sire',
            field=models.ForeignKey(blank=True, db_constraint=False, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='+', to='players.Character'),
        ),
        migrations.AddField(
            model_name='historicalrelationship',
            name='blood_bond',
            field=models.PositiveIntegerField(choices=[(0, 0), (1, 1), (2, 2), (3, 3)], default=0),
        ),
        migrations.AddField(
            model_name='historicalrelationship',
            name='complicated',
            field=models.BooleanField(default=False),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='relationship',
            name='blood_bond',
            field=models.PositiveIntegerField(choices=[(0, 0), (1, 1), (2, 2), (3, 3)], default=0),
        ),
        migrations.AddField(
            model_name='relationship',
            name='character',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='relationship', to='players.Character'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='relationship',
            name='complicated',
            field=models.BooleanField(default=False),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='character',
            name='nature',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='+', to='players.Nature'),
        ),
    ]
