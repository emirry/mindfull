from rest_framework import serializers, fields
from foodjournal.models import FoodJournal, FoodLogItem, User

#Serializers define the API representation

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['user_name']
        depth = 1
        
class FoodLogItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodLogItem
        fields = ['id', 'name', 'calories', 'fat', 'carbs', 'protein', 'entry']


class FoodJournalSerializer(serializers.ModelSerializer):
    journal_items = FoodLogItemSerializer(many=True)

    class Meta:
        model = FoodJournal
        fields = ['id', 'date', 'user', 'journal_items']
        # fields = ['id', 'date', 'user', 'food_log_item']
        # depth = 1

    def create(self, validated_data):
        foods_data = validated_data.pop('journal_items')
        journal = FoodJournal.objects.create(**validated_data)
        for food in foods_data:
            FoodLogItem.objects.create(entry=journal, **food)
        return journal 
    
    def update(self, instance, validated_data):
        foods_data = validated_data.pop('journal_items')
        foods = (instance.journal_items).all()
        foods = list(foods)
        instance.date = validated_data.get('date', instance.date)
        instance.save()

        for food in foods_data:
            food = foods.pop(0)
            food.name = food.get('name', food.name)
            food.calories = food.get('calories', food.calories)
            food.fat = food.get('fat', food.fat)
            food.carbs = food.get('carbs', food.carbs)
            food.protein = food.get('protein', food.protein)
            food.save()
        return instance

