function bag_of_features(imds, storage, wb)
%BAG_OF_FEATURES Summary of this function goes here

wb = waitbar(0, wb, "Saving Settings");

settings_io.writeSettingsToFile(storage.outputDirectory);

waitbar(0.05, wb, "Splitting Labels");

[trainingSet, validationSet] = splitEachLabel(imds, 0.6);

if (storage.BOFisset == 0) && (storage.CLASSisset == 0)
    extractor = @custom_extractor;
    
    waitbar(0.1, wb, "Building BoF");
    storage.selectedBOF = bagOfFeatures(trainingSet, "CustomExtractor", extractor);
        
    if storage.shouldExportBOF
        waitbar(0.2, wb, "Saveing BoF");
        bag = storage.selectedBOF;
        save(strcat(storage.outputDirectory, "\", storage.detectionMethod, "_", storage.extractionMethod, ".mat"), "bag");
    end 
end

if storage.CLASSisset == 0
    waitbar(0.3, wb, "Training Classifier");
    storage.selectedClassifier = trainImageCategoryClassifier(trainingSet, storage.selectedBOF);

    if storage.shouldExportClassifier
        waitbar(0.4, wb, "Saveing Classifier");
        classifier = storage.selectedClassifier;
        save(strcat(storage.outputDirectory, "\class_", storage.detectionMethod, "_", storage.extractionMethod, ".mat"), "classifier");
    end 
end 

waitbar(0.6, wb, "Running Evaluate");
trainConfMat = evaluate(storage.selectedClassifier, trainingSet);
testConfMat = evaluate(storage.selectedClassifier, validationSet);
storage.resultAccuracy = mean(diag(testConfMat));

waitbar(0.8, wb, "Running Predict");
[trainLabelIndex, trainScore] = predict(storage.selectedClassifier, trainingSet);
[testLabelIndex, testScore] = predict(storage.selectedClassifier, validationSet);

writecell(imds.Files, strcat(storage.outputDirectory, "\file_list_in_order.xls"));
writematrix(trainConfMat, strcat(storage.outputDirectory, "\trainconfmat.xls"));
writematrix(testConfMat, strcat(storage.outputDirectory, "\testconfmat.xls"));

writematrix(trainLabelIndex, strcat(storage.outputDirectory, "\trainlabelindex.xls"))
writematrix(trainScore, strcat(storage.outputDirectory, "\trainscore.xls"));

writematrix(testLabelIndex, strcat(storage.outputDirectory, "\testlabelindex.xls"))
writematrix(testScore, strcat(storage.outputDirectory, "\testscore.xls"));

waitbar(1, wb, "Done!");

end

