from django.db import models

class AnalysisImage(models.Model):
    imagetitle = models.CharField(max_length=200)
    analysisimage = models.ImageField(upload_to='analysisImages/')
    
    def __str__(self):
        return str(self.analysisimage)