clear;

%% 读取与定义
% 读取 Lena 图像
I_gray = imread('../std_imgs/lena_gray_256.tif');

% 定义高斯核
h = fspecial('gaussian', [5 5]);

%% 处理
% 空域滤波
A = imfilter(I_gray, h);

% 将图像转换为频域
F = fftshift(fft2(I_gray));

% 定义频域滤波器（高斯低通滤波器）
padded_h = padarray(h, [125 125], 'both');
H = fftshift(fft2(padded_h, 256, 256));

% 计算频域滤波器的效果
G = F .* H;

% 将频域结果转换回空域
B = real(ifft2(ifftshift(G)));
B = ifftshift(B);               % 移回中心

% 计算 A 图像的 PSNR
psnr_A = psnr(A, I_gray);

% 计算 B 图像的 PSNR
psnr_B = psnr(uint8(B), I_gray);

%% 显示
figure;
subplot(131);
imshow(I_gray);
title('原始图像');

subplot(132);
imshow(A);
title(sprintf('空域滤波结果 (PSNR = %.2f)', psnr_A));

subplot(133);
imshow(uint8(B));
title(sprintf('频域滤波结果 (PSNR = %.2f)', psnr_B));