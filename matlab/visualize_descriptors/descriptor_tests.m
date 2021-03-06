%% Detection Functions
% Test and visualize the SURF, KAZE and HOG functions

originalImage = imread("images/0.png");
originalImage = rgb2gray(originalImage);
testImage = imread("images/1.png");
testImage = rgb2gray(testImage);

figure;
subplot(1, 2, 1);
imshow(originalImage);
subplot(1, 2, 2);
imshow(testImage);

% SURF

sfOriginal = detectSURFFeatures(originalImage);
sfTest = detectSURFFeatures(testImage);

[featureOriginal, vpOriginal] = extractFeatures(originalImage, sfOriginal, 'Method', 'SURF');
[featureTest, vpTest] = extractFeatures(testImage, sfTest, 'Method', 'SURF');

matches = matchFeatures(featureOriginal, featureTest);

matchedOriginal = vpOriginal(matches(:, 1));
matchedTest = vpTest(matches(:, 2));

[~, inlierTest, inlierOriginal] = ...
    estimateGeometricTransform(matchedTest, matchedOriginal, 'similarity');

figure
subplot(1, 2, 1);
showMatchedFeatures(originalImage, testImage, matchedOriginal, matchedTest);
subplot(1, 2, 2);
showMatchedFeatures(originalImage, testImage, inlierOriginal, inlierTest);
legend('ptsOriginal', 'pointsTest');

% KAZE

sfOriginal = detectKAZEFeatures(originalImage);
sfTest = detectKAZEFeatures(testImage);

[featureOriginal, vpOriginal] = extractFeatures(originalImage, sfOriginal, 'Method', 'KAZE');
[featureTest, vpTest] = extractFeatures(testImage, sfTest, 'Method', 'KAZE');

matches = matchFeatures(featureOriginal, featureTest);

matchedOriginal = vpOriginal(matches(:, 1));
matchedTest = vpTest(matches(:, 2));

[~, inlierTest, inlierOriginal] = ...
    estimateGeometricTransform(matchedTest, matchedOriginal, 'similarity');

figure
subplot(1, 2, 1);
showMatchedFeatures(originalImage, testImage, matchedOriginal, matchedTest);
subplot(1, 2, 2);
showMatchedFeatures(originalImage, testImage, inlierOriginal, inlierTest);
legend('ptsOriginal', 'pointsTest');

% HOG

sfOriginal = detectKAZEFeatures(originalImage);
sfTest = detectKAZEFeatures(testImage);

[featureOriginal, vpOriginal] = extractHOGFeatures(originalImage, sfOriginal);
[featureTest, vpTest] = extractHOGFeatures(testImage, sfTest);

matches = matchFeatures(featureOriginal, featureTest);

matchedOriginal = vpOriginal(matches(:, 1));
matchedTest = vpTest(matches(:, 2));

[~, inlierTest, inlierOriginal] = ...
    estimateGeometricTransform(matchedTest, matchedOriginal, 'similarity');

figure
subplot(1, 2, 1);
showMatchedFeatures(originalImage, testImage, matchedOriginal, matchedTest);
subplot(1, 2, 2);
showMatchedFeatures(originalImage, testImage, inlierOriginal, inlierTest);
legend('ptsOriginal', 'pointsTest');




