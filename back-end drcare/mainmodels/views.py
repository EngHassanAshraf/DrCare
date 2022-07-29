import os
from numpy import double

# supporing and handling rest-api work
from rest_framework.views import APIView
from rest_framework.response import Response

# for supporting machine learning and deep learning part
# that mentioned in chapter #

from keras.models import load_model
from keras.preprocessing import image
import numpy as np

# importing loaded Ml-models from apps package
from .apps import AnemiaClassifierConfig, CovidClassifierConfig

# importing leukemia images table from database
#to add and get images

from .models import LeukemiaImage

# import ocr package from ocr app
from ocr import ocr

hemoVar = [
    "hemoglobin",
    "hgb",
    "hb"
]
wbcVar = [
    "white_cell_count",
    "white_blood_cell",
    "wbc",
    "wbcs"    
]
motVar = [
    "monocytes",
    "mono",
]
lytVar = [
    "lymphocytes",
    'lymph',
]

age = None
gender = None
ocrresult = dict()
class BasicInfo(APIView):
    def get(self, req):
        return Response("")
    def post(self, req):
        global age, gender
        age = req.data['age']
        gender = req.data['gender']
        return Response(f"age: {age}, gender: {gender}")
class OCRCallAll(APIView):
    def getfinalResponse(self):
        global age, gender, ocrresult
        if len(ocrresult)<=0: return
        
        for item in hemoVar:
            if item in ocrresult:
                hemoglobin = ocrresult[item]
        mch = ocrresult["mch"]
        mchc = ocrresult["mchc"]
        mcv = ocrresult["mcv"]
        for item in wbcVar:
            if item in ocrresult:
                wbc = ocrresult[item]
        for item in motVar:
            if item in ocrresult:
                mot = ocrresult[item]
        for item in lytVar:
            if item in ocrresult:
                lyt = ocrresult[item]

        anemiaresponse = ""
        covidresponse = ""
        # startAnemia()
        print(f"Start Anemia with: \
              {hemoglobin},{mch},{mchc},{mcv},{gender}")
        if gender =='male':
            doublegender = 0
        elif gender == 'female':
            doublegender = 1
        anemiaprediction = AnemiaClassifierConfig.anemiaclassifier.predict(
                    [[
                        double(hemoglobin),
                        double(mch),
                        double(mchc),
                        double(mcv),
                        doublegender
                    ]]
                    )

        if anemiaprediction[0] == [0]:
            anemiaresponse = 'No Anemia'
        elif anemiaprediction[0] == [1]:
            anemiaresponse = 'Found Anemia'
        # startCovid()
        print(f"Start Coivid with: \
            {wbc},{mot},{lyt},{age}")
        covidprediction = CovidClassifierConfig.covidclassifier.predict(
                    [[
                        double(wbc),
                        double(mot),
                        double(lyt),
                        double(age)
                    ]]
                    )

        if covidprediction[0] == [0]:
            covidresponse = 'No Covid'
        elif covidprediction[0] == [1]:
            covidresponse = 'Found Covid'
    
        return {
            "Anemia Test":f"{anemiaresponse}",
            "Covid Test":f"{covidresponse}"
        }
    
    def get(self, request):
        global ocrresult
        ocrresult = ocr.get_result()
        if len(ocrresult) == 0:
            print(f"from callall {ocrresult}")
            return Response({"Anemia Test":{
                        "hgb":"None",
                        "mch":"None",
                        "mchc":"None",
                        "mcv":"None",
                        "gender":f"{gender}",
                        "results":{'Has Anemia?':"None"}
        },
        "Covid Test":{
                        "wbc":"None",
                        "mot":"None",
                        "lyt":"None",
                        "age":f"{age}",
                        "results":{'Has Covid?':"None"}
        },
        })
        finalRes = self.getfinalResponse()
        print(f"from callall {ocrresult}")
        print(finalRes)
        return Response(finalRes)
    
class EnteredValuesCallAll(APIView):
    def get(self, request):
        return Response({"Anemia Test":{
                        "hemoglobin":"None",
                        "mch":"None",
                        "mchc":"None",
                        "mcv":"None",
                        "gender":f"{gender}",
                        "results":{'Has Anemia?':"None"}
        },
        "Covid Test":{
                        "wbc":"None",
                        "mot":"None",
                        "lyt":"None",
                        "age":f"{age}",
                        "results":{'Has Covid?':"None"}
        },
        })
    def post(self, request):
        global age, gender
        hemoglobin = request.data["hemoglobin"]
        mch = request.data["mch"]
        mchc = request.data["mchc"]
        mcv = request.data["mcv"]
        wbc = request.data["wbc"]
        mot = request.data["mot"]
        lyt = request.data["lyt"]
        anemiaresponse = ""
        covidresponse = ""
        # startAnemia()
        print(f"Start Anemia with: \
              {hemoglobin},{mch},{mchc},{mcv},{gender}")
        if gender =='male':
            doublegender = 0
        elif gender == 'female':
            doublegender = 1
        anemiaprediction = AnemiaClassifierConfig.anemiaclassifier.predict(
        [[
        double(hemoglobin),
        double(mch),
        double(mchc),
        double(mcv),
        doublegender
        ]]
        )

        if anemiaprediction[0] == [0]:
            anemiaresponse = 'No Anemia'
        elif anemiaprediction[0] == [1]:
            anemiaresponse = 'Found Anemia'
        # startCovid()
        print(f"Start Coivid with: \
            {wbc},{mot},{lyt},{age}")
        covidprediction = CovidClassifierConfig.covidclassifier.predict(
                    [[
                        double(wbc),
                        double(mot),
                        double(lyt),
                        double(age)
                    ]]
                    )

        if covidprediction[0] == [0]:
            covidresponse = 'No Covid'
        elif covidprediction[0] == [1]:
            covidresponse = 'Found Covid'
        print({
            "Anemia Test":f"{anemiaresponse}",
            "Covid Test":f"{covidresponse}"
        })
        return Response({
            "Anemia Test":f"{anemiaresponse}",
            "Covid Test":f"{covidresponse}"
        })

