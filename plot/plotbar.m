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
colormap(col) % ɫ����ɫ������ǰ��ͼ����һ�£�����Ҫ������
c = colorbar;

if strcmpi(location,'south')
    c.Position = [0.28 0.53 0.30 0.1]; % ����ɫ���λ���Լ������
else
    c.Position = [0.53 0.28 0.10 0.5]; % ����ɫ���λ���Լ������
end
caxis(barVal) % ��ǰ�汣��һ�£���֤ɫ��ֵ��ǰ�����Ǻϣ�Ҳ���������Ǻϡ�
c.Location = Location;
print(filename,'-dtiff','-r600','-cmyk');

end

