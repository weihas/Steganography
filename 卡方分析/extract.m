function [output,bitsnum] = extract(photo)
output = photo;
bitsnum = numel(photo);%统计像素个数

output = bitget(output,1);%将导入图片的最底层二进制数抽出

for j=1:bitsnum
    if output(j) == 1%循环，如果那个二进制是0则不改动
        for i=1:8%如果二进制代码是1，就把这个像素它改成纯白，增大对比度
        output(j) = bitset(output(j),i,1);
        i = i+1;
        %将cover(j)的倒数第1个数用data(j)代替。
        end
    end
end
output = uint8(output);%将像素最底层的值抽出的图片按unit8显示
end