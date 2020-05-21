function [Output_C] = CommonLSB(cover,SecretData,InlayNums)
Output_C = cover;

    for j=1:InlayNums*3
    Output_C(j) = bitset(cover(j),1,SecretData(j));
    %将cover(j)的倒数第1个数用data(j)代替。
    end
end