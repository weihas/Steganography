function [E] = KfangAnalysis(Sample)

bitsnum = numel(Sample);%统计像素个数

G = linspace(0,0,256);%创建一个全部为0，大小为256的数组

for j=1:bitsnum
    G(Sample(j)+1) = G(Sample(j)+1)+1;%统计每个像素值出现了多少次
end

E = 0;
for n = 1:128
    E = E+ power(G(2*n)-G(2*n-1),2); %统计卡方分析的值
end

end

