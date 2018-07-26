function d = fkfilter( d,va,vb,vc,vd,pass )
% FKFILTER F-K domain filtering
% IN:
%    d: input data, [nt,nx]
%    va,vb,vc,vd: va < vb < vc < vd, velocities to control filtering area
%    pass: 1 ->  [vb,vc] 
%          0 ->  (-inf,va) && (vd,+inf)
% OUT:
%    d: output data, [nt,nx]
% Reference:
%    Mdipfilter.c in Madagascar
%
% Example:
%    dout = fkfilter(d,0,0.5,1,1.5,1);

% Copyright (C) 2018, Yi Lin
% Date: July 26, 2018
% Email: linyihanchuan@gmail.com

    [nt, nx] = size(d);
    nk = 2*2^nextpow2(nx);
    nf = 2^nextpow2(nt);
    m = fftshift(fft2(d,nf,nk));     
    dw = 1/nf;  % Normalized
    dk = 1/nk;  % Normalized
    
    mink = sqrt(2) * dk * 1.19209290e-07;
    
    nw = nf/2 + 1;
    
    mmd = zeros(nw,nk);
    
    for iw=1:nw
        w = dw*(iw-1);
        for ik=1:nk
            k = -0.5 + (ik - 1) * dk;
            k = abs(k) + mink;
            vel = w / k;
            
            if vel >= va && vel <= vb
                fac = 1.0 - sin(0.5*pi*(vel-va)/(vb-va));
            elseif vel >= vb && vel <= vc
                fac = 0.0;
            elseif vel >= vc && vel <= vd
                fac = sin(0.5*pi*(vel-vc)/(vd-vc));
            else
                fac = 1.0;
            end
            
            if pass
                fac = 1.0 - fac;
            end
            
            mmd(iw,ik) = m(iw+nw-2,ik) * fac;

        end
    end
    
    mmp = flip(flip(mmd),2);
    
    m = cat(1,mmp(1:nw-2,:),mmd(1:nw,:));
    
    m = ifftshift(m);
 
    d = real(ifft2(m));
    d = d(1:nt,1:nx);
    
end



