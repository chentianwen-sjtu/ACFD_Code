%�ٶ�x�ȸ���ͼ
figure(1);
contourf(x(imin:imax),y(jmin:jmax),u(imin:imax,jmin:jmax)',15) %�ȸ���ͼ
xlabel('X','fontsize',10);
ylabel('Y','fontsize',10);
axis equal
c = colorbar('westoutside');
c.Label.String = 'Vel of u';
title('Vel of u');
grid on
%ѹ��ͼ
figure(2);
contourf(xm(2:1+nx),ym(2:1+ny),p(2:1+nx,2:1+ny)',5) %�ȸ���ͼ
colorbar
title('Pressure');
grid on
%�в�ͼ
figure(3)
plot(100:100:istep,Residual(:,1),'r-','LineWidth',2);
hold on
plot(100:100:istep,Residual(:,2),'g-','LineWidth',2);
plot(100:100:istep,Residual(:,3),'b-','LineWidth',2);
set(gca,'yscale','log');
xlabel('istep','fontsize',10);
ylabel('Residual','fontsize',10);
grid on
legend('u_R','v_R','p_R');
title('Residual-istep');
%F
figure(4)
contourf(x(imin:imax),y(jmin:jmax),Fn(imin:imax,jmin:jmax)',1) %�ȸ���ͼ