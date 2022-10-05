function [u,v,F] = set_BC(u,v,F,imax,imin,jmax,jmin)
%���ñ߽�����
%
%�߽�����
% u_bottom=0;
% v_bottom=0;
% u_top=0;
% v_top=0;
% u_left=0;
% v_left=0;
% u_right=0;
% v_right=0;
% 
% u(:,jmin-1)=-u(:,jmin)+2*u_bottom;
% v(:,jmin-1)=-v(:,jmin)+2*v_bottom;
% 
% u(:,jmax+1)=-u(:,jmax)+2*u_top;
% v(:,jmax+1)=-v(:,jmax)+2*v_top;
% 
% u(imin-1,:)=-u(imin,:)+2*u_left;
% v(imin-1,:)=-v(imin,:)+2*v_left;
% 
% u(imax+1,:)=-u(imax,:)+2*u_right;
% v(imax+1,:)=-v(imax,:)+2*v_right;

%���ñ���Ϊ���ɴ�͸����������
%bottom
%u(:,jmin-1)=-u(:,jmin)+2*u_bottom;
v(:,jmin-1)=v(:,jmin);
%top
%u(:,jmax+1)=-u(:,jmax)+2*u_top;
v(:,jmax+1)=v(:,jmax);
%left
u(imin-1,:)=u(imin,:);
%v(imin-1,:)=-v(imin,:)+2*v_left;
%right
u(imax+1,:)=u(imax,:);
%v(imax+1,:)=-v(imax,:)+2*v_right;
% fprintf('���ñ߽��������\n');
%ΪF���ò��ɴ�͸����
F(imin-1,:)=F(imin,:);%left
F(imax+1,:)=F(imax,:);%right
F(:,jmin-1)=F(:,jmin);%bottom;
F(:,jmax+1)=F(:,jmax);%top

end

