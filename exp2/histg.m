function [histogram, proportion, map] = histg(image)
%HISTG，输入灰度图像，得到它的直方图、像素值累计频率以及灰度均衡映射图
%   输入参数：
%     image: 灰度图像矩阵
%   输出参数：
%     histogram: 直方图，包含每个像素值的频次
%     proportion: 像素值累计频率
%     map: 灰度均衡映射表

% 获取图像大小和像素总数
[M, N] = size(image);
quantity = M * N;

% 初始化直方图、像素值累计频率和映射表
proportion = zeros(1, 256);
%histogram = zeros(1, 256);
%map = zeros(1, 256);

% 计算直方图和像素值累计频率
gray_values = round(image(:) * 255) + 1;  % 将图像矩阵展平并映射到0-255的范围
histogram = accumarray(gray_values, 1, [256, 1])';  % 使用accumarray函数计算直方图
proportion(1) = histogram(1) / quantity;
proportion(2:256) = cumsum(histogram(2:256)) / quantity;

% 计算灰度均衡映射表
map = round(proportion * 255);

end