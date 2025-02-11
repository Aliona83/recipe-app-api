"""
URL mappings for the recipe app.
"""
from django.urls import (
    path,
    include,
)

from rest_framework.routers import DefaultRouter

from recipe import views


# router = DefaultRouter()
# router.register('recipes', views.RecipeViewSet)s
# router.register('tags', views.TagViewSet)
# router.register('ingredients', views.IngredientViewSet)

app_name = 'recipe'

urlpatterns = [
    path('', views.welcome_page, name='welcome-page'),
    path('recipe-list/', views.recipe_list, name='recipe-list'),
    path('add/',views.add_recipe, name='add-recipe'),
]