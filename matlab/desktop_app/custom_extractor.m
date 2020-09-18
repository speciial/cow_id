function [features, featureMetrics, varargout] = custom_extractor(image)

grayImage = rgb2gray(image);

storage = app_storage.instance();

points = detect_points(grayImage, storage);

[features, ~] = extract_features(grayImage, points, storage);

featureMetrics = points.Metric;

if nargout > 2
    % Return feature location information
    varargout{1} = multiscaleGridPoints.Location;
end

end

