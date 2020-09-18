function points = detect_points(image, storage)
%DETECT_POINTS Summary of this function goes here
%   Detailed explanation goes here

switch storage.detectionMethod
    case "SURF"
        points = detectSURFFeatures(image, ...
            "MetricThreshold", storage.d_surf_metricThreshold, ...
            "NumOctaves", storage.d_surf_numOctaves, ...
            "NumScaleLevels", storage.d_surf_numScaleLevels);
    case "KAZE"
        points = detectKAZEFeatures(image, ...
            "Diffusion", storage.d_kaze_diffusion, ...
            "Threshold", storage.d_kaze_threshold, ...
            "NumOctaves", storage.d_kaze_numOctaves, ...
            "NumScaleLevels", storage.d_kaze_numScaleLevels);
    case "FAST"
        points = detectFASTFeatures(image, ...
            "MinQuality", storage.d_fast_minQuality, ...
            "MinContrast", storage.d_fast_minContrast);
    case "MinEigValue"
        points = detectMinEigenFeatures(image, ...
            "MinQuality", storage.d_mineig_minQuality, ...
            "FilterSize", storage.d_mineig_filterSize);
    case "Harris"
        points = detectHarrisFeatures(image, ...
            "MinQuality", storage.d_harris_minQuality, ...
            "FilterSize", storage.d_harris_filterSize);
    case "BRISK"
        points = detectBRISKFeatures(image, ...
            "MinQuality", storage.d_brisk_minQuality, ...
            "MinContrast", storage.d_brisk_minContrast, ...
            "NumOctaves", storage.d_brisk_numOctaves);
    case "MSER"
        points = detectMSERFeatures(image, ...
            "ThresholdDelta", storage.d_mser_thresholdDelta, ...
            "RegionAreaRange", storage.d_mser_regionAreaRange, ...
            "MaxAreaVariation", storage.d_mser_maxAreaVariation);
    case "ORB"
        points = detectORBFeatures(image, ...
            "ScaleFactor", storage.d_orb_scaleFactor, ...
            "NumLevels", storage.d_orb_numDecompLevels);
end

end