class CallLeukemia(APIView):
    def get(self, request):
        return Response("Wiat Image")
    def post(self, request):
        #START DO IMAGE WORK#
        leukemiaimage = request.FILES['image']
        print(leukemiaimage)
        recvedImage = LeukemiaImage.objects.create(
            imagetitle=str(leukemiaimage),
            leukemiaimage=leukemiaimage
            )
        #END DO IMAGE WORK#
        
        #START DO MODEL WORK#
        LeukemiaModelPath = os.path.join(r'mainmodels/mlmodels/leukemia', 'leukemia.h5')
        leukemiaclassifier = load_model(LeukemiaModelPath)
        leukemiaclassifier.compile(loss='binary_crossentropy',
        optimizer='rmsprop',
        metrics=['accuracy'])
        #END DO MODEL WORK#
        
        #START CLASSIFICATION#
        if LeukemiaImage.objects.all():
            imagePath = f"media/{recvedImage}"
                #START IMAGE PREPROCESSING#
            img = image.load_img(imagePath, target_size=(150, 150))
            x = image.img_to_array(img)
            x = np.expand_dims(x, axis=0)
            finalimage = np.vstack([x])
            classes = leukemiaclassifier.predict_classes(finalimage, batch_size=10)
                #END IMAGE PREPROCESSING#
                    #GET CLASSIFICATION RESULT#
            if classes == [0]: response = 'No Leukemia'
            elif classes == [1]: response = 'Found Leukemia'
            #CLASSIFICATION RESULT#
            print({"Leukemia Test":f"{response}",})
            return Response({"Leukemia Test":f"{response}",})

class Routing(APIView):
    def get(self, request):
        return Response(
            [
                {
                    'BasicInfo':'http://192.168.1.4:8000/mainmodels/basicinfo/',
                    'ORCCallAll':'http://192.168.1.4:8000/mainmodels/classifymodels/ocr/',
                    'EnteredValuesCallAll':'http://192.168.1.4:8000/mainmodels/classifymodels/enteredvalues/',
                    'CallLeukemia':'http://192.168.1.4:8000/mainmodels/leukemiaclassify/',
                }
            ]
        )         
# class CallAnemia(APIView):
#     def get(self,request):
#         finalResponse = {"Error": "Check Your Entered Data",
#             "info":{
#             "hemoglobin":"none",
#             "mch":"none",
#             "mchc":"none",
#             "mcv":"none",
#             "gender":"none",
#                                 },
#                         "results":{"Animea Test":"none"}}
#         print(f"Respones is :    \n\n {finalResponse} \n\n")
#         return Response(finalResponse)
#     def post(self, request):
#         global gender, age
#         hemoglobin = request.data['hemoglobin']
#         mch = request.data['mch']
#         mchc = request.data['mchc']
#         mcv = request.data['mcv']
        
#         if gender =='male':
#             doublegender = 0
#         elif gender == 'female':
#             doublegender = 1
            
#         try:
#             prediction = AnemiaClassifierConfig.anemiaclassifier.predict([[
#                 double(hemoglobin),
#                 double(mch),
#                 double(mchc),
#                 double(mcv),
#                 doublegender
#             ]])
            
#             if prediction[0] == [0]:
#                 response = 'No Anemia'
#             elif prediction[0] == [1]:
#                 response = 'Found Anemia'
                
#             finalResponse = {"info":{
#             "hemoglobin":f"{hemoglobin}",
#             "mch":f"{mch}",
#             "mchc":f"{mchc}",
#             "mcv":f"{mcv}",
#             "gender":f"{str(gender).lower()}",
#                                     },
#                             "results":{'Has Anemia?':f"{response}"}}
#         except Exception as e:
#             finalResponse = {"Error": "Check Your Entered Data",
#                 "info":{
#                 "hemoglobin":"none",
#                 "mch":"none",
#                 "mchc":"none",
#                 "mcv":"none",
#                 "gender":"none",
#                                     },
#                             "results":{"Animea Test":"none"}}
#         print(f"Respones is :    \n\n {finalResponse} \n\n")
#         return Response(finalResponse)
        
# class CallCovid(APIView):
#     def get(self,request):
#         if request.method == 'GET':
#             # get sound from request
#             wbc = request.GET.get('wbc')
#             mot = request.GET.get('mot')
#             lyt = request.GET.get('lyt')
#             age = request.GET.get('age')
            
#             try:
#                 prediction = CovidClassifierConfig.covidclassifier.predict([[
#                     double(wbc),
#                     double(mot),
#                     double(lyt),
#                     double(age)
#                 ]])
                
#                 if prediction[0] == [0]:
#                     response = 'No Covid'
#                 elif prediction[0] == [1]:
#                     response = 'Found Covid'
                    
#                 finalResponse = {"info":{
#                 "wbc":f"{wbc}",
#                 "mot":f"{mot}",
#                 "lyt":f"{lyt}",
#                 "age":f"{age}"
#                 },
#                 "results":{'Has Covid?':f"{response}"}}
#             except:
#                 finalResponse = {"Error": "Check Your Entered Data",
#                     "info":{
#                     "wbc":"none",
#                     "mot":"none",
#                     "lyt":"none",
#                     "age":"none",
#                     },
#                                 "results":{"Covid Test":"none"}}
#             print(f"Respones is :\n{finalResponse}\n")
#             return Response(finalResponse)
