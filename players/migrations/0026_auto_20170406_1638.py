# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-04-06 16:38
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0025_session_previous'),
    ]

    operations = [
        migrations.AlterField(
            model_name='action',
            name='resolved',
            field=models.CharField(choices=[('UNRESOLVED', 'Unresolved'), ('PENDING', 'Pending'), ('Need GM attention', 'Need GM attention'), ('RESOLVED', 'Resolved')], default='UNRESOLVED', max_length=20),
        ),
    ]
