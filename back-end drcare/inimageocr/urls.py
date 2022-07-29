from django.urls import path
from . import views as v

urlpatterns = [
    path('recvimage/', v.RecvImage.as_view()),
]
