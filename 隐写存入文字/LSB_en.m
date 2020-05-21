function [Stead,emD,bitsnum] = LSB_en(cover,word)
Stead = cover;
num = numel(cover);%统计像素个数
data = dec2bin(word);%转二进制
data = strcat(char(data)','');% 转成字符数组
data = str2num(data(:));%字符数组转化整数数组

bitsnum =numel(data);

i=bitsnum;
for j=1:i
    Stead(j) = bitset(cover(j),1,data(j));
    %将cover(j)的倒数第1个数用data(j)代替。
end
emD=data(1:bitsnum);
end