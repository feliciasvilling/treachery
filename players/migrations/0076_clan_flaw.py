# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2017-08-25 23:23
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('players', '0075_feedingrestriction'),
    ]

    operations = [
        migrations.AddField(
            model_name='clan',
            name='flaw',
            field=models.TextField(blank=True),
        ),
    ]