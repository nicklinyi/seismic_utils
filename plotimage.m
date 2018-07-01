function plotimage( data, pars )
% PLOTIMAGE plot seismic image 
% Copyright (C) 2018, Yi Lin.
% Email: linyihanchuan@gmail.com
% Example:
%   pars.height = 8.46;
%   pars.width = 8.46;
%   pars.caxis = [-0.5 0.5];
%   pars.x = x;
%   pars.y = t;
%   pars.xlabel = 'Offset (m)';
%   pars.ylabel = 'Time (s)';
%   plotimage( data, pars );
fig = figure(100);
fig.Units = 'centimeters';
fig.Position=[4*2.54 4*2.54 pars.width pars.height];
if ~isfield(pars,'caxis')
    imagesc(pars.x,pars.y,data), axis ij
else
    imagesc(pars.x,pars.y,data,pars.caxis), axis ij
end

if ~isfield(pars,'filename')
    pars.filename = sprintf('%s', inputname(1));  
end
set(gca,'TickDir','out')
set(gca,'FontSize',8);
ax = gca;
ax.XAxisLocation = 'top';
xlabel(pars.xlabel,'FontSize',8);
ylabel(pars.ylabel,'FontSize',8);
if pars.color == false
    colormap(gray);
else
    colormap(jet);
end

% print(pars.filename,'-dpdf','-r600','-cmyk');
print(pars.filename,'-dtiff','-r600','-cmyk');

end



