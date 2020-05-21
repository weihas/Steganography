function [Stead_c,bitsnum] = CommonLSB(cover)
Stead_c = cover;


Lena = imread('Lena.tiff');

face = Lena(1:180,1:180);
bitsnum = numel(cover);%统计载体像素个数
num = numel(face);%统计载体像素个数

data = dec2bin(face);
data = strcat(char(data)','');
data = str2num(data(:));



if num>bitsnum%如果随机嵌入率大于100%
    for j=1:bitsnum
        Stead_c(j) = bitset(cover(j),1,data(j));
        %将cover(j)的倒数第1个数用data(j)代替。
    end
    for j=1:num-bitsnum
        Stead_c(j) = bitset(cover(j),2,data(bitnun+j));
        %将cover(j)的倒数第2个数用data(j)代替。
    end
else%随机嵌入率小于100%
    for j=1:num
    Stead_c(j) = bitset(cover(j),1,data(j));
    %将cover(j)的倒数第1个数用data(j)代替。
    end
end
end