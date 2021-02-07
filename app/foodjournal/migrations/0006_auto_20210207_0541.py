# Generated by Django 3.1.6 on 2021-02-07 05:41

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('foodjournal', '0005_auto_20210207_0439'),
    ]

    operations = [
        migrations.CreateModel(
            name='FoodLogItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('calories', models.IntegerField()),
                ('fat', models.FloatField()),
                ('protein', models.FloatField()),
                ('carbs', models.FloatField()),
            ],
        ),
        migrations.RemoveField(
            model_name='foodjournal',
            name='calories',
        ),
        migrations.RemoveField(
            model_name='foodjournal',
            name='name',
        ),
        migrations.AddField(
            model_name='foodjournal',
            name='date',
            field=models.DateField(auto_now=True),
        ),
        migrations.AddField(
            model_name='foodjournal',
            name='food_log_item',
            field=models.ForeignKey(default=True, on_delete=django.db.models.deletion.CASCADE, to='foodjournal.foodlogitem'),
            preserve_default=False,
        ),
    ]