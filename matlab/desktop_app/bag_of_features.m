function bag_of_features(imds)
%BAG_OF_FEATURES Summary of this function goes here
%   Detailed explanation goes here

[trainingSet, validationSet] = splitEachLabel(imds, 0.6, "randomize");

extractor = @custom_extractor;
bag = bagOfFeatures(trainingSet, "CustomExtractor", extractor);
% save bag here
save("bof.mat", "bag");

categoryClassifier = trainImageCategoryClassifier(trainingSet, bag);
% save bag here
save("classifier.mat", "categoryClassifier");

confMatrix = evaluate(categoryClassifier, trainingSet);
% save matrix here

confMatrix = evaluate(categoryClassifier, validationSet);
% save matrix here

averageAccuracy = mean(diag(confMatrix));

end

