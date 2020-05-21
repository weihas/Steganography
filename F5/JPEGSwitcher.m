%%Start
clear
clc%清除全部

Fileway=uigetdir('Choose your source directory.');%获取读取图像库路径
cd(Fileway);%进入图像库
allphotos = (dir('*tiff'));%只处理8位tiff文件
len=length(allphotos);%得到待处理文件个数

%qualityrate = input('Please input RandomDatas group number:');

for i =1:len
    tiffile = fullfile(Fileway,allphotos(i).name);%获取单个tiff文件路径
    ImgData =imread(tiffile);%读取对应文件
    [path,name,ext] = fileparts(tiffile);
    filename = strcat(name,'.jpg');%获取文件名
    jpgfile = fullfile(Fileway,filename);
    for j =1:9%对应不同的质量因子生成
        qualityrate = j*10;
        ImgName = [name,'_',num2str(qualityrate),'.jpg'];%为文件名增加指质量因子参数
        imwrite(ImgData,ImgName,'JPEG','Quality',qualityrate);%另存为
    end
end
cd('..');%返回代码文件夹


