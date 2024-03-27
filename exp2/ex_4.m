a_4 = imread("../std_imgs/cameraman.tif");  % 原始图像

%% 计算滤波器
factor = 5;  % highboost因子
gauss_kernel = fspecial("gaussian", [5 5], 5);  % 高斯核
laplace_kernel = - fspecial("laplacian", 0.2);  % 拉普拉斯核
highboost = factor * laplace_kernel;  % 高提升滤波核

%% 处理图片,边界处理imfilter默认使用replicate
b_4 = imfilter(a_4, gauss_kernel);  % 高斯模糊
c_4 = b_4 + imfilter(b_4, laplace_kernel);  % 拉普拉斯锐化
d_4 = b_4 + imfilter(b_4, highboost);  % 高提升拉普拉斯锐化

%% 展示处理后图片
subplot(221), imshow(a_4), title("原始图像"), 
subplot(222), imshow(b_4), title("高斯模糊"),
subplot(223), imshow(c_4), title("拉普拉斯锐化"),
subplot(224), imshow(d_4), title("高提升拉普拉斯锐化");

%% 保存结果
imwrite(b_4, '.\output\B4.jpg'),
imwrite(c_4, '.\output\C4.jpg'),
imwrite(d_4, '.\output\D4.jpg');