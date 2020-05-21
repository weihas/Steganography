%%Start
clear
clc%清除全部
cover = imread('Tom.png');%导入图片
subplot(1,3,1);%把figure分成1*3的部分，并把Tom放在第一片区域
imshow(cover);%在figure放出cover
title('载体图像');
fid = fopen('Secret.txt','r');%从文本读取字符串
word = fgets(fid);%将读取的字符串存入word中
fclose(fid);
text(1100,0,'秘密数据:');
text(900,400,word);

%嵌入函数
[Stead,emD,bitsnum] = LSB_en(cover,word);
subplot(1,3,3);
imshow(Stead);
title('载密图像');
imwrite(Stead,'Screat.png','png');