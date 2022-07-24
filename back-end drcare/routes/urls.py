from django.urls import path
from . import views as v

urlpatterns = [
    path('', v.Routing.as_view()),
]