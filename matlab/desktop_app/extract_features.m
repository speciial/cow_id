function [features, validPoints] = extract_features(image, points, method)
%EXTRACT_FEATURES Summary of this function goes here
%   Detailed explanation goes here

switch method
    case "SURF"
        [features, validPoints] = extractFeatures(image, points, "Method", "SURF");
    case "KAZE"
        [features, validPoints] = extractFeatures(image, points, "Method", "KAZE");
    case "FREAK"
        [features, validPoints] = extractFeatures(image, points, "Method", "FREAK");
    case "BRISK"
        [features, validPoints] = extractFeatures(image, points, "Method", "BRISK");
    case "ORB"
        [features, validPoints] = extractFeatures(image, points, "Method", "ORB");
    case "Block"
        [features, validPoints] = extractFeatures(image, points, "Method", "Block");
    case "HOG"
        [features, validPoints] = extractHOGFeatures(image, points);
end 

end

