% 读取图像
gray_image = imread("../std_imgs/cameraman.tif");


% 计算原始图像频谱振幅
original_spectrum = abs(fftshift(fft2(gray_image)));

% 设置缩放因子
scaling_factor = 0.5;  % 可根据需要进行调整

% 缩放图像
scaled_image = imresize(gray_image, scaling_factor);

% 计算缩放后图像频谱振幅
scaled_spectrum = abs(fftshift(fft2(scaled_image)));

% 显示原始图像及其频谱振幅
figure;
subplot(2, 2, 1);
imshow(gray_image);
title('原始图像');

subplot(2, 2, 2);
imagesc(log(original_spectrum + 1)),
% colormap jet;
colorbar;
title('原始图像频谱振幅');

% 显示缩放后图像及其频谱振幅
subplot(2, 2, 3);
imshow(scaled_image);
title('缩放后图像');
subplot(2, 2, 4);
imagesc(log(scaled_spectrum + 1));
% colormap jet;
colorbar;
title('缩放后图像频谱振幅');