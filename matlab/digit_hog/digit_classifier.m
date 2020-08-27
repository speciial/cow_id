syntheticDir = fullfile(toolboxdir('vision'), 'visiondata', 'digits', 'synthetic');
handwrittenDir = fullfile(toolboxdir('vision'), 'visiondata', 'digits', 'handwritten');

trainingSet = imageDatastore(syntheticDir, 'IncludeSubfolders', true, 'LabelSource', "foldernames");
testSet = imageDatastore(handwrittenDir, 'IncludeSubfolders', true, "LabelSource", "foldernames");

countEachLabel(trainingSet)
countEachLabel(testSet)



figure;

subplot(2, 3, 1);
imshow(trainingSet.Files{102});

subplot(2, 3, 2);
imshow(trainingSet.Files{304});

subplot(2, 3, 3);
imshow(trainingSet.Files{809});

subplot(2, 3, 4);
imshow(testSet.Files{13});

subplot(2, 3, 5);
imshow(testSet.Files{37});

subplot(2, 3, 6);
imshow(testSet.Files{97});



exTestImage = readimage(testSet, 37);
processedImage = imbinarize(rgb2gray(exTestImage));

figure;

subplot(1, 2, 1);
imshow(exTestImage);

subplot(1, 2, 2);
imshow(processedImage);


img = readimage(trainingSet, 206);

[hog_2x2, vis2x2] = extractHOGFeatures(img, 'CellSize', [2 2]);
[hog_4x4, vis4x4] = extractHOGFeatures(img, 'CellSize', [4 4]);
[hog_8x8, vis8x8] = extractHOGFeatures(img, 'CellSize', [8 8]);


figure;
subplot(2, 3, 1:3); imshow(img);

subplot(2, 3, 4);
plot(vis2x2);
title({'Cellsize = [2 2]'; ['Length = ' num2str(length(hog_2x2))]});

subplot(2, 3, 5);
plot(vis4x4);
title({'Cellsize = [4 4]'; ['Length = ' num2str(length(hog_4x4))]});

subplot(2, 3, 6);
plot(vis8x8);
title({'Cellsize = [8 8]'; ['Length = ' num2str(length(hog_8x8))]});



cellSize = [4 4];
hogFeatureSize = length(hog_4x4);

numImages = numel(trainingSet.Files);
trainingFeatures = zeros(numImages, hogFeatureSize, 'single');

for i = 1:numImages
    img = readimage(trainingSet, i);
    
    img = rgb2gray(img);
    
    img = imbinarize(img);
    
    trainingFeatures(i, :) = extractHOGFeatures(img, 'CellSize', cellSize);
end

trainingLabels = trainingSet.Labels;

classifier = fitcecoc(trainingFeatures, trainingLabels);

[testFeatures, testLabels] = helperExtractHOGFeaturesFromImageSet(testSet, hogFeatureSize, cellSize);

predictedLabels = predict(classifier, testFeatures);

confMat = confusionmat(testLabels, predictedLabels);

helperDisplayConfusionMatrix(confMat);



function helperDisplayConfusionMatrix(confMat)
% Display the confusion matrix in a formatted table.

% Convert confusion matrix into percentage form
confMat = bsxfun(@rdivide,confMat,sum(confMat,2));

digits = '0':'9';
colHeadings = arrayfun(@(x)sprintf('%d',x),0:9,'UniformOutput',false);
format = repmat('%-9s',1,11);
header = sprintf(format,'digit  |',colHeadings{:});
fprintf('\n%s\n%s\n',header,repmat('-',size(header)));
for idx = 1:numel(digits)
    fprintf('%-9s',   [digits(idx) '      |']);
    fprintf('%-9.2f', confMat(idx,:));
    fprintf('\n')
end
end


function [features, setLabels] = helperExtractHOGFeaturesFromImageSet(imds, hogFeatureSize, cellSize)
% Extract HOG features from an imageDatastore.

setLabels = imds.Labels;
numImages = numel(imds.Files);
features  = zeros(numImages, hogFeatureSize, 'single');

% Process each image and extract features
for j = 1:numImages
    img = readimage(imds, j);
    img = rgb2gray(img);
    
    % Apply pre-processing steps
    img = imbinarize(img);
    
    features(j, :) = extractHOGFeatures(img,'CellSize',cellSize);
end
end
