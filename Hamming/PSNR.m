function [PSNR] = PSNR(Output,cover)
[height,weight] = size(cover);%获取cover的大小
M = 0;
Stead = cover;

Stead = double(Stead);%unit8转化为十进制
Output = double(Output);

MAXI = 255;
for i=1:height*weight
    M = M+power((Stead(i)-Output(i)),2);
    i= 0;
end
j = 0;
PSNR = 10*log10((MAXI*MAXI*height*weight/M));

end

