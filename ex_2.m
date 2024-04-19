% 读取图像
gray_image = imread("../std_imgs/cameraman.tif");

% 计算原始图像频谱振幅
original_spectrum = abs(fftshift(fft2(gray_image)));

% 设置旋转角度（以度为单位）
rotation_angle = 45;  % 可根据需要进行调整

% 旋转图像
rotated_image = imrotate(gray_image, rotation_angle);

% 计算旋转后图像频谱振幅
rotated_spectrum = abs(fftshift(fft2(rotated_image)));

% 显示原始图像及其频谱振幅
figure;
subplot(2, 2, 1);
imshow(gray_image);
title('原始图像');
subplot(2, 2, 2);
imagesc(log(original_spectrum + 1));
colorbar;
title('原始图像频谱振幅');

% 显示旋转后图像及其频谱振幅
subplot(2, 2, 3);
imshow(rotated_image);
title('旋转后图像');
subplot(2, 2, 4);
imagesc(log(rotated_spectrum + 1));
colorbar;
title('旋转后图像频谱振幅');