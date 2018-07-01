function plotbar( barVal, col, filename,location )
%PLOTBAR plot colorbar in a single figure
% Copyright (C) Yi Lin, 2018
% Email: linyihanchuan@gmail.com
% EXAMPLE:
%   plotbar( [-1,1], gray, 'barhor' );
fig=figure(101);
fig.Units='inch';
if nargin < 4
    location = 'east';
end
if strcmpi(location,'south')
    fig.Position = [4 4  2.5 1];
    Location = 'southoutside';
else
    fig.Position = [4 4  1.0 4];
    Location = 'eastoutside';
end

axis off
colormap(col) % 色标颜色方案与前面图保持一致，很重要！！！
c = colorbar;

if strcmpi(location,'south')
    c.Position = [0.28 0.53 0.30 0.1]; % 控制色标的位置以及长宽比
else
    c.Position = [0.53 0.28 0.10 0.5]; % 控制色标的位置以及长宽比
end
caxis(barVal) % 与前面保持一致，保证色标值与前面相吻合，也和数据相吻合。
c.Location = Location;
print(filename,'-dtiff','-r600','-cmyk');

end

