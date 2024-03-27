% 读取灰度图像
a_1 = imread('..\std_imgs\cameraman.tif');

% 将灰度图像的灰度值范围映射到[0, 1]之间
nmlz = double(a_1) / 255;

% 将灰度值范围缩放到[0, 0.5]之间
b_1 = nmlz * 0.5;

% 显示原始灰度图像
subplot(1, 2, 1);
imshow(a_1);
title('Original Grayscale Image');

% 显示灰度变换后的图像
subplot(1, 2, 2);
imshow(b_1);
title('Grayscale Image after Transformation');

% 保存输出图片
path = '.\output';

if exist(path, 'dir') == 0
    mkdir(path);
end

imwrite(b_1, ".\output\B1.tif");