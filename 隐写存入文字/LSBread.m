%%Start
clear
clc
cover = imread('Screat.png');
subplot(1,3,1);
imshow(cover);
title('待解密图像');
Stead = cover;
%提取函数
length = input('Please input arrange number:');
%此处需要提前知道隐藏信息的大小，可事先由传递方告知
length = 7*length;%*7是因为ascii码是七位二进制数组出来的
[exD,Output]=LSB_de(Stead,length);
text(1100,0,'秘密数据:');
text(1000,400,Output);