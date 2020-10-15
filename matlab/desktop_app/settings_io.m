classdef settings_io
    
    methods(Static)
    
        function writeSettingsToFile(filePath)
            storage = app_storage.instance();
            fileID = fopen(strcat(filePath, "\settings.txt"), 'w');
            
            fprintf(fileID, "%s\n", storage.detectionMethod);
            fprintf(fileID, "%s\n", storage.extractionMethod);
            
            fprintf(fileID, "%f\n", storage.d_fast_minQuality);
            fprintf(fileID, "%f\n", storage.d_fast_minContrast);
            
            fprintf(fileID, "%f\n", storage.d_harris_minQuality);
            fprintf(fileID, "%d\n", storage.d_harris_filterSize);
            
            fprintf(fileID, "%f\n", storage.d_surf_metricThreshold);
            fprintf(fileID, "%d\n", storage.d_surf_numOctaves);
            fprintf(fileID, "%d\n", storage.d_surf_numScaleLevels);
        
            fprintf(fileID, "%s\n", storage.d_kaze_diffusion);
            fprintf(fileID, "%f\n", storage.d_kaze_threshold);
            fprintf(fileID, "%d\n", storage.d_kaze_numOctaves);
            fprintf(fileID, "%d\n", storage.d_kaze_numScaleLevels);
        
            fprintf(fileID, "%f\n", storage.d_brisk_minQuality);
            fprintf(fileID, "%f\n", storage.d_brisk_minContrast);
            fprintf(fileID, "%d\n", storage.d_brisk_numOctaves);
        
            fprintf(fileID, "%f\n", storage.d_orb_scaleFactor);
            fprintf(fileID, "%d\n", storage.d_orb_numDecompLevels);
        
            fprintf(fileID, "%d\n", storage.e_hog_cellSize(1,1));
            fprintf(fileID, "%d\n", storage.e_hog_blockSize(1,1));
            fprintf(fileID, "%d\n", storage.e_hog_numBins);
        
            fprintf(fileID, "%d\n", storage.e_surf_featureSize);
        
            fprintf(fileID, "%d\n", storage.e_kaze_featureSize);
            
            fclose(fileID);
        end 
    
        function readSettingsFromFile(filePath)
            storage = app_storage.instance();
            fileID = fopen(filePath, 'r');
            
            storage.detectionMethod = fgetl(fileID);
            storage.extractionMethod = fgetl(fileID);
            
            storage.d_fast_minQuality = str2double(fgetl(fileID));
            storage.d_fast_minContrast = str2double(fgetl(fileID));
        
            storage.d_harris_minQuality = str2double(fgetl(fileID));
            storage.d_harris_filterSize = uint16(str2num(fgetl(fileID)));
        
            storage.d_surf_metricThreshold = str2double(fgetl(fileID));
            storage.d_surf_numOctaves = uint16(str2num(fgetl(fileID)));
            storage.d_surf_numScaleLevels = uint16(str2num(fgetl(fileID)));
        
            storage.d_kaze_diffusion = fgetl(fileID);
            storage.d_kaze_threshold = str2double(fgetl(fileID));
            storage.d_kaze_numOctaves = uint16(str2num(fgetl(fileID)));
            storage.d_kaze_numScaleLevels = uint16(str2num(fgetl(fileID)));;
        
            storage.d_brisk_minQuality = str2double(fgetl(fileID));
            storage.d_brisk_minContrast = str2double(fgetl(fileID));
            storage.d_brisk_numOctaves = uint16(str2num(fgetl(fileID)));
        
            storage.d_orb_scaleFactor = str2double(fgetl(fileID));
            storage.d_orb_numDecompLevels = uint16(str2num(fgetl(fileID)));
        
            temp_cell = uint16(str2num(fgetl(fileID)));
            storage.e_hog_cellSize = [temp_cell temp_cell];
            temp_block = uint16(str2num(fgetl(fileID)));
            storage.e_hog_blockSize = [temp_block temp_block];
            storage.e_hog_numBins = uint16(str2num(fgetl(fileID)));;
        
            storage.e_surf_featureSize = uint16(str2num(fgetl(fileID)));;
        
            storage.e_kaze_featureSize = uint16(str2num(fgetl(fileID)));;
            
        end 
        
    end
    
end 