from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import AnalysisImage
from .ocr import ocrDriver, get_result
from .ocrTranslation import translationDriver, get_translated_ocr
from rest_framework.parsers import MultiPartParser
class OCR(APIView):
    parser_classes = [MultiPartParser]
    def get(self, request):
        return Response({"":""})
    def post(self, request):
        analysisimage = request.FILES['image']
        try:
            recvedimg = AnalysisImage.objects.create(imagetitle=str(analysisimage),analysisimage=analysisimage)
            print(f"image: {recvedimg}")
        except Exception as e:
            print(e)
        ocrDriver(f"media/{recvedimg}")
        ocrresults = get_result()
        print(f" from ocr {ocrresults}")
        translationDriver()
        print(get_translated_ocr())
        return JsonResponse(get_translated_ocr(), safe=False)
