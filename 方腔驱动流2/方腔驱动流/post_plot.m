%速度x等高线图
figure(1);
contourf(x(imin:imax),y(jmin:jmax),u(imin:imax,jmin:jmax)',15) %等高线图
xlabel('X','fontsize',10);
ylabel('Y','fontsize',10);
axis equal
c = colorbar('westoutside');
c.Label.String = 'Vel of u';
title('Vel of u');
grid on
%压力图
figure(2);
contourf(xm(2:1+nx),ym(2:1+ny),p(2:1+nx,2:1+ny)',5) %等高线图
colorbar
title('Pressure');
grid on
%残差图
figure(3)
plot(1:1:istep,Residual(:,1),'r-','LineWidth',2);
hold on
plot(1:1:istep,Residual(:,2),'g-','LineWidth',2);
plot(1:1:istep,Residual(:,3),'b-','LineWidth',2);
set(gca,'yscale','log');
xlabel('istep','fontsize',10);
ylabel('Residual','fontsize',10);
grid on
legend('u_R','v_R','p_R');
title('Residual-istep');
%F
figure(4)

fig = figure('Visible','on'); % 新建一个figure，并将图像句柄保存到fig
pcolor(xm(imin:imax),ym(jmin:jmax),u(imin:imax,jmin:jmax)') %等高线图
%contourf(xm(imin:imax),ym(jmin:jmax),F(imin:imax,jmin:jmax)',1);
set(gcf,'position',[200,50,600,650]);
c = colorbar('southoutside','Ticks',[0 0.2 0.4 0.6 0.8 1]);
colormap('jet')
c.Label.String = 'vel of u';
xlabel('X','fontsize',10);
ylabel('Y','fontsize',10);

%legd=['Time = ',num2str(istep*dt,'%02.1f\n')];
%legend(legd);
figure(5)
x=xm;
y=ym;
uu=u(2:imax+1,2:imax+1)';
vv=v(2:imax+1,2:imax+1)';
quiver(x,y,uu,vv)
startx = linspace(0,1,33);
starty = ones(size(startx));
% streamline(x,y,uu,vv,startx,starty);
streamslice(x,y,uu,vv)
