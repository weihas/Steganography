function [UnlockData] = F5Unlock(stego_name,InlayNums)
%F5UNLOCK 主体函数
jpeg_cover = jpeg_read(stego_name);%读取stego-lena.jpg文件
jpeg_dct = jpeg_cover.coef_arrays{1,1};
Stead = mod(jpeg_dct,2);%找一个Stead获取载体图像的像素值所有倒数第一个数字

UnlockData  = zeros(1,3*InlayNums);
%创建一个海明矩阵
Haming = [0,0,0,1,1,1,1;0,1,1,0,0,1,1;1,0,1,0,1,0,1];

p=0;
for n = 1:InlayNums
      B = [0,0,0];%用空的B数组来存储矩阵运算后的值
    for i = 1:3
        for j = 1:7
            %海明矩阵和原图的最底层数据矩阵乘
            B(i)=B(i)+Haming(i,j)*Stead(7*(n-1)+j);
        end
        if B(i)~=0
            B(i)= mod(B(i),2);%把矩阵相乘结果与2取余
        end
    end

    for m=1:3
        UnlockData(m+p)=B(m);%把B中的数据依次存放进UnlockData
    end
    
    p=p+3;
end


end