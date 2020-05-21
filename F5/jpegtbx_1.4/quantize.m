% QUANTIZE  Quantize BDCT coefficients
%
% QCOEF = QUANTIZE(COEF,QTABLE) computes the quantizer indices (quantized
% coefficients) for coefficients COEF given quantization table QTABLE.  
%
% QTABLE is applied to each coefficient block in COEF (shaped as an image)
% as follows: new value = round(old value / table value)

% Phil Sallee 9/03
%QUANTIZE量化BDCT系数
%QCOEF = QUANTIZE（COEF，QTABLE）计算量化指数（量化给定量化表QTABLE的系数COEF。
%QTABLE应用于COEF中的每个系数块（形状为图像）
%如下：新值=舍入（旧值/表值）


function qcoef = quantize(coef,qtable)

blksz = size(qtable);
[v,r,c] = im2vec(coef,blksz);

qcoef = vec2im(round(v./repmat(qtable(:),1,size(v,2))),0,blksz,r,c);
