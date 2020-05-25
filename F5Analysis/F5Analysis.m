%%Start
clear
clc%清除全部

Toolboxway = uigetdir('Choose your ToolBox directory.');%获取读取工具箱路径
addpath(Toolboxway);
%% 原始图像
img_name = 'Boat.jpg';
Origin = jpeg_read(img_name);%读取Boat.jpg文件
OriginDct = Origin.coef_arrays{1,1};%获取jpeg的dct值
Dcttime0 = tabulate(OriginDct(:));%tabulate统计dct系数中每个值出现的次数
%% 经过F5隐写后的图像
img_name = 'Stego-Boat.jpg';
Exam = jpeg_read(img_name);%读取Stego-Boat.jpg文件
ExamDct = Exam.coef_arrays{1,1};%获取jpeg的dct值
Dcttime1 = tabulate(ExamDct(:));
%% 参考图像
stego = imread('Stego-Boat.jpg');
Guess = imcrop(stego,[1,5,512,508]);%去除隐写图片上面四行数据并按照相同的量化表生成新的图片
imwrite(Guess,'Guess-Boat.jpg');

img_name = 'Guess-Boat.jpg';
GuessCover = jpeg_read(img_name);%读取Guess-Boat.jpg即猜想的原图文件

GuessDct = GuessCover.coef_arrays{1,1};%获取jpeg的dct值
Dcttime2 = tabulate(GuessDct(:));

ODct = zeros(1,301);%创造空数组用来存放规整化的值
EDct = zeros(1,301);
GDct = zeros(1,301);

szO = length(Dcttime0);%得到DCT系数出现个数统计表的长度
szE = length(Dcttime1);
szG = length(Dcttime2);

i=1;
for n = 1:301
    if Dcttime0(i,1) < 0%把DCT中负值出现的次数按数轴顺序放在规整空数组前150位
        if Dcttime0(i,1) == -151+n%'-x'出现的次数放在'151-x'的位置
            ODct(n) = Dcttime0(i,2);
            i = i+1;
        end
    else%把DCT中正值出现的次数按数轴顺序放在规整空数组后150位
        ODct(Dcttime0(i,1)+151) = Dcttime0(i,2);
        i = i+1;
    end
    if i == szO+1
        break;%当DCT次数统计表中每个数字都进行规整后跳出循环
    end
end

i=1;
for n = 1:301
    if Dcttime1(i,1) < 0
        if Dcttime1(i,1) == -151+n
            EDct(n) = Dcttime1(i,2);
            i = i+1;
        end
    else
        EDct(Dcttime1(i,1)+151) = Dcttime1(i,2);
        i = i+1;
    end
    if i == szE+1
        break;
    end
end
i=1;
for n = 1:301
    if Dcttime2(i,1) < 0
        if Dcttime2(i,1) == -151+n
            GDct(n) = Dcttime2(i,2);
            i = i+1;
        end
    else
        GDct(Dcttime2(i,1)+151) = Dcttime2(i,2);
        i = i+1;
    end
     if i == szG+1
        break;
     end
end


       
    
x=-150:1:150;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
plot(x,ODct','-xb',x,EDct,'-xr',x,GDct,'-xg'); %线性，颜色，标记
axis([-150,150,0,250000])  %确定x轴与y轴框图大小
set(gca,'XTick',[-150:10:150]) %x轴范围150-150，间隔1
set(gca,'YTick',[0:100000:250000]) %y轴范围0-2500000，间隔100000
legend('Origin','Exam','Guess');   %右上角标注
xlabel('Dct')  %x轴坐标描述
ylabel('times') %y轴坐标描述