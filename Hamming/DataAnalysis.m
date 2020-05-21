%%Start
clear
clc%清除全部
cover = imread('Lena.tiff');
%subplot(131);
%imshow(cover);
%title("载密图像");
[height,weight] = size(cover);
H = zeros(1,11);%制造一个空数组来存储海明隐写PSNR的值
C = zeros(1,11);%制造一个空数组来存储普通隐写PSNR的值


InlayNums = 3333;
for n = 1:11

[SecretData] = SecretProducer(InlayNums);%产生随机数据
[Output_H] = HMStego(cover,SecretData,InlayNums);
[Output_C] = CommonLSB(cover,SecretData,InlayNums);

[PS_H] = PSNR(Output_H,cover);%海明隐写PSNR分析
H(n) = PS_H;
[PS_C] = PSNR(Output_C,cover);%普通隐写PSNR分析
C(n) = PS_C;


y= 1;
InlayNums=InlayNums+3333;
end

x=1:1:11;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
plot(x,H,'-*b',x,C,'-or'); %线性，颜色，标记
axis([0,12,50,75])  %确定x轴与y轴框图大小
set(gca,'XTick',[0:1:12]) %x轴范围0-12，间隔1
set(gca,'YTick',[50:5:75]) %y轴范围80-100，间隔5
legend('HMStego','ComonLSB');   %右上角标注
xlabel('嵌入数据量(*10000)')  %x轴坐标描述
ylabel('PSNR值') %y轴坐标描述
