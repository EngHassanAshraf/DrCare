import pickle 
import pandas as pd
import numpy as np

# load the model  
model = pickle.load(open('DeTreeClassifier_model.sav', 'rb'))

# take data from the user 
w=float(input('WBC='))
m=float(input('Monocyte='))
l=float(input('Lympocyte='))
a=float(input('Age='))

# make data suitable for model input 
x =pd.DataFrame([w,m,l,a])
x =np.array(x)
x =x.reshape(1,-1)
print((x))
y_pr= model.predict(np.array(x))

# the prediction
if y_pr==0:
  print(f'This subject is COVID-19 negative')
elif y_pr==1:
  print(f'This subject is COVID-19 positive')