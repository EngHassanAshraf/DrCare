from django.urls import path
from . import views as v

urlpatterns = [
    path('result/', v.OCR.as_view()),
]
