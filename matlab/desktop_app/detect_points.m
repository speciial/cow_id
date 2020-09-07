function points = detect_points(image, method)
%DETECT_POINTS Summary of this function goes here
%   Detailed explanation goes here

switch method
    case "SURF"
        points = detectSURFFeatures(image);
    case "KAZE"
        points = detectKAZEFeatures(image);
    case "FAST"
        points = detectFASTFeatures(image);
    case "MinEigValue"
        points = detectMinEigenFeatures(image);
    case "Harris"
        points = detectHarrisFeatures(image);
    case "BRISK"
        points = detectBRISKFeatures(image);
    case "MSER"
        points = detectMSERFeatures(image);
    case "ORB"
        points = detectORBFeatures(image);
end

end

