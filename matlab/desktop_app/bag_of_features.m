function bag_of_features(imds, storage, wb)
%BAG_OF_FEATURES Summary of this function goes here

wb = waitbar(0, wb, "Splitting Labels");

[trainingSet, validationSet] = splitEachLabel(imds, 0.7, "randomize");

if (storage.BOFisset == 0) && (storage.CLASSisset == 0)
    extractor = @custom_extractor;
    
    waitbar(0.1, wb, "Building BoF");
    storage.selectedBOF = bagOfFeatures(trainingSet, "CustomExtractor", extractor);
        
    if storage.shouldExportBOF
        waitbar(0.4, wb, "Saveing BoF");
        bag = storage.selectedBOF;
        save(strcat(storage.outputDirectory, "\", storage.detectionMethod, "_", storage.extractionMethod, ".mat"), "bag");
    end 
end

if storage.CLASSisset == 0
    waitbar(0.5, wb, "Training Classifier");
    storage.selectedClassifier = trainImageCategoryClassifier(trainingSet, storage.selectedBOF);

    if storage.shouldExportClassifier
        waitbar(0.4, wb, "Saveing Classifier");
        classifier = storage.selectedClassifier;
        save(strcat(storage.outputDirectory, "\class_", storage.detectionMethod, "_", storage.extractionMethod, ".mat"), "classifier");
    end 
end 

waitbar(0.7, wb, "Testing with training data");
confMatrix = evaluate(storage.selectedClassifier, trainingSet);
% save matrix here

waitbar(0.85, wb, "Testing with test data");
confMatrix = evaluate(storage.selectedClassifier, validationSet);
% save matrix here

storage.resultAccuracy = mean(diag(confMatrix));

waitbar(1, wb, "Done!");

end

