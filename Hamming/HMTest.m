%%Start
clear
clc%清除全部
cover = imread('Lena.tiff');
%subplot(131);
%imshow(cover);
%title("载密图像");
[height,weight] = size(cover);

%从键盘获取嵌入数据的组的数目
InlayNums = input('Please input RandomDatas group number:');

[SecretData] = SecretProducer(InlayNums);%产生随机数据

[Output] = HMStego(cover,SecretData,InlayNums);%海明隐写

[UnlockData] = HMUnlock(Output,InlayNums);%海明提取

if isequal(SecretData,UnlockData)%比较嵌入数据与提取数据是否一致
    disp("秘密数据与提取数据一致");
else
    disp("秘密数据与提取数据不一致");
end