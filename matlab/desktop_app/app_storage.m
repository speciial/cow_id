classdef app_storage
    %APP_STORAGE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        detectionMethod;
        extractionMethod;
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

