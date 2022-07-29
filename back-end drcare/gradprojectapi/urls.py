from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [

    path('admin/', admin.site.urls),
    path('mainmodels/',include('mainmodels.urls'), name="mainmodels"),
    path('ocr/', include('ocr.urls'), name ='ocr'),
    path('imagetranslation/', include('inimageocr.urls'), name='in image')
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
