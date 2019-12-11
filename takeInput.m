function [x, y] = takeInput(image, fname, debug)
    data_path = fullfile('data', fname);
    figure;
    imshow(image);
    hold on;    
    if debug
        [x, y] = ginput(8);
        save(data_path, 'x','y');
    else
        data = load(data_path);
        x = data.x;
        y = data.y;        
    end
end