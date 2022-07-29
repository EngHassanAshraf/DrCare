from rest_framework.views import APIView
from rest_framework.response import Response

from inimageocr.models import ForTransImage

import pytesseract
import cv2
from inimageocr.intranslation import translationDriver
import arabic_reshaper 
from bidi.algorithm import get_display
import numpy as np
from PIL import ImageFont, ImageDraw
from PIL import Image as img


class RecvImage(APIView):
    
    def get(self, request):
        return Response("waiting")
    def post(self, request):
        recvimage = request.FILES['image']
        print(recvimage)
        recvedImage = ForTransImage.objects.create(img=recvimage)
        imgPath = 'media/'+str(recvedImage)
        print(imgPath)
        
        pytesseract.pytesseract.tesseract_cmd = r'C:\Users\Un-Known\AppData\Local\Tesseract-OCR\tesseract'
        image = cv2.imread(imgPath)
        img_RGB = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        results = pytesseract.image_to_data(img_RGB)
        lines_data=(results.splitlines())
        data={}
        row_num=0
        temp=[]
        for id, line in enumerate(lines_data):
            line=line.split()
            if id != 0:
                if len(line) == 12:
                    if (line[:5]!=temp) :
                        sen=[]
                        for id2, word in enumerate(lines_data):
                                word=word.split()
                                if id2 != 0:
                                    if len(line) == 12:
                                        if (line[0]==word[0] and line[1]==word[1]and line[2]==word[2] and line[3]==word[3]and line[4]== word[4]and line[5]!=word[5]):
                                            if (len(sen)==0):
                                                sen.append(line)
                                                sen.append(word)
                                            else:
                                                sen.append(word)

                                            temp=word[:5]

                        if(len(sen)==0):
                            sen.append(line)
                        data[row_num]=sen
                        row_num+=1
        print(data)

        fontpath = "/inimageocr/font/arial.ttf"
        font = ImageFont.truetype(fontpath, 40)
        image2 = cv2.imread(imgPath)

        for line in data.keys():
            line=data[line]
            X0,Y0=int(line[0][6]),int(line[0][7])
            Xn,Yn,Wn,Hn=int(line[-1][6]),int(line[-1][7]),int(line[-1][8]),int(line[-1][9])
            cv2.rectangle(image2, (X0, Y0), (Wn+Xn, Hn+Yn), (0, 255, 0), 2)
            text=""
            for i in range(len(line)):
                if (text==''):
                    text=line[i][11]
                else:
                    text=text+' '+line[i][11]
            text=translationDriver(text.casefold())
            img_pil = img.fromarray(image2)
            draw = ImageDraw.Draw(img_pil)
            reshaped_text = arabic_reshaper.reshape(text)
            bidi_text = get_display(reshaped_text) 
            draw = ImageDraw.Draw(img_pil)
            draw.text((X0+200, Y0-30),bidi_text, font = font,fill=(255,0,0,255))
            image2 = np.array(img_pil)

        translatedPath = 'media/translated' + str(recvedImage)
        cv2.imwrite(translatedPath,image2)        
        
        return Response('http://192.168.1.37:8000/'+ str(translatedPath))