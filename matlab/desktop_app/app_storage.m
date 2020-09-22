classdef app_storage < handle
    %APP_STORAGE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        % Others
        imageData;
        BOFisset;
        selectedBOF;
        shouldExportBOF;
        shouldExportImages;
        dataDirectory;
        outputDirectory;
        resultAccuracy;
        
        % Methods
        detectionMethod;
        extractionMethod;
        
        % Detection Method Parameters
        d_fast_minQuality;
        d_fast_minContrast;
        
        d_mineig_minQuality;
        d_mineig_filterSize;
        
        d_harris_minQuality;
        d_harris_filterSize;
        
        d_surf_metricThreshold;
        d_surf_numOctaves;
        d_surf_numScaleLevels;
        
        d_kaze_diffusion;
        d_kaze_threshold;
        d_kaze_numOctaves;
        d_kaze_numScaleLevels;
        
        d_brisk_minQuality;
        d_brisk_minContrast;
        d_brisk_numOctaves;
        
        d_mser_thresholdDelta;
        d_mser_regionAreaRange;
        d_mser_maxAreaVariation;
        
        d_orb_scaleFactor;
        d_orb_numDecompLevels;
        
        % Extraction Method Parameter
        e_hog_cellSize;
        e_hog_blockSize;
        e_hog_numBins;
        
        e_surf_featureSize;
        
        e_kaze_featureSize;
    end
    
    methods(Access=private)
        function obj = app_storage()
            obj.BOFisset = 0;
            
            obj.shouldExportBOF = 0;
            
            obj.detectionMethod = "SURF";
            obj.extractionMethod = "SURF";
            
            obj.d_fast_minQuality = 0.1;
            obj.d_fast_minContrast = 0.2;
        
            obj.d_mineig_minQuality = 0.01;
            obj.d_mineig_filterSize = 5;
        
            obj.d_harris_minQuality = 0.01;
            obj.d_harris_filterSize = 5;
        
            obj.d_surf_metricThreshold = 1000;
            obj.d_surf_numOctaves = 3;
            obj.d_surf_numScaleLevels = 4;
        
            obj.d_kaze_diffusion = "region";
            obj.d_kaze_threshold = 0.0001;
            obj.d_kaze_numOctaves = 3;
            obj.d_kaze_numScaleLevels = 3;
        
            obj.d_brisk_minQuality = 0.1;
            obj.d_brisk_minContrast = 0.2;
            obj.d_brisk_numOctaves = 4;
        
            obj.d_mser_thresholdDelta = 2;
            obj.d_mser_regionAreaRange = [30 14000];
            obj.d_mser_maxAreaVariation = 0.25;
        
            obj.d_orb_scaleFactor = 1.2;
            obj.d_orb_numDecompLevels = 8;
        
            obj.e_hog_cellSize = [8 8];
            obj.e_hog_blockSize = [2 2];
            obj.e_hog_numBins = 9;
        
            obj.e_surf_featureSize = 64;
        
            obj.e_kaze_featureSize = 64;
        end 
    end 
    
    methods(Static)
        function obj = instance()
            persistent uniqueInstance
            if isempty(uniqueInstance)
                obj = app_storage();
                uniqueInstance = obj;
            else 
                obj = uniqueInstance;
            end
        end 
    end 
end

