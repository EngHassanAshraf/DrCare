import cv2
import pytesseract
from PIL import Image
import re
import spacy 

def grayscale(image):
    return cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

def thick_font(image):
    import numpy as np
    image = cv2.bitwise_not(image)
    kernel = np.ones((2,2),np.uint8)
    image = cv2.dilate(image, kernel, iterations=1)
    image = cv2.bitwise_not(image)
    return (image)

def dictionaryResult(preResult):
    analysisValues = dict()
    for item in preResult:
        item = item.casefold()
        if item.count(' ') > 1:
            item = item.replace(' ','_',item.count(' ')-1)
        analysisValues[item[:item.find(' ')]] = item[item.find(' ')+1:]
        
    return analysisValues
finalresult = dict()
def set_result(ocrFinalResult):
    global finalresult
    finalresult = ocrFinalResult
    
def get_result():
    return finalresult

def ocrDriver(imagePath):
    img = cv2.imread(imagePath)
    gray_image = grayscale(img)
    thresh, im_bw = cv2.threshold(gray_image, 150, 160, cv2.THRESH_BINARY)
    final_image = thick_font(im_bw)
    pytesseract.pytesseract.tesseract_cmd = r'C:\Users\Un-Known\AppData\Local\Tesseract-OCR\tesseract'
    custom_config = r'-c preserve_interword_spaces=5 --oem 3 --psm 4 -l eng'
    extracted_text = pytesseract.image_to_string(final_image ,config=custom_config)

    pattern=r'[A-z]+\s?[\(?A-z\)*]*\s?[\(?A-z\)?]*\s?[0-9]+\.?[0-9]*'

    nlp=spacy.blank('en')
    doc=nlp(extracted_text)
    value=[]

    for text in re.finditer(pattern,doc.text):
        start,end=text.span()
        span=doc.char_span(start,end)
        if(len(str(span))>1 and str(span)!="None"):
            value.append(span.text.split("\n")[-1])

    result = dictionaryResult(value)
    set_result(result)

