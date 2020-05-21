%%Start
clear
clc%清除全部
cover = imread('1.tiff');%导入图片
[Stead,bitsnum] = LSB_en(cover);%嵌入随机数据流的数据
imwrite(Stead,'Screat.tiff','tiff');%将修改后的图片保存到基础文件夹里