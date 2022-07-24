from django.urls import path
from . import views as v

urlpatterns = [
    path('', v.Routing.as_view()),
    path('basicinfo/', v.BasicInfo.as_view()),
    path('classifymodels/ocr/', v.OCRCallAll.as_view()),
    path('classifymodels/enteredvalues/', v.EnteredValuesCallAll.as_view()),
    path('leukemiaclassify/', v.CallLeukemia.as_view()),
]
