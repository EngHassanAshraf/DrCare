# Generated by Django 3.2.14 on 2022-07-26 11:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainmodels', '0011_leukemiaimage_imagetitle'),
    ]

    operations = [
        migrations.AlterField(
            model_name='leukemiaimage',
            name='imagetitle',
            field=models.CharField(max_length=200),
        ),
    ]
