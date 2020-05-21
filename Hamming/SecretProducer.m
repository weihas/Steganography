function [SecretData] = SecretProducer(InlayNums)
%SCREATPRODUCER 随机生成嵌入数据的生成器
SecretData = randi([0 1],1,3*InlayNums);
%随机生成3*组数的秘密数据
end
