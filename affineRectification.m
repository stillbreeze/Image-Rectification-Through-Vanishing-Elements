function [affine_rectified, Ha] = affineRectification(image, fname, pt1, pt2, pt3, pt4, pt5, pt6, pt7, pt8)
    l1 = cross(pt1, pt2);
    l2 = cross(pt3, pt4);
    l3 = cross(pt5, pt6);
    l4 = cross(pt7, pt8);
    pinf1 = cross(l1, l2);
    pinf1 = pinf1 / pinf1(3);
    pinf2 = cross(l3, l4);
    pinf2 = pinf2 / pinf2(3);
    linf = cross(pinf1, pinf2);
    Ha = eye(3);
    Ha(end, :) = linf;
    affine_rectified = applyH(image, Ha);

    figure;
    imshow(image);
    hold on;
    axis auto
    line([pinf1(1) pinf2(1)], [pinf1(2) pinf2(2)], 'Marker', 'x', 'Color', 'k', 'LineWidth', 2)   
    image_path_vanishsing = fullfile('results', [fname '_vanishing_line.jpg']);
    saveas(gcf,image_path_vanishsing);
end