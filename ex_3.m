clear;

% 读取 Lena 图像
I_gray = imread('../std_imgs/lena_gray_256.tif');

% 添加高斯噪声
I_noisy = imnoise(I_gray, 'gaussian', 0.05);

%% 频域滤波与处理数据

% 将图像转换为频域
F = fftshift(fft2(I_noisy));

% 定义频域滤波器（高斯低通滤波器）
D = 46; % 截止频率半径, 46平均最佳， psnr在23.3左右
[M, N] = size(I_noisy);
[X, Y] = meshgrid(1:N, 1:M);
center = floor(size(I_noisy)/2) + 1;
H = exp(-((X-center(2)).^2 + (Y-center(1)).^2) / (2*D^2));

% 计算频域滤波器的效果
G = F .* H;

% 将频域结果转换回空域
I_filtered = real(ifft2(ifftshift(G)));

% 计算峰值信噪比 PSNR
psnr = psnr(uint8(I_filtered),I_gray);

%% 显示结果
figure;
subplot(221);
imshow(I_noisy);
title('加噪声图像');

subplot(222);
imshow(log(1 + abs(F)), []);
title('原始图像频域（对数幅度谱）');

subplot(223);
imshow(log(1 + abs(H)), []);
title('频域滤波器');

subplot(224);
imshow(I_filtered, []);
title(sprintf('滤波结果 (PSNR = %.2f)', psnr));