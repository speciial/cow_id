function bag_of_features(imds)
%BAG_OF_FEATURES Summary of this function goes here

storage = app_storage.instance();

[trainingSet, validationSet] = splitEachLabel(imds, 0.7, "randomize");

if storage.BOFisset == false
    extractor = @custom_extractor;
    storage.selectedBOF = bagOfFeatures(trainingSet, "CustomExtractor", extractor);

    disp(storage.shouldExportBOF);
    
    if storage.shouldExportBOF
        save("bof.mat", "storage.selectedBOF");
    end 
end

categoryClassifier = trainImageCategoryClassifier(trainingSet, storage.selectedBOF);

confMatrix = evaluate(categoryClassifier, trainingSet);
% save matrix here

confMatrix = evaluate(categoryClassifier, validationSet);
% save matrix here

averageAccuracy = mean(diag(confMatrix));

end

