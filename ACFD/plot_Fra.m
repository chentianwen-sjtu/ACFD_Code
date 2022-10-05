function [] = plot_Fra( F,istep,xm,ym,imin,imax,jmin,jmax,dt )
%储存图片
%F
fig = figure('Visible','off'); % 新建一个figure，并将图像句柄保存到fig
pcolor(xm(imin:imax),ym(jmin:jmax),F(imin:imax,jmin:jmax)') %等高线图
%contourf(xm(imin:imax),ym(jmin:jmax),F(imin:imax,jmin:jmax)',1);
set(gcf,'position',[200,50,600,650]);
c = colorbar('southoutside','Ticks',[0 0.2 0.4 0.6 0.8 1]);
colormap('jet')
c.Label.String = 'Fraction of water';
xlabel('X','fontsize',10);
ylabel('Y','fontsize',10);
legd=['Time = ',num2str(istep*dt,'%02.1f\n')];
legend(legd);
frame = getframe(fig); % 获取frame
img = frame2im(frame); % 将frame变换成imwrite函数可以识别的格式
imwrite(img,['C:\\Users\\dell\\Documents\\MATLAB\\ACFD\\pic_fra\\','时间步数：',num2str(istep,'%06d\n'),'.png']); % 保存到指定目录下，名字为"*.png"

fig2 = figure('Visible','off'); % 新建一个figure，并将图像句柄保存到fig
contourf(xm(imin:imax),ym(jmin:jmax),F(imin:imax,jmin:jmax)',1);
set(gcf,'position',[200,50,600,650]);
c = colorbar('southoutside','Ticks',[0 0.2 0.4 0.6 0.8 1]);
colormap('jet')
c.Label.String = 'Fraction of water';
xlabel('X','fontsize',10);
ylabel('Y','fontsize',10);
legd=['Time = ',num2str(istep*dt,'%02.1f\n')];
legend(legd);
frame2 = getframe(fig2); % 获取frame
img = frame2im(frame2); % 将frame变换成imwrite函数可以识别的格式
imwrite(img,['C:\\Users\\dell\\Documents\\MATLAB\\ACFD\\pic_fra1\\','时间步数：',num2str(istep,'%06d\n'),'.png']); % 保存到指定目录下，名字为"*.png"



fprintf('储存图片:%s\n \n',num2str(istep));


end

