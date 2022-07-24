from . import ocr

dictionary = list()
avaliable_Translations = list()
translated_ocr = []

class Dictionary:
    global name_tran, dictionary, avaliable_Translations
    def add_Translation(self, new_Translation):
        dictionary.append(new_Translation)
        
    def get_Dictionary(self):
        return dictionary

    def get_avaliable_Translations(self):
        for i in  range(len(dictionary)):
            avaliable_Translations.append(dictionary[i]['name'].casefold())
        return avaliable_Translations
def addNewTranslations():
    Dictionary().add_Translation({"name":'White Blood Count', "translation":'كرات الدم البيضاء'}),
    Dictionary().add_Translation({"name":'White Cell Count', "translation":'كرات الدم البيضاء'}),
    Dictionary().add_Translation({"name":'WBC', "translation":'كرات الدم البيضاء'}),
    Dictionary().add_Translation({"name":'WBCs', "translation":'كرات الدم البيضاء'}),
    Dictionary().add_Translation({"name":'Leukocytes', "translation":'كرات الدم البيضاء'}),
    Dictionary().add_Translation({"name":'Red Blood Count',"translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"name":'Red Cell Count', "translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"name":'Red Ceil Count', "translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"name":'RBC', "translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"name":'RBCs', "translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"name":'HGB', "translation":'الهيموغلوبين'}),
    Dictionary().add_Translation({"name":'HB', "translation":'الهيموغلوبين'}),
    Dictionary().add_Translation({"name":'Hemoglobin', "translation":'الهيموغلوبين'}),
    Dictionary().add_Translation({"name":'Haemoglobin', "translation":'الهيموغلوبين'}),
    Dictionary().add_Translation({"name":'Hematocrit', "translation":'خلايا الدم المكدسة'}),
    Dictionary().add_Translation({"name":'Hematocrit (PCV)', "translation":'خلايا الدم المكدسة'}),
    Dictionary().add_Translation({"name":'Haematocrit', "translation":'خلايا الدم المكدسة'}),
    Dictionary().add_Translation({"name":'Haematocrit (PCV)', "translation":'خلايا الدم المكدسة'}),
    Dictionary().add_Translation({"name":'HCT', "translation":'خلايا الدم المكدسة'}),
    Dictionary().add_Translation({"name":'MCV', "translation":'الحجم الكريوي المتوسط'}),
    Dictionary().add_Translation({"name":'MCH', "translation":'متوسط كرات الهيموجلوبين'}),
    Dictionary().add_Translation({"name":'MCHC', "translation":'تركيز ھيموغلوبين الكرية'}),
    Dictionary().add_Translation({"name":'Platelet Count', "translation":'الصفائح الدموية'}),
    Dictionary().add_Translation({"name":'Platelets', "translation":'الصفائح الدموية'}),
    Dictionary().add_Translation({"name":'PLT', "translation":'الصفائح الدموية'}),
    Dictionary().add_Translation({"name":'Red Blood Cell Distribution', "translation":'سعة توزيع كريات الدم الحمراء'}),
    Dictionary().add_Translation({"name":'RDW', "translation":'سعة توزيع كريات الدم الحمراء'}),

    Dictionary().add_Translation({"name":'Mean Platelet Volume', "translation":'متوسط حجم الصفائح الدموية'}),
    Dictionary().add_Translation({"name":'MPV', "translation":'متوسط حجم الصفائح الدموية'}),
    Dictionary().add_Translation({"name":'Lymphocytes', "translation":'عدد اللمفاويات'}),
    Dictionary().add_Translation({"name":'LYMPH', "translation":'عدد اللمفاويات'}),
    Dictionary().add_Translation({"name":'Monocytes', "translation":'الخلايا الوحيدة'}),
    Dictionary().add_Translation({"name":'MONO', "translation":'الخلايا الوحيدة'}),
    Dictionary().add_Translation({"name":'Neutrophils', "translation":'عدد العدلات'}),
    Dictionary().add_Translation({"name":'NEUT', "translation":'عدد العدلات'}),
    Dictionary().add_Translation({"name":'Basophils', "translation":'خلايا الدم البيضاء القاعدية'}),
    Dictionary().add_Translation({"name":'BASO', "translation":'خلايا الدم البيضاء القاعدية'}),
    Dictionary().add_Translation({"name":'Eosinophils',"translation":'يوزينيات'}),
    Dictionary().add_Translation({"name":'EO', "translation":'يوزينيات'}),
    
    # betic Profile تحليل السكر في الدم
    Dictionary().add_Translation({
        "name":'Random Blood Glucose',
        "translation":'نسبة الجلوكوز في الدم العشوائي'}),
    #Hepatitis Markers علامات التهاب الكبد
    Dictionary().add_Translation({
        "name":'Hepatitis B - Surface Antigen',
        "translation":'فيروس B الكبدي السطحي'}),
    Dictionary().add_Translation({
        "name":'HCV Ab by Chemiluminescent technology ',
        "translation":'فيروس C الكبدى - الكيميائى'}),
    #Urine Analysis تحليل البول
    Dictionary().add_Translation({"name":'Color', "translation": 'اللون'}),
    Dictionary().add_Translation({"name":'Aspect', "translation":  'الجانب'}),
    Dictionary().add_Translation({"name":'Volume', "translation":  'الحجم'}),
    Dictionary().add_Translation({"name":'Reaction', "translation":'رد الفعل'}),
    Dictionary().add_Translation({
        "name":'Specific Gravity in urine',
        "translation":'الثقل النوعي في البول'}),
    Dictionary().add_Translation({"name":'Nitrite', "translation":'نتري'}),
    Dictionary().add_Translation({"name":'Albumin', "translation":'الزلال'}),
    Dictionary().add_Translation({"name":'Sugar', "translation":'السكر'}),
    Dictionary().add_Translation({"name":'Acetone', "translation":'أسيتون'}),
    Dictionary().add_Translation({"name":'Bile Salts', "translation":'أملاح الصفراء'}),
    Dictionary().add_Translation({"name":'Bile Pigments', "translation":'أصباغ الصفراء'}),
    Dictionary().add_Translation({"name":'Urobilinogen', "translation":'أوروبيلينوجين'}),
    Dictionary().add_Translation({"name":'Leukocyte esterase', "translation":'الكريات البيض إستراز'}),
    Dictionary().add_Translation({"name":'RBCs', "translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"name":'Pus Cells', "translation":'خلايا القيح'}),
    Dictionary().add_Translation({"name":'Epithelial Cells', "translation":'الخلايا الظهارية'}),
    Dictionary().add_Translation({"name":'Casts', "translation":'تغشيات'}),
    Dictionary().add_Translation({"name":'Ova', "translation":'Ova البويضات'}),
    Dictionary().add_Translation({"name":'Crystals', "translation":'البلورات'}),
    Dictionary().add_Translation({"name":'Mucus', "translation":'مخاط'}),
    Dictionary().add_Translation({"name":'Yeast Cells', "translation":'خلايا الخميرة'}),
    Dictionary().add_Translation({"name":'Trichomonas vaginalis', "translation":'المشعرات المهبلية'}),
    # Serodiagnosis التشخيص المصلي
    Dictionary().add_Translation({
        "name":'CRP “C-reactive protein”',   "translation":'C البروتين التفاعل'}),
    #Kidney function tests تحليل وظائف كُلي
    Dictionary().add_Translation({"name":'Serum Creatinine',   "translation":'مصل الكرياتينين'}),
    Dictionary().add_Translation({"name":'Serum Urea',   "translation":'مصل اليوريا'}),
    Dictionary().add_Translation({"name":'Serum Calcium',   "translation":'مصل الكالسيوم'}),
    Dictionary().add_Translation({"name":'Serum Potassium',   "translation":'مصل البوتاسيوم'}),
    Dictionary().add_Translation({"name":'Serum Sodium',   "translation":'مصل الصوديم'}),

def translationDriver():
    ocrResult = ocr.get_result()
#     cbc = [
#     'White Blood Count',
#     'White Cell Count',
#     'WBC',
#     'WBCs',
#     'Leukocytes',
#     'Red Blood Count',
#     'Red Cell Count',
#     'RBC',
#     'RBCs',
#     'HGB',
#     'HB',
#     'Hemoglobin',
#     'Hematocrit',
#     'HCT',
#     'MCV',
#     'MCHC',
#     'Platelet Count',
#     'Platelets',
#     'PLT',
#     'Red Blood Cell Distribution',
#     'RDW',
#     'Mean Platelet Volume',
#     'MPV',
#     'Lymphocytes',
#     'LYMPH',
#     'Monocytes',
#     'MONO',
#     'Neutrophils',
#     'NEUT',
#     'Basophils',
#     'BASO',
#     'Eosinophils',
#     'EO',
# ]
#     replacedR = []
#     for item in ocrResult.keys():
#         for default in cbc:
#             if item.find(default):
#                 replacedR.append(default)
    
#     print(replacedR)
    addNewTranslations()
    global translated_ocr
    translated_ocr.clear()
    for key in ocrResult.keys():
        if key.replace('_',' ') in Dictionary().get_avaliable_Translations():
            translationIndex = Dictionary().get_avaliable_Translations().index(key.replace('_',' '))
            Dictionary().get_Dictionary()[translationIndex]['value'] = str(ocrResult[key])
            translated_ocr.append(Dictionary().get_Dictionary()[translationIndex])
        else:
            translated_ocr.append({"name":key.replace('_',' '), "translation":"لا توجد ترجمة", "value": str(ocrResult[key])})
    
def get_translated_ocr():
    return translated_ocr
