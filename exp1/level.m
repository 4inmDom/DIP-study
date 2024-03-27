function [output] = level(i, bits)
    % 将图像i的灰度级转为bits，可以使用标准库函数imadjust()
    % 输入参数：
    %   i: 输入的灰度图像
    %   bits: 需要的位数
    % 输出参数：
    %   output: 转换后的图像
    
    % 灰度级范围(梯度)
    grad = 2^(8-bits);
    output = round(i/grad)*grad;
     
end