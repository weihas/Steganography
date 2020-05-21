%%Start
clear
clc%清除全部
Fileway=uigetdir('Choose your source directory.');%获取读取图像库路径
cd(Fileway);%进入图像库
allphotos=struct2cell(dir('*tiff'));%只处理8位tiff文件
[k,len]=size(allphotos);%得到待处理文件个数
len=len-1;
KafangValue = zeros(len,3);%创建一个len*3的二维数组

for i=1:len%挨个读出文件
    photo = allphotos{1,i};
    cover = imread(photo);
    Sample = cover;
    [E] = KfangAnalysis(Sample);%卡方分析
    clc; %清除命令行窗口的数据

    KafangValue(i,1)=E;
    
    
    [Stead_c,~] = CommonLSB(cover);%普通隐写数据流嵌入
    Sample = Stead_c;
    [E] = KfangAnalysis(Sample);%卡方分析

    KafangValue(i,2)=E;
    
    
    [Stead_r,bitsnum] = RandomLSB(cover);%随机土1隐写数据流嵌入
    Sample = Stead_r;
    [E] = KfangAnalysis(Sample);%卡方分析

    KafangValue(i,3)=E;
    
    
end

%创建一个柱状图来展示每次卡方分析的值
b=bar(KafangValue);
grid on;
ch = get(b,'children');
legend('无隐写原图','LSB简单隐写','LSB随机土1隐写');
xlabel('隐写图片 ');
ylabel('卡方分析值');