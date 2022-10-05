function [ center ] = var( a,b,c)
%返回三个数的中间值
center=a+b+c-(max([a,b,c])+min([a,b,c]));
end

