%%Start
clear
clc %清屏
photo = imread('Screat.tiff');%导入载密图像
subplot(1,3,1);%把figure分成1*3的部分，并把待分析放在第一片区域
imshow(photo);%在figure放photo并展示
title('待分析图像');
 
[output,bitsum] = extract(photo);%输出图像的底层像素
subplot(1,3,2);%把figure分成1*3的部分，并把待分析放在第二片区域
imshow(output);%展示最底层分解像素值的分布
title('最底层分解');
imwrite(output,'Screat1.tiff','tiff');%将最底层的分解像素图输出

flag = 1;
[flag] = compare(photo,flag);%卡方分析
if flag==1
    text(20,2000,'待分析图片是原图！');
else
    text(20,2000,'待分析图片可能载密！');
end
    