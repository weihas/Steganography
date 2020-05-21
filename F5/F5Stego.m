function [stego_name] = F5Stego(img_name,jpeg_obj,SecretData,InlayNums)
%F5_STEGO F5嵌入函数主体

jpeg_dct = jpeg_obj.coef_arrays{1,1};%获取jpeg的dct值
Stead = mod(jpeg_dct,2);%找一个Stead获取载体图像的像素值所有倒数第一个数字
Output = jpeg_dct;

%创建一个海明矩阵
Haming = [0,0,0,1,1,1,1;0,1,1,0,0,1,1;1,0,1,0,1,0,1];
C = zeros(1,InlayNums*3);%创建一个空的数组存取place的二进制形式
place = zeros(1,InlayNums);%用空的place数组来存储每七位数据修改的位置


p=0;
k=0;
for n = 1:InlayNums
    B = [0,0,0];%用空的B数组来存储矩阵运算后的值
    for i = 1:3
        for j = 1:7
            %海明矩阵和原图的最底层数据矩阵乘
            B(i)=B(i)+Haming(i,j)*Stead(7*(n-1)+j);
        end
        if B(i)~=0
            B(i)= mod(B(i),2);%与2取余
        end
    end
    
    for m = 1:3
        if B(m)~=SecretData(m+p)
            C(m+p)=1;%将矩阵相乘得到的结果与秘密数据取异或
        end
    end
   
    %把异或得到的数据按照二进制转化成十进制数
    place(n) = bin2dec(num2str(C(k+1:k+3)));
    
    p=p+3;
    k=k+3;
end
%bin2dec：将一个字符串表示的二进制数转换成一个十进制数

for h = 1:InlayNums
    if place(h)~=0%如果要修改数据位置的值不是0
        Output((h-1)*7+place(h)) = jpeg_dct((h-1)*7+place(h))+randsrc(1,1,[-1,1]);
    end
end

stego_name = strcat('stego-',img_name);%为文件名前增加stego-
jpeg_obj.coef_arrays{1,1} = Output;%修改jpeg文件的DCT系数
jpeg_write(jpeg_obj,stego_name);%另存为

end

