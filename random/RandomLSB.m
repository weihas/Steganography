function [Stead_r,bitsnum] = RandomLSB(cover)
Stead_r = cover;


Lena = imread('Lena.tiff');%读取秘密图像
face = Lena(1:180,1:180);%取1-180像素方块的图片，当然你可以改成其他的

bitsnum = numel(cover);%统计载体像素个数

data = dec2bin(face); %待嵌入数据转换为二进制
data = strcat(char(data)','');%将其转换为字符数组
data = str2num(data(:));%转化为整数数组
data=data';%data行列转置

num = numel(data);

if num>=bitsnum%如果嵌入率大于100%
    for j=1:bitsnum
        if bitget(cover(j),1) ~= data(j)
            %如果cover的第i个数的倒数第一个值与date的第i个值不等
            switch cover(j)
                case  0    %那恰好cover本身是0那就只能+1
                    Stead_r(j)=Stead_r(j)+1;
                case 255   %是255只能-1
                    Stead_r(j)=Stead_r(j)-1;
                otherwise  %否则就把载密图像的第i个值整体加一个随机的土1
                    Stead_r(j)=Stead_r(j)+randsrc(1,1,[-1,1]);
            end
            
        end
        end
    for j=1:num-bitsnum
        if bitget(cover(j),1) ~= data(j)
            switch cover(j)
                case  0   
                    Stead_r(j)=Stead_r(j)+1;
                case 255   
                    Stead_r(j)=Stead_r(j)-1;
                otherwise 
                    Stead_r(j)=Stead_r(j)+randsrc(1,1,[-1,1]);
            end
        end
    end
    
    
    
    
else%嵌入率小于100%
    for j=1:num
        if bitget(cover(j),1) ~= data(j)
            switch cover(j)
                case  0    
                    Stead_r(j)=Stead_r(j)+1;
                case 255   
                    Stead_r(j)=Stead_r(j)-1;
                otherwise  
                    Stead_r(j)=Stead_r(j)+randsrc(1,1,[-1,1]);
            end
        end
    end
end
end