function [pt1, pt2, pt3, pt4, pt5, pt6, pt7, pt8] = getPoints(x, y, fname)
    pt1 = [x(1) y(1) 1];
    pt2 = [x(2) y(2) 1];
    pt3 = [x(3) y(3) 1];
    pt4 = [x(4) y(4) 1];
    pt5 = [x(5) y(5) 1];
    pt6 = [x(6) y(6) 1];
    pt7 = [x(7) y(7) 1];
    pt8 = [x(8) y(8) 1];
    plot([pt1(1),pt2(1)],[pt1(2),pt2(2)], 'Marker', 'x', 'Color', 'g', 'LineWidth', 2);
    plot([pt3(1),pt4(1)],[pt3(2),pt4(2)], 'Marker', 'x', 'Color', 'g', 'LineWidth', 2);
    plot([pt5(1),pt6(1)],[pt5(2),pt6(2)], 'Marker', 'x', 'Color', 'r', 'LineWidth', 2);
    plot([pt7(1),pt8(1)],[pt7(2),pt8(2)], 'Marker', 'x', 'Color', 'r', 'LineWidth', 2);    
    result_path = fullfile('results', [fname '_lines.jpg']);
    saveas(gcf, result_path);
end