function [Output] = LSB_read(stegoI)
% bitget:将数据转换成二进制数，并提取最低位二进制数
exD = bitget(stegoI,1);%提取加密图像最低位嵌入数据。

%重构出嵌入的Face图像
Output = uint8(zeros(180,180));
k = 0;
for i = 1:180*180
        %bin2dec：将一个字符串表示的二进制数转换成一个十进制数
        %num2str：将数组exD中的数转换成字符串表示形式
        %显示图像，用unit8(无符号8位整型)调整为图像的标准数据格式
        Output(i) = uint8(bin2dec(num2str(exD(k+1:k+8))));
        k = k + 8;
end

end