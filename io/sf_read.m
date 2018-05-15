function [ out ] = sf_read( str, sz , precision)
%SF_READ read data generated by madagascar
%
% IN:
%    str: name of input data 
%    sz:  size of the input data
%    precision: precision of the input data
%
% OUT:
%    out: output
%
% Example:
%  cmp = sf_read('cmp.rsf@',[n1,n2],'float');
%  imagesc(cmp);
%
% Copyright (C) 2018, IGGCAS
% Author: linyihanchuan@gmail.com
%

fp = fopen(str,'rb');
out = fread(fp,precision);
out = reshape(out,sz);
fclose(fp);

end
