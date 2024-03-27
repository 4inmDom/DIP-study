function [img_f, img_ex] = mean_filter(img, filter_size)
%MEAN_FILTER 对图像进行均值滤波
%   img: 输入图像
%   filter_size: 滤波器大小

% 计算滤波器半径
if mod(filter_size, 2) == 0
    radius = filter_size / 2;
else
    radius = (filter_size - 1) / 2;
end

% 使用镜像法处理边界,利用padarray函数
img_ex = padarray(img, [radius, radius], 'symmetric');

% 滑动滤波器进行均值处理
img_f = zeros(size(img));  % 存储滤波后的图像

for i = 1:size(img, 1)
    for j = 1:size(img, 2)
        window = img_ex(i:i+2*radius, j:j+2*radius);  % 滑动滤波器
        img_f(i, j) = mean(window(:));  % 均值运算
        img_f = im2uint8(img_f);  % 1 bit 转为8 bit    
    end
end

end

