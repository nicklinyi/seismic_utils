function cc = plotcube( data, pars )
%PLOTCUBE 此处显示有关此函数的摘要
%   此处显示详细说明
% framex, framey, framez
 [ny, nx, nz] = size(data);

datax = zeros(size(data));
datay = zeros(size(data));
dataz = zeros(size(data));

for iz = 1:nz
    dataz(:,:,iz) = data(:,:,pars.framez);
end
for iy = 1:ny
    datay(iy,:,:) = data(pars.framey,:,:);
end
for ix = 1:nx
    datax(:,ix,:) = data(:,pars.framex,:);
% datax(:,ix,:) = data(:,9,:);
end

fig = figure(100);
fig.Units = 'centimeters';
fig.Position=[4*2.54 4*2.54 pars.width pars.height];

sx = pars.ox;
sy = pars.ymax;
sz = pars.oz;

slice(pars.X,pars.Y,pars.Z,datax,sx,[],[]); hold on;
slice(pars.X,pars.Y,pars.Z,datay,[],sy,[]); hold on;
slice(pars.X,pars.Y,pars.Z,dataz,[],[],sz); hold on;

lx = pars.ox + (pars.framex-1)*pars.dx;
ly = pars.oy + (pars.framey-1)*pars.dy;
lz = pars.oz + (pars.framez-1)*pars.dz;

line([pars.xmin pars.xmin],[pars.ymin pars.ymax],[lz lz],'Color',pars.framecol);hold on;
line([pars.xmin pars.xmax],[pars.ymax pars.ymax],[lz lz],'Color',pars.framecol);hold on;
line([lx lx],[pars.ymin pars.ymax],[pars.zmin pars.zmin],'Color',pars.framecol);hold on;
line([lx lx],[pars.ymax pars.ymax],[pars.zmin pars.zmax],'Color',pars.framecol);hold on;
line([pars.xmin pars.xmax],[ly ly],[pars.zmin pars.zmin],'Color',pars.framecol);hold on;
line([pars.xmin pars.xmin],[ly ly],[pars.zmin pars.zmax],'Color',pars.framecol);hold on;

colormap(gray);
if isfield(pars,'caxis'); 
    caxis(pars.caxis); 
    cc = caxis;
else
    cc = caxis;
end

shading flat;

set(gca,'FontSize',8);
set(gca,'ZDir','reverse');  % Z轴反转，常用于地学数据
set(gca,'YDir','reverse');

xlabel(pars.xlabel,'FontSize',8,'Rotation',33);
ylabel(pars.ylabel,'FontSize',8,'Rotation',-3);
zlabel(pars.zlabel,'FontSize',8);

xlim([pars.xmin pars.xmax]);
ylim([pars.ymin pars.ymax]);
zlim([pars.zmin pars.zmax]);

view([-68 13]);
%pbaspect([ 0.5 1 1]);
print(pars.filename,'-dtiff','-r600','-cmyk');
end

