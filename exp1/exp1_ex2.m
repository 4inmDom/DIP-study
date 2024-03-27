invert = imread("std_imgs/cameraman.tif");

rect = [128 128 255 255];  % 裁剪框为居中正方形
cropped = imcrop(invert,rect);  

sized1 = imresize(cropped,0.5);  % 分别缩放对应的scale
sized2 = imresize(cropped,0.25);
sized3 = imresize(cropped,0.125);
sized4 = imresize(cropped,0.0625);
sized5 = imresize(cropped,0.03125);

figure(1);  % 显示裁剪效果
subplot(1,2,1),imshow(invert); 
title('原图像')
rectangle('Position',rect,'LineWidth',1,'EdgeColor','r') %显示裁剪矩形框
subplot(1,2,2),imshow(cropped);   
title('裁剪图像');

figure(2);  % 显示缩放效果
subplot(2,3,1),imshow(sized1),title("缩放1/2");  
subplot(2,3,2),imshow(sized2),title("缩放1/4");
subplot(2,3,3),imshow(sized3),title("缩放1/8");
subplot(2,3,4),imshow(sized4),title("缩放1/16");
subplot(2,3,5),imshow(sized5),title("缩放1/32");

imwrite(cropped,"output/Cropped.jpg");  % 存储截取与缩放后的图片
imwrite(sized1,"output/Resize_1.jpg");
imwrite(sized2,"output/Resize_2.jpg");
imwrite(sized3,"output/Resize_3.jpg");
imwrite(sized4,"output/Resize_4.jpg");
imwrite(sized5,"output/Resize_5.jpg");
