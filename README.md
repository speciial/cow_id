# cow_id
This project takes a look at image based identification of individual cows. Though research on this topic has already been carried out, only very few of the proposed systems were practically implemented. Different approaches, such as identification through muzzle print or body pattern images, were taken in the available research. This projects goal is to explore the full range of steps required for identification and implement a prototype application showcasing the effectiveness of different solutions using MATLAB.

# Topics 
- Current research on cow identification
  - What kind of identification features were used?
  - What techniques were used? 
  - How did the solution perform?
- The state of machine learning and technology
  - How does image recognition work (high-level)?
  - Based on identification features, what's likely a good approach?
- What does MATLAB offer?
  - Which feature extraction method?
  - Which classifier?

# Documentation
1. [Initial Tests](documentation/initial_tests.md) - Some very simple test carried out with an early version of the "KuhR-Code Generator" and a simple SVM classifier.

# Unordered list of things I learned
## Image recognition process
On a high level, image recognition is pretty straight forward. First, you create a set of training and test data. The training set (training images) is then being pre-processed to simplify the next steps and make the model more accurate. After that, features are extracted from the images. This step can either be done manually or automatically using deep learning (see [here](#Machine-Learning-vs-Deep-Learning)). Once the features are extraced and prepared, a classifier is trained. The test set (test images) are used to evaluate the accuracy of the classifier. Different kinds of feature extraction and classification methods can be combined to improve the results. 
1. Image pre-processing 
2. Feature extraction
3. Training of a classifier
4. Evaluate model with test data

## Machine Learning vs Deep Learning 
Deep Learning is a subset of Machine Learning, where the training data (training images) are pre-processed and then directly given to a convolutional neural network. The features of the images will be evaluated automatically by the Deep Learning algorithm. Recent development in the area of DL has shown, that given enough training data, a CNN can produce highly accurate prediction. In the case of animal idenification it does not seem like a useful approach since the amount of training data needed is not practical. Even retraining existing models may not produce good enough results.

## Feature detection and extraction
- BRISK