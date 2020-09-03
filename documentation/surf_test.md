# SURF Test

## Description
More intensive testing with 10 simulated cows and 50 images per cow.

## Results
``` 
Creating Bag-Of-Features.
-------------------------
* Image category 1: cow_0
* Image category 2: cow_1
* Image category 3: cow_2
* Image category 4: cow_3
* Image category 5: cow_4
* Image category 6: cow_5
* Image category 7: cow_6
* Image category 8: cow_7
* Image category 9: cow_8
* Image category 10: cow_9
* Selecting feature point locations using the Grid method.
* Extracting SURF features from the selected feature point locations.
** The GridStep is [8 8] and the BlockWidth is [32 64 96 128].

* Extracting features from 500 images...done. Extracted 2048000 features.

* Keeping 80 percent of the strongest features from each category.

* Using K-Means clustering to create a 500 word visual vocabulary.
* Number of features          : 1638400
* Number of clusters (K)      : 500

* Initializing cluster centers...100.00%.
* Clustering...completed 26/100 iterations (~5.28 seconds/iteration)...converged in 26 iterations.

* Finished creating Bag-Of-Features

Training an image category classifier for 10 categories.
--------------------------------------------------------
* Category 1: cow_0
* Category 2: cow_1
* Category 3: cow_2
* Category 4: cow_3
* Category 5: cow_4
* Category 6: cow_5
* Category 7: cow_6
* Category 8: cow_7
* Category 9: cow_8
* Category 10: cow_9

* Encoding features for 350 images...done.

* Finished training the category classifier. Use evaluate to test the classifier on a test set.
Evaluating image category classifier for 10 categories.
-------------------------------------------------------

* Category 1: cow_0
* Category 2: cow_1
* Category 3: cow_2
* Category 4: cow_3
* Category 5: cow_4
* Category 6: cow_5
* Category 7: cow_6
* Category 8: cow_7
* Category 9: cow_8
* Category 10: cow_9

* Evaluating 350 images...done.

* Finished evaluating all the test sets.

* The confusion matrix for this test set is:


                                              PREDICTED
KNOWN    | cow_0   cow_1   cow_2   cow_3   cow_4   cow_5   cow_6   cow_7   cow_8   cow_9   
-------------------------------------------------------------------------------------------
cow_0    | 1.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    
cow_1    | 0.00    1.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    
cow_2    | 0.00    0.00    1.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    
cow_3    | 0.00    0.00    0.00    1.00    0.00    0.00    0.00    0.00    0.00    0.00    
cow_4    | 0.00    0.00    0.00    0.00    1.00    0.00    0.00    0.00    0.00    0.00    
cow_5    | 0.00    0.00    0.00    0.00    0.00    1.00    0.00    0.00    0.00    0.00    
cow_6    | 0.00    0.00    0.00    0.00    0.00    0.00    1.00    0.00    0.00    0.00    
cow_7    | 0.00    0.00    0.00    0.00    0.00    0.00    0.00    1.00    0.00    0.00    
cow_8    | 0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    1.00    0.00    
cow_9    | 0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    1.00    

* Average Accuracy is 1.00.

Evaluating image category classifier for 10 categories.
-------------------------------------------------------

* Category 1: cow_0
* Category 2: cow_1
* Category 3: cow_2
* Category 4: cow_3
* Category 5: cow_4
* Category 6: cow_5
* Category 7: cow_6
* Category 8: cow_7
* Category 9: cow_8
* Category 10: cow_9

* Evaluating 150 images...done.

* Finished evaluating all the test sets.

* The confusion matrix for this test set is:


                                              PREDICTED
KNOWN    | cow_0   cow_1   cow_2   cow_3   cow_4   cow_5   cow_6   cow_7   cow_8   cow_9   
-------------------------------------------------------------------------------------------
cow_0    | 1.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    
cow_1    | 0.00    1.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    
cow_2    | 0.00    0.00    1.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    
cow_3    | 0.00    0.00    0.00    1.00    0.00    0.00    0.00    0.00    0.00    0.00    
cow_4    | 0.00    0.00    0.00    0.00    1.00    0.00    0.00    0.00    0.00    0.00    
cow_5    | 0.00    0.00    0.00    0.00    0.00    1.00    0.00    0.00    0.00    0.00    
cow_6    | 0.00    0.00    0.00    0.00    0.00    0.00    1.00    0.00    0.00    0.00    
cow_7    | 0.00    0.00    0.00    0.00    0.00    0.00    0.00    1.00    0.00    0.00    
cow_8    | 0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    1.00    0.00    
cow_9    | 0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    1.00    

* Average Accuracy is 1.00.
```

## Conclusion
Basic transformation on very distinct patterns seem to not be an issue whatsoever for this method. 100% accuracy cannot be a representative result. That most certainly mean, the test data produced by the KRC generator is not remotely close to real-world conditions. Thus rendering it pointless to use. 

Sad... That means more testing and experimenting. On the bright side though, if we can get the real-world training data to a condition comparable to the test data produced by KRC Gen, identification of individual cows should be a breeze (don't quote me on that).