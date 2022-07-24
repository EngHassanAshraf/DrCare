from django.apps import AppConfig

import os
import pickle


#hiding tf warnings from terminal 
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'

from tensorflow.python.util import deprecation
deprecation._PRINT_DEPRECATION_WARNINGS = False

import tensorflow as tf
tf.compat.v1.logging.set_verbosity(tf.compat.v1.logging.ERROR)
#


class ModelConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'mainmodels'
    
class AnemiaClassifierConfig(AppConfig):
    # create path to model
    path = os.path.join(r'mainmodels/mlmodels', 'anemia.p')
    
    # load model into separate variables
    # these will be accessible via this class
    with open(path, 'rb') as pickled:
       data = pickle.load(pickled)
    anemiaclassifier = data['classifier']

class CovidClassifierConfig(AppConfig):
    # create path to model
    path = os.path.join(r'mainmodels/mlmodels', 'covid.p')
    
    # load mlmodel into separate variables
    # these will be accessible via this class
    with open(path, 'rb') as pickled:
       data = pickle.load(pickled)
    covidclassifier = data['classifier']
    
# class LeukemiaClassifierConfig(AppConfig):
#     LeukemiaModelPath = os.path.join(r'C:\Users\Un-Known\Desktop\GradProj\mainmodels\mlmodels\leukemia', 'leukemia.h5')

#     leukemiaclassifier = load_model(LeukemiaModelPath)
