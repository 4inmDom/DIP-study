i = imread('D:\Pictures\logo\mark.png');

%%
% R = i(:,:,1);    % 若读取RGB图片，有三种将其转为灰度图片的方法
% G = i(:,:,2);
% B = i(:,:,3);

% figure(1);
% subplot(2,2,1);
% imshow(R);
% title("R");
% subplot(2,2,2);
% imshow(G);
% title("G");
% subplot(2,2,3);
% imshow(B);
% title("B");
% subplot(2,2,4);
% imshow(i);
% title("Origin");
% close all;

% gray1 = (R+G+B)/3;   % 三种 RGB 2 GRAY 的方法
% gray2 = G;
% gray3 = 0.2989 * R + 0.5870 * G + 0.1140 * B;  % 函数rgb2gray的算法
% 
% invert1 = 255 - gray1;  % 反色
% invert2 = 255 - gray2;
% invert3 = 255 - gray3;

% figure(2);
% subplot(231);
% imshow(gray1);
% title("gray1");
% subplot(232);
% imshow(gray2);
% title("gray2");
% subplot(233);
% imshow(gray3);
% title("gray3");
% subplot(234);
% imshow(invert1);
% title("invert1");
% subplot(235);
% imshow(invert2);
% title("invert2");
% subplot(236);
% imshow(invert3);
% title("invert3");

% close all;

%%
gray = i;  % 直接读取灰度图片
invert = 255 - gray;

subplot(121),imshow(gray);
subplot(122),imshow(invert);

clearvars -except invert;  % 保留灰度与反色图片，释放其他变量
imwrite(invert,"output/Invert.jpg");