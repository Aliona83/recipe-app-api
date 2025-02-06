from django import forms
from core.models import Recipe

class RecipeForm(forms.ModelForm):
    class Meta:
        model = Recipe
        fields = ['title', 'description', 'link', 'image','time_minutes','price','user','tags']
