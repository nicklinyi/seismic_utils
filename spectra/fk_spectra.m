function [S,k,f] = fk_spectra(d,dt,dx,L,normflag)
%FK_SPECTRA: FK spectrum of a seismic gather.
%
%  [S,k,f] = fk_spectra(d,dt,dx,L);
%
%  IN   d:      data (traces in columns) 
%       dt:     time interval
%       dx:     spatial increment between traces 
%       L:      apply spectral smoothing using a separable
%               2D Hamming window of LxL samples
%       normflag: 
%                =1: output normarlized frequency and normarlized wavenumber
%                =0(default): output regular frequency and wavebumber
%       
%
%  OUT  S:      FK spectrum
%       f:      freq axis in Hz
%       k:      wave-number spectrum in cylces/m (if dx is in meters)
%
%  Note: when plotting spectra (S)  use log(S) or S.^alpha (alpha=0.1-0.3) to
%        increase the visibility of small events 
%
%  Example: 
%
%    [d,h,t] = linear_events; dt = t(2)-t(1); dx = h(2)-h(1); 
%    [S,k,f] = fk_spectra(d,dt,dx,6); imagesc(k,f,S);
%
%  Copyright (C) 2018, IGGCAS
%  Author: Yi Lin
%  E-mail: linyihanchuan@gmail.com
%
%  Copyright (C) 2008, Signal Analysis and Imaging Group
%  For more information: http://www-geo.phys.ualberta.ca/saig/SeismicLab
%  Author: M.D.Sacchi
%
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published
%  by the Free Software Foundation, either version 3 of the License, or
%  any later version.
%
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details: http://www.gnu.org/licenses/
%
%     
if nargin < 5
    normflag = 0;
end

[nt,nx]=size(d);

 nk = 4*(2^nextpow2(nx));
 nf = 4*(2^nextpow2(nt));

 S = fftshift( abs(fft2(d,nf,nk)) );
 H = hamming(L)*hamming(L)';
 S = conv2(S,H,'same');
 S = S(nf/2:nf,:);
 
 if normflag   
     f = linspace(0,0.5,nf/2+1);
     k = linspace(-0.5,0.5,nk);
 else
     f = (0:1:nf/2)/nf/dt;
     k = (-nk/2+1:1:nk/2)/nk/dx;
 end

 return;
