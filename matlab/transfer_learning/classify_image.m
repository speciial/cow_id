I = imread("test_image.png");
I = imresize(I, [227 227]);

[YPred, probs] = classify(trainedNetwork_1, I);
imshow(I)
label = YPred;
title(string(label) + ", " + num2str(100*max(probs),3) + "%");
