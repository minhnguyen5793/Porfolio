#!/usr/bin/env python
# coding: utf-8

# In[26]:


import tensorflow as tf


# In[27]:


from tensorflow import keras


# In[47]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


# In[29]:


data = keras.datasets.fashion_mnist


# In[30]:


(train_images,train_labels),(test_images, test_labels) = data.load_data()


# In[31]:


print(train_labels[6])


# In[32]:


class_names = ['T-shirt/top', 'Trouser', 'Pullover', 'Dress', 'Coat',
               'Sandal', 'Shirt', 'Sneaker', 'Bag', 'Ankle boot']


# In[33]:


plt.imshow(train_images[7])


# In[34]:


print(train_images[7])


# In[35]:


train_images = train_images/255.0


# In[36]:


test_images = test_images/255.0


# In[37]:


print(train_images[7])


# In[38]:


model = keras.Sequential([
    keras.layers.Flatten(input_shape=(28,28)),
    keras.layers.Dense(128,activation="relu"),
    keras.layers.Dense(10,activation="softmax")
])


# In[39]:


model.compile(optimizer="adam", loss="sparse_categorical_crossentropy", metrics=["accuracy"])


# In[40]:


model.fit(train_images, train_labels, epochs = 10)
test_loss, test_acc = model.evaluate(test_images, test_labels)

print('\nTest accuracy:', test_acc)


# In[68]:


prediction = model.predict(test_images)
for i in range(5):
    plt.grid(False)
    plt.imshow(test_images[i], cmap=plt.cm.binary)
    plt.xlabel("Actual: " + class_names[test_labels[i]])
    plt.title("Prediction: " + class_names[np.argmax(prediction[i])])
    plt.show()



# In[ ]:




