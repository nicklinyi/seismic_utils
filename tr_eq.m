function [dout] = tr_eq(d);
% tr_eq  apply trace equalisation to a seismic data
% IN:
%    d: input data, [nt,nx]
% OUT:
%    dout: output trace-equlised data
% Reference:
% https://wiki.seg.org/wiki/Relative_trace_balancing
% Example:
%   dout = tr_eq(d);
%
% Copyright (C) 2018, Yi Lin
% Date: Jul 3, 2018
% Email: linyihanchuan@gmail.com

[nt,~] = size(d);

tmp = rms(d);
tmp1 = repmat(tmp,nt,1);
dout = d./tmp1;

end


