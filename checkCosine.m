function checkCosine(image, fname, debug, H, Ha)
    data_path = fullfile('data', fname);
    if debug
        figure;
        imshow(image);
        hold on;
        [x, y] = ginput(4);
        save(data_path, 'x','y');    
    else
        data = load(data_path);
        x = data.x;
        y = data.y;        
    end

    pt1 = [x(1) y(1) 1];
    pt2 = [x(2) y(2) 1];
    pt3 = [x(3) y(3) 1];
    pt4 = [x(4) y(4) 1];

    l1 = cross(pt1, pt2);
    l2 = cross(pt3, pt4);
    
    l1_unrect = inv(Ha)' * l1';
    l2_unrect = inv(Ha)' * l2';
    
    cosine3 = dot([l1_unrect(1) l1_unrect(2)],[l2_unrect(1) l2_unrect(2)])/(norm([l1_unrect(1) l1_unrect(2)]) * norm([l2_unrect(1) l2_unrect(2)]));
    
    l1_rect = H' * l1';
    l2_rect = H' * l2';
    cosine_rectified3 = dot([l1_rect(1) l1_rect(2)],[l2_rect(1) l2_rect(2)])/(norm([l1_rect(1) l1_rect(2)]) * norm([l2_rect(1) l2_rect(2)]));
    
    cosine3, cosine_rectified3
    
end