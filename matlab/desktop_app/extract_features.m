function [features, validPoints] = extract_features(image, points, storage)
%EXTRACT_FEATURES Summary of this function goes here
%   Detailed explanation goes here

switch storage.extractionMethod
    case "SURF"
        [features, validPoints] = extractFeatures(image, points, "Method", "SURF", "FeatureSize", storage.e_surf_featureSize);
    case "KAZE"
        [features, validPoints] = extractFeatures(image, points, "Method", "KAZE", "FeatureSize", storage.e_kaze_featureSize);
    case "FREAK"
        [features, validPoints] = extractFeatures(image, points, "Method", "FREAK");
    case "BRISK"
        [features, validPoints] = extractFeatures(image, points, "Method", "BRISK");
    case "ORB"
        [features, validPoints] = extractFeatures(image, points, "Method", "ORB");
    case "Block"
        [features, validPoints] = extractFeatures(image, points, "Method", "Block");
    case "HOG"
        [features, validPoints] = extractHOGFeatures(image, points, "CellSize", storage.e_hog_cellSize, "BlockSize", storage.e_hog_blockSize, "NumBins", storage.e_hog_numBins);
end 

end

