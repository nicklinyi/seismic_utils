function [ out,indx ] = jittered_sampling( M, gamma, xi )
% 1D JITTERED_SAMPLING
% INPUT:
%     M: data in 2 dimensions, 1st is time axis, 2nd is spatial axis
%    gamma: the maximum number of consecutive missing column
%    xi: xi controls the biggest gap in the sampling

% OUTPUT:
%    out: output data;
%    indx: optional, to show the sampling pattern

% y(i) = f_o[j]  i=1,...,n where n = N/gamma
% N is the total number of a vector, gamma is the length of the sub-vector
% j = (1-gamma)/2.0 + gamma * i + epislon_i
% epislon_i = [-[(xi-1)/2.0], [(xi-1)/2.0]]
% when xi = gamma, it gives the best jittered sampling.

% Reference:
%      Hennenfent G, Herrmann F J. Simply denoise: Wavefield reconstruction via jittered undersampling[J]. Geophysics, 2008, 73(3): V19-V28.
% Author: Yi Lin
% Email: linyihanchuan [at] gmail.com
% date: 31 Mar, 2018 20:08:00


[~,N] = size(M); % assume 1st is time axis


n = N/gamma;

epislon = randi([floor(-(xi-1)/2), floor((xi-1)/2)],n,1);

for i=1:n
  indx(i) = floor( (1-gamma)/2 + gamma * i + epislon(i) );
  if indx(i) == 0
      indx(i) = 1;
  end
  if indx(i) == N+1
        indx(i) = N;
  end
end
out = zeros(size(M));
out(:,indx) = M(:,indx);

end
