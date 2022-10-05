clear all
close all
%mesh=========================================================================
global nx ny Lx Ly
nx=64;
ny=64;
Lx=1;
Ly=1;
% Index extents
global imax imin jmax jmin dxi dyi
imin=2; imax=imin+nx-1;
jmin=2; jmax=jmin+ny-1;
% Create mesh
x(imin : imax+1)=linspace (0 ,Lx, nx+1);
y(jmin : jmax+1)=linspace (0 ,Ly, ny+1);
xm(imin : imax)=0.5*(x(imin : imax)+x(imin+1:imax+1));
ym(jmin : jmax)=0.5*(y(jmin : jmax)+y(jmin+1:jmax+1));
% Create mesh sizes
dx=x(imin+1)-x(imin );
dy=y(jmin+1)-y(jmin );
dxi=1/dx ;
dyi=1/dy ;
%��������
global  mu dt rho
mu=0.01;%����ճ��ϵ��
dt=0.005;
rho=1;
%��ʼ����
u=zeros(imax+1,jmax+1);
v=zeros(imax+1,jmax+1);
p=zeros(imax,jmax);
%=================================================
% ����Laplace����
L=Laplace_operator(nx,ny,dxi,dyi);
%=====================================================

istep=0;
istep_max=100;
Residual=zeros(istep_max,3);
R_limit=100;
while (istep<istep_max)
    %���ñ߽�����
    [u,v]=set_BC(u,v,imax,imin,jmax,jmin);
    %ͶӰ�����ѹ��possion����
    [un,vn,pn] = M_Possion(L,u,v,p,imax,imin,jmax,jmin,mu,rho,dxi,dyi,dt);
    u_R=norm(un-u)/(nx*ny);
    v_R=norm(vn-v)/(nx*ny);
    p_R=norm(pn-p)/(nx*ny);
    u=un;
    v=vn;
    p=pn;
    istep=istep+1;
    fprintf('��������%s\n u_R=%s\n v_R=%s\n',num2str(istep),num2str(u_R),num2str(v_R));
    Residual(istep,1)=u_R;
    Residual(istep,2)=v_R;
    Residual(istep,3)=p_R;
    if (u_R>R_limit)||(v_R>R_limit)
        fprintf('�в��������');
         break;
     end
end
