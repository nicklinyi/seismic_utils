function [ out ] = js2d( M, p )
% js2d: full 2D jittered sampling
% Input:
%      M: input 2D data
%      p: sampling ratio, [0, 1]
% Output:
%     out: sampled data.
% Reference:
% 1. https://en.wikipedia.org/wiki/Supersampling#Jittered
% 2. Cook R L. Stochastic sampling in computer graphics[J]. ACM Transactions on Graphics (TOG), 1986, 5(1): 51-72.
% 3. Kensler A. Correlated multi-jittered sampling[J]. Mathematical Physics and applied mathematics, 1967, 7: 86-112.
% Author: Yi Lin
% Email: linyihanchuan [at] gmail.com
% Date: 31 Mar, 2018


[n1 n2] = size(M);
m = round(n1*sqrt(p));
n = round(n2*sqrt(p));
len_x = n1/m;
len_y = n2/n;
mask = zeros(n1,n2);
for i=1:m
    for j=1:n
        ii = round((i-1)*len_x + rand*len_x);
        jj = round((j-1)*len_y + rand*len_y);
        ii = max(ii,1);
        ii = min(ii,n1);
        jj = max(jj,1);
        jj = min(jj,n2);
        mask(ii,jj) = 1;
    end
end

out = mask.*M;
end
