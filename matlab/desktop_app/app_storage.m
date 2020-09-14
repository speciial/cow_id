classdef app_storage
    %APP_STORAGE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        % Others
        selectedBOF;
        shouldExportBOF;
        shouldExportImages;
        outputDirectory;
        
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
        
    end
    
    methods(Access=private)
        function obj = app_storage()
            obj.detectionMethod = "SURF";
            obj.extractionMethod = "SURF";
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

