function bag_of_features(imds, storage, wb)
%BAG_OF_FEATURES Summary of this function goes here

wb = waitbar(0, wb, "Splitting Labels");

[trainingSet, validationSet] = splitEachLabel(imds, 0.7, "randomize");

disp(storage.BOFisset);

if storage.BOFisset == 0
    extractor = @custom_extractor;
    
    disp("Is Not Set!");
    
    waitbar(0.1, wb, "Building BoF");
    storage.selectedBOF = bagOfFeatures(trainingSet, "CustomExtractor", extractor);
        
    if storage.shouldExportBOF
        waitbar(0.4, wb, "Saveing BoF");
        bag = storage.selectedBOF;
        save(strcat(storage.outputDirectory, "\bof.mat"), "bag");
    end 
end

waitbar(0.5, wb, "Training Classifier");
categoryClassifier = trainImageCategoryClassifier(trainingSet, storage.selectedBOF);

disp("After Classifier");

waitbar(0.7, wb, "Testing with training data");
confMatrix = evaluate(categoryClassifier, trainingSet);
% save matrix here

waitbar(0.85, wb, "Testing with test data");
confMatrix = evaluate(categoryClassifier, validationSet);
% save matrix here

storage.resultAccuracy = mean(diag(confMatrix));

waitbar(1, wb, "Done!");

end

