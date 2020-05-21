clear %清除工作区数据
clc %清除命令行数据
cover = imread('2.tiff');%读入载体图像数据
subplot(231);%创建窗口显示图像，此表达意思为窗口中显示2*3个子图，在第一个子图中绘图
imshow(cover);%显示载体图像，自动调整数据的范围以便于显示
title('载体图像');%设置标题
Lena = imread('Lena.tiff');%读取秘密图像
subplot(232);
imshow(Lena);
title('待截取图像');
face = Lena(1:180,1:180);%截取待嵌入数据
subplot(233);
imshow(face);
title('秘密数据');

[Stead_r,bitsnum] = RandomLSB(cover);%随机土1的方式隐写数据流
subplot(234);
imshow(Stead_r);
title('载密图像');

[Output] = LSB_read(Stead_r);%数据提取及图像恢复函数
subplot(235);
imshow(Output);
title('提取数据');

if isequal(face,Output)%比较嵌入数据与提取数据是否一致
    disp("秘密数据与提取数据一致");
else
    disp("秘密数据与提取数据不一致");
end