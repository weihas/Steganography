function [Stead,bitsnum] = LSB_en(cover)
Stead = cover;

bitsnum = numel(cover);%统计像素个数

ModifyRate = input('Please input arrange number: (without%)');
%从键盘获取随机输入的嵌入率
i=bitsnum*ModifyRate/100;%i为嵌入的个数

if i>=bitsnum%如果随机嵌入率大于100%
    for j=1:bitsnum
        Stead(j) = bitset(cover(j),1,randi([0 1],1,1));
        %将cover(j)的倒数第1个数用data(j)代替。
    end
    for j=1:i-bitsnum
        Stead(j) = bitset(cover(j),2,randi([0 1],1,1));
        %将cover(j)的倒数第2个数用data(j)代替。
    end
else%随机嵌入率小于100%
    for j=1:i
    Stead(j) = bitset(cover(j),1,randi([0 1],1,1));
    %将cover(j)的倒数第1个数用data(j)代替。
    end
end


end