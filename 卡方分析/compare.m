function [flag] = compare(photo,flag)

bitsnum = numel(photo);%统计像素个数

G = linspace(0,0,256)%创建一个全部为0，大小为256的数组

for j=1:bitsnum
    G(photo(j)+1) = G(photo(j)+1)+1;%统计每个像素值出现了多少次
end

subplot(1,3,3)%将figure分成1*3的部分，直方图放在第三处
bar(G,0.2);%按照直方图显示像素值出现的次数。
title('像素值的显现直方图');

E = 0;
for n = 1:128
    E = E+ power(G(2*n)-G(2*n-1),2); %统计卡方分析的值
end
if E<400000
    flag = 0;
end
end
