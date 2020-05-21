% QUANTIZE  Dequantize BDCT coefficients, using center bin estimates
%
%    ECOEF = DEQUANTIZE(QCOEF,QTABLE) computes a center bin estimate of the
%    coefficients given the quantizer indices (quantized coefficients) and a
%    quantization table QTABLE.
%
%    QTABLE is applied to each coefficient block in QCOEF (shaped as an image)
%    as follows: new value = old value * table value

%QUANTIZE使用中心bin估计对BDCT系数进行均衡

%ECOEF = DEQUANTIZE（QCOEF，QTABLE）计算给定量化指标（量化系数）和量化表QTABLE。

%QTABLE被应用于QCOEF中的每个系数块（形状为图像）
%如下：新值=旧值*表值

function coef = dequantize(qcoef,qtable)

blksz = size(qtable);
[v,r,c] = im2vec(qcoef,blksz);

coef = vec2im(v.*repmat(qtable(:),1,size(v,2)),0,blksz,r,c);
