a_3 = imread("../std_imgs/cameraman.tif");

b_3 = gauss(a_3, 36);

[c_3, c_extend] = mean_filter(b_3, 3);

subplot(221), imshow(a_3), title('原始图像'),
subplot(222), imshow(b_3), title('加高斯噪声后'),
subplot(223), imshow(c_extend), title('边界处理后'),
subplot(224), imshow(c_3), title('均值滤波后');

imwrite(b_3, '.\output\B3.jpg');
imwrite(c_3, '.\output\C3.jpg');
