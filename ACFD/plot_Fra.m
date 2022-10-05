function [] = plot_Fra( F,istep,xm,ym,imin,imax,jmin,jmax,dt )
%����ͼƬ
%F
fig = figure('Visible','off'); % �½�һ��figure������ͼ�������浽fig
pcolor(xm(imin:imax),ym(jmin:jmax),F(imin:imax,jmin:jmax)') %�ȸ���ͼ
%contourf(xm(imin:imax),ym(jmin:jmax),F(imin:imax,jmin:jmax)',1);
set(gcf,'position',[200,50,600,650]);
c = colorbar('southoutside','Ticks',[0 0.2 0.4 0.6 0.8 1]);
colormap('jet')
c.Label.String = 'Fraction of water';
xlabel('X','fontsize',10);
ylabel('Y','fontsize',10);
legd=['Time = ',num2str(istep*dt,'%02.1f\n')];
legend(legd);
frame = getframe(fig); % ��ȡframe
img = frame2im(frame); % ��frame�任��imwrite��������ʶ��ĸ�ʽ
imwrite(img,['C:\\Users\\dell\\Documents\\MATLAB\\ACFD\\pic_fra\\','ʱ�䲽����',num2str(istep,'%06d\n'),'.png']); % ���浽ָ��Ŀ¼�£�����Ϊ"*.png"

fig2 = figure('Visible','off'); % �½�һ��figure������ͼ�������浽fig
contourf(xm(imin:imax),ym(jmin:jmax),F(imin:imax,jmin:jmax)',1);
set(gcf,'position',[200,50,600,650]);
c = colorbar('southoutside','Ticks',[0 0.2 0.4 0.6 0.8 1]);
colormap('jet')
c.Label.String = 'Fraction of water';
xlabel('X','fontsize',10);
ylabel('Y','fontsize',10);
legd=['Time = ',num2str(istep*dt,'%02.1f\n')];
legend(legd);
frame2 = getframe(fig2); % ��ȡframe
img = frame2im(frame2); % ��frame�任��imwrite��������ʶ��ĸ�ʽ
imwrite(img,['C:\\Users\\dell\\Documents\\MATLAB\\ACFD\\pic_fra1\\','ʱ�䲽����',num2str(istep,'%06d\n'),'.png']); % ���浽ָ��Ŀ¼�£�����Ϊ"*.png"



fprintf('����ͼƬ:%s\n \n',num2str(istep));


end

