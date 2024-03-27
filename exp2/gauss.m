function [img_noised] = gauss(img, v)
%GAUSS 对8bits灰度图像进行加高斯噪声处理

% 确定噪声参数
mean = 0;  % 均值
variance = v;  % 方差

% 生成随机噪声矩阵
noise = sqrt(variance) * randn(size(img)) + mean;

% 将噪声叠加到图像
img_noised = uint8(double(img) + noise);

% 显示原始图像和添加噪声后的图像
figure,
subplot(1, 2, 1), imshow(img), title('原始图像');
subplot(1, 2, 2), imshow(img_noised), title('添加高斯噪声后的图像');

end

