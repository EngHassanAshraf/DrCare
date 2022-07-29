from distutils.command.upload import upload
from django.db import models

class ForTransImage(models.Model):
    img = models.ImageField(upload_to='fortranslation/')
    
    def __str__(self) -> str:
        return str(self.img)