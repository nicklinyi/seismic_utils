function [  ] = boxPlot( xmin,xmax,ymin,ymax,color,lineWidth )
%BOXPLOT plot a box in an image
% IN:
%   xmin: min x location of the box
%   xmax: max x location of the box
%   ymin: min y location of the box
%   ymax: max y location of the box

% Copyright (C) IGGCAS
% Author: Yi Lin
% Date: May 19, 2018
% E-mail: linyihanchuan@gmail.com


% draw the bottom line
line([xmin xmax],[ymax ymax],'Color',color,'LineWidth',lineWidth);
% draw the top line
line([xmin xmax],[ymin ymin],'Color',color,'LineWidth',lineWidth);
% draw the left side
line([xmin xmin],[ymin ymax],'Color',color,'LineWidth',lineWidth);
% draw the right side
line([xmax xmax],[ymin ymax],'Color',color,'LineWidth',lineWidth);

end

