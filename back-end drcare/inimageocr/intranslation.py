dictionary = list()  
avaliable_Translations = list()
translated_word = ''

class Dictionary:
    global dictionary, avaliable_Translations
    def add_Translation(self, new_Translation):
        dictionary.append(new_Translation)
    def get_Dictionary(self):
        return dictionary

    def get_avaliable_Translations(self):
        for i in  range(len(dictionary)):
            avaliable_Translations.append(dictionary[i]['word'].casefold())
        return avaliable_Translations

def initDic():
    Dictionary().add_Translation({"word":'White Blood Count', "translation":'كرات الدم البيضاء'}),
    Dictionary().add_Translation({"word":'White Cell Count', "translation":'كرات الدم البيضاء'}),
    Dictionary().add_Translation({"word":'WBC', "translation":'كرات الدم البيضاء'}),
    Dictionary().add_Translation({"word":'WBCs', "translation":'كرات الدم البيضاء'}),
    Dictionary().add_Translation({"word":'Leukocytes', "translation":'كرات الدم البيضاء'}),
    Dictionary().add_Translation({"word":'Red Blood Count',"translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"word":'Red Cell Count', "translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"word":'Red Ceil Count', "translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"word":'RBC', "translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"word":'RBCs', "translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"word":'HGB', "translation":'الهيموغلوبين'}),
    Dictionary().add_Translation({"word":'HB', "translation":'الهيموغلوبين'}),
    Dictionary().add_Translation({"word":'Hemoglobin', "translation":'الهيموغلوبين'}),
    Dictionary().add_Translation({"word":'Haemoglobin', "translation":'الهيموغلوبين'}),
    Dictionary().add_Translation({"word":'Hematocrit', "translation":'خلايا الدم المكدسة'}),
    Dictionary().add_Translation({"word":'Hematocrit (PCV)', "translation":'خلايا الدم المكدسة'}),
    Dictionary().add_Translation({"word":'Haematocrit', "translation":'خلايا الدم المكدسة'}),
    Dictionary().add_Translation({"word":'Haematocrit (HCT)', "translation":'خلايا الدم المكدسة'}),
    Dictionary().add_Translation({"word":'Haematocrit (PCV)', "translation":'خلايا الدم المكدسة'}),
    Dictionary().add_Translation({"word":'HCT', "translation":'خلايا الدم المكدسة'}),
    Dictionary().add_Translation({"word":'MCV', "translation":'الحجم الكريوي المتوسط'}),
    Dictionary().add_Translation({"word":'MCH', "translation":'متوسط كرات الهيموجلوبين'}),
    Dictionary().add_Translation({"word":'MCHC', "translation":'تركيز ھيموغلوبين الكرية'}),
    Dictionary().add_Translation({"word":'Platelet Count', "translation":'الصفائح الدموية'}),
    Dictionary().add_Translation({"word":'Platelet', "translation":'الصفائح الدموية'}),
    Dictionary().add_Translation({"word":'Platelets', "translation":'الصفائح الدموية'}),
    Dictionary().add_Translation({"word":'PLT', "translation":'الصفائح الدموية'}),
    Dictionary().add_Translation({"word":'Red Blood Cell Distribution', "translation":'سعة توزيع كريات الدم الحمراء'}),
    Dictionary().add_Translation({"word":'RDW', "translation":'سعة توزيع كريات الدم الحمراء'}),

    Dictionary().add_Translation({"word":'Mean Platelet Volume', "translation":'متوسط حجم الصفائح الدموية'}),
    Dictionary().add_Translation({"word":'MPV', "translation":'متوسط حجم الصفائح الدموية'}),
    Dictionary().add_Translation({"word":'Lymphocytes', "translation":'عدد اللمفاويات'}),
    Dictionary().add_Translation({"word":'LYMPH', "translation":'عدد اللمفاويات'}),
    Dictionary().add_Translation({"word":'Monocytes', "translation":'الخلايا الوحيدة'}),
    Dictionary().add_Translation({"word":'MONO', "translation":'الخلايا الوحيدة'}),
    Dictionary().add_Translation({"word":'Neutrophils', "translation":'عدد العدلات'}),
    Dictionary().add_Translation({"word":'NEUT', "translation":'عدد العدلات'}),
    Dictionary().add_Translation({"word":'Basophils', "translation":'خلايا الدم البيضاء القاعدية'}),
    Dictionary().add_Translation({"word":'BASO', "translation":'خلايا الدم البيضاء القاعدية'}),
    Dictionary().add_Translation({"word":'Eosinophils',"translation":'يوزينيات'}),
    Dictionary().add_Translation({"word":'EO', "translation":'يوزينيات'}),
    
    # betic Profile تحليل السكر في الدم
    Dictionary().add_Translation({
        "word":'Random Blood Glucose',
        "translation":'نسبة الجلوكوز في الدم العشوائي'}),
    #Hepatitis Markers علامات التهاب الكبد
    Dictionary().add_Translation({
        "word":'Hepatitis B - Surface Antigen',
        "translation":'فيروس B الكبدي السطحي'}),
    Dictionary().add_Translation({
        "word":'HCV Ab by Chemiluminescent technology ',
        "translation":'فيروس C الكبدى - الكيميائى'}),
    #Urine Analysis تحليل البول
    Dictionary().add_Translation({"word":'Urine Analysis', "translation": 'تحليل البول'}),
    Dictionary().add_Translation({"word":'Test Name', "translation": 'اسم القيمه'}),
    Dictionary().add_Translation({"word":': Test Name', "translation": 'اسم القيمه'}),
    Dictionary().add_Translation({"word":'Result', "translation": 'النتيجه'}),
    
    Dictionary().add_Translation({"word":'Color', "translation": 'اللون'}),
    Dictionary().add_Translation({"word":'Colour', "translation": 'اللون'}),
    Dictionary().add_Translation({"word":'Yellow', "translation": 'أصفر'}),
    
    Dictionary().add_Translation({"word":'Aspect', "translation":  'الجانب'}),
    Dictionary().add_Translation({"word":'Slightly Turbid', "translation":  'معكر قليلا'}),
    
    Dictionary().add_Translation({"word":'Volume', "translation":  'كثافة'}),
    Dictionary().add_Translation({"word":'Reaction', "translation":'رد الفعل'}),
    Dictionary().add_Translation({
        "word":'Specific Gravity in urine',
        "translation":'الثقل النوعي في البول'}),
    
    Dictionary().add_Translation({"word":'Nitrite', "translation":'نتري'}),
    Dictionary().add_Translation({"word":'Albumin', "translation":'الزلال'}),
    Dictionary().add_Translation({"word":'Sugar', "translation":'السكر'}),
    Dictionary().add_Translation({"word":'Acetone', "translation":'أسيتون'}),
    Dictionary().add_Translation({"word":'Bile Salts', "translation":'أملاح الصفراء'}),
    Dictionary().add_Translation({"word":'Bile Pigments', "translation":'أصباغ الصفراء'}),
    Dictionary().add_Translation({"word":'Negative', "translation":'سلبي'}),
    Dictionary().add_Translation({"word":'Positive', "translation":'إجابي'}),
    
    
    Dictionary().add_Translation({"word":'Urobilinogen', "translation":'أوروبيلينوجين'}),
    Dictionary().add_Translation({"word":'Urobilinegen', "translation":'أوروبيلينوجين'}),
    Dictionary().add_Translation({"word":'Normal Trace', "translation":'تتبع عادي'}),
    
    Dictionary().add_Translation({"word":'Leukocyte esterase', "translation":'الكريات البيض إستراز'}),
    Dictionary().add_Translation({"word":'RBCs', "translation":'كرات الدم الحمراء'}),
    Dictionary().add_Translation({"word":'Pus Cells', "translation":'خلايا القيح'}),
    
    Dictionary().add_Translation({"word":'Epithelial Cells', "translation":'الخلايا الظهارية'}),
    Dictionary().add_Translation({"word":'Some', "translation":'بعض'}),
    
    Dictionary().add_Translation({"word":'Casts', "translation":'تغشيات'}),
    Dictionary().add_Translation({"word":'Ova', "translation":'Ova البويضات'}),
    Dictionary().add_Translation({"word":'Crystals', "translation":'البلورات'}),
    Dictionary().add_Translation({"word":'Mucus', "translation":'مخاط'}),
    Dictionary().add_Translation({"word":'Yeast Cells', "translation":'خلايا الخميرة'}),
    Dictionary().add_Translation({"word":'Trichomonas vaginalis', "translation":'المشعرات المهبلية'}),
    Dictionary().add_Translation({"word":'Nil', "translation":'لا شئ'}),
    
    # Serodiagnosis التشخيص المصلي
    Dictionary().add_Translation({
        "word":'CRP “C-reactive protein”',   "translation":'C البروتين التفاعل'}),
    #Kidney function tests تحليل وظائف كُلي
    Dictionary().add_Translation({"word":'Serum Creatinine',   "translation":'مصل الكرياتينين'}),
    Dictionary().add_Translation({"word":'Serum Urea',   "translation":'مصل اليوريا'}),
    Dictionary().add_Translation({"word":'Serum Calcium',   "translation":'مصل الكالسيوم'}),
    Dictionary().add_Translation({"word":'Serum Potassium',   "translation":'مصل البوتاسيوم'}),
    Dictionary().add_Translation({"word":'Serum Sodium',   "translation":'مصل الصوديم'}),

def translationDriver(text):

    initDic()
    global translated_word
    
    given_word = text         
    
    """  Search for the given word if it has a transltion get the translation if not return لا توجد ترجمة  """
    
    if given_word in Dictionary().get_avaliable_Translations():
        translationIndex = Dictionary().get_avaliable_Translations().index(given_word)
        translated_word = Dictionary().get_Dictionary()[translationIndex]['translation']

    else:
        translated_word = given_word
    return translated_word
