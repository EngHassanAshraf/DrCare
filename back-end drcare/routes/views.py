from rest_framework.views import APIView
from rest_framework.response import Response

class Routing(APIView):
    def get(self, request):
        return Response(
            [
                {
                    'BasicInfo':'http://192.168.1.4:8000/mainmodels/basicinfo/',
                    'ORCCallAll':'http://192.168.1.4:8000/mainmodels/classifymodels/ocr/',
                    'EnteredValuesCallAll':'http://192.168.1.4:8000/mainmodels/classifymodels/enteredvalues/',
                    'CallLeukemia':'http://192.168.1.4:8000/mainmodels/leukemiaclassify/',
                },
                {
                    'OCR':'http://192.168.1.4:8000/ocr/result/',
                }
            ]
        )
