function [exD,Output]=LSB_de(Stead,length)

exD = bitget(Stead,1);
%将数据转换为二进制数，并提取最低位嵌入数据
k=0;
exD=exD(1:length);
k = 0;
n=length/7;
for i = 1:n
        %bin2dec：将一个字符串表示的二进制数转换成一个十进制数
        %num2str：将数组exD中的数转换成字符串表示形式
        %按ascii码输出其中表达的信息
        Output(i) = char(bin2dec(num2str(exD(k+1:k+7))));
        k = 7+k;
end

end