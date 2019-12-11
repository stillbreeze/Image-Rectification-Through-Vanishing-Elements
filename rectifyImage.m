function [metric_rectified, H_final] = rectifyImage(filename, debug)

    % Take input of parallel lines if debug is 1, else load from mat
    [~, fname] = fileparts(filename);
    image = imread(filename);
    [x, y] = takeInput(image, [fname '_parallel'], debug);
    
    % Fetch marked points and save the lines
    [pt1, pt2, pt3, pt4, pt5, pt6, pt7, pt8] = getPoints(x, y, [fname '_parallel']);
    
    % Do affine rectification
    [affine_rectified, Ha] = affineRectification(image, fname, pt1, pt2, pt3, pt4, pt5, pt6, pt7, pt8);
    
    % Plot and save affine rectified image
    figure;
    image_path_affine = fullfile('results', [fname '_affine_rect.jpg']);
    imshow(affine_rectified);
    hold on;
    saveas(gcf, image_path_affine);
    
    
    % Take input of perpendicular lines if debug is 1, else load from mat
    [x, y] = takeInput(affine_rectified, [fname '_perpendicular'], debug);
    
    % Fetch marked points and save the lines
    [pt1, pt2, pt3, pt4, pt5, pt6, pt7, pt8] = getPoints(x, y, [fname '_perpendicular']);

    % Do metric rectification
    [metric_rectified, Hm] = metricRectification(affine_rectified, pt1, pt2, pt3, pt4, pt5, pt6, pt7, pt8, Ha);

    % Plot and save affine rectified image
    figure;
    image_path_metric = fullfile('results', [fname '_metric_rect.jpg']);
    imshow(metric_rectified);
    hold on;
    saveas(gcf, image_path_metric);
    
    % Check cosine angles for another perpendicular line pair
    H_final = Ha * Hm;
    checkCosine(affine_rectified, [fname '_check'], debug, inv(Hm), Ha);
    close all;
end