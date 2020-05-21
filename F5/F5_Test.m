%%Start
clear
clc%清除全部

Toolboxway = uigetdir('Choose your source directory.');%获取读取工具箱路径
addpath(Toolboxway);

img_name = 'Lena.jpg';
jpeg_obj = jpeg_read(img_name);%读取lena.jpg文件

InlayNums = input('Please input RandomDatas group number:');

[SecretData] = SecretProducer(InlayNums);%产生随机数据

[stego_name] = F5Stego(img_name,jpeg_obj,SecretData,InlayNums);%F5嵌入

[UnlockData] = F5Unlock(stego_name,InlayNums);%F5提取

if isequal(SecretData,UnlockData)%比较嵌入数据与提取数据是否一致
    disp("秘密数据与提取数据一致");
else
    disp("秘密数据与提取数据不一致");
end