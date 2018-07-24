function [dout] = tr_eq(d);
% tr_eq  apply trace equalisation to a seismic data
% IN:
%    d: input data, [nt,nx]
% OUT:
%    dout: output trace-equlised data
% Reference:
%  1. https://wiki.seg.org/wiki/Relative_trace_balancing
%  2. A. Frank Linville and Robert A. Meek (1995). ”A procedure for optimally 
%     removing localized coherent noise.” GEOPHYSICS, 60(1), 191-203. Eq (4)-(5)
% Example:
%   dout = tr_eq(d);
%
% Copyright (C) 2018, Yi Lin
% Date: Jul 3, 2018
% Email: linyihanchuan@gmail.com

[nt,~] = size(d);

tmp = rms(d); % eq. (4)
tmp1 = repmat(tmp,nt,1);
dout = d./tmp1; % eq. (5)

end


