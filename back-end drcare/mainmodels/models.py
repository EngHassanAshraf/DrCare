from django.db import models

class LeukemiaImage(models.Model):
    imagetitle = models.CharField(max_length=200)
    leukemiaimage = models.ImageField(upload_to='leukemiaImages/')

    def __str__(self):
        return str(self.leukemiaimage)
