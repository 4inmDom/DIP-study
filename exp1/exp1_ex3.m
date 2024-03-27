I = imread('output/Cropped.jpg'); %读取灰度图片

out_1 = level(I,0);  % 进行各级灰度处理
out_2 = level(I,1);
out_3 = level(I,2);
out_4 = level(I,3);
out_5 = level(I,4);
out_6 = level(I,5);
out_7 = level(I,6);
out_8 = level(I,7);

subplot(2,4,1),imshow(I),title("origin");
subplot(242),imshow(out_7),title("7bits");
subplot(243),imshow(out_6),title("6bits");
subplot(244),imshow(out_5),title("5bits");
subplot(245),imshow(out_4),title("4bits");
subplot(246),imshow(out_3),title("3bits");
subplot(247),imshow(out_2),title("2bits");
subplot(248),imshow(out_1),title("1bits");