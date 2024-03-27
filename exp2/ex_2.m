% 读取图片并进行灰度值调整
a_2 = imread('..\std_imgs\cameraman.tif');
nmlz = double(a_2) / 255;
b_2 = nmlz * 0.5;

% 对b_2进行灰度值分析
[histogram, prop, map] = histg(b_2);

% 映射b_2的像素值到8位灰度图像
b_2_value = floor(b_2 * 255) + 1;

% 均衡化后的图像
c_2 = zeros(size(b_2));
for i = 1:size(b_2, 1)
    for j = 1:size(b_2, 2)
        c_2(i, j) = map(b_2_value(i, j));
    end
end

% 对c_2进行灰度值分析，用于对比
c_2_n = double(c_2) /255;
[histogram1, prop1, map1] = histg(c_2_n);

% 显示原始图像和均衡化后的图像
figure,
subplot(321), imshow(b_2), title('原始图像');
subplot(322), imshow(c_2 / 255), title('均衡化后的图像');
% 显示直方图和占比图
subplot(323), bar(histogram), xlim([0 255]),
title('原直方图'), xlabel('像素值'), ylabel('频率');
subplot(324), plot(prop), xlim([0 255]),
title('原占比图'), xlabel('像素值'), ylabel('累积概率');
subplot(325), bar(histogram1), xlim([0 255]),
title('处理后直方图'), xlabel('像素值'), ylabel('频率');
subplot(326), plot(prop1), xlim([0 255]),
title('处理后占比图'), xlabel('像素值'), ylabel('累积概率');

imwrite(c_2_n,'.\output\C2.jpg')