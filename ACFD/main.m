clear all
close all
%mesh=========================================================================
global nx ny Lx Ly
nx=32;
ny=32;
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
%参数设置
global  dt
dt=0.001;
%初始条件
u=zeros(imax+1,jmax+1);
v=zeros(imax+1,jmax+1);
p=zeros(imax,jmax);
F=zeros(imax+1,jmax+1);

for j=1:1:jmax
    for i=1:1:imax
        if(xm(i)>=0)&&(xm(i)<=0.3)&&(ym(j)>=0)&&(ym(j)<0.8)
            F(i,j)=1;
        end
    end
end
rho=zeros(imax+1,jmax+1);
mu=zeros(imax+1,jmax+1);
%=================================================
% 创建Laplace算子
L=Laplace_operator(nx,ny,dxi,dyi);
%=====================================================

istep=0;
istep_max=15000;
Residual=zeros(istep_max/100,3);
check_mass=zeros(istep_max/100,1);%检查质量
R_limit=15;
count=0;
while (istep<istep_max)
    %设置边界条件
    [u,v,F]=set_BC(u,v,F,imax,imin,jmax,jmin);
    
    %由F更新rho，mu
    [rho,mu] = cal_mu_rho( F,rho,mu,imin,imax,jmin,jmax);
    %投影法求解压力possion方程
    [un,vn,pn] = M_Possion(L,u,v,p,imax,imin,jmax,jmin,mu,rho,dxi,dyi,dt);
    %显示，差分法求解F
    [Fn] = solve_F( un,vn,F,imax,imin,jmax,jmin,dt,dxi,dyi);
    
    for j=1:1:jmax
        for i=1:1:imax
            Fn(i,j)=var(0,1,Fn(i,j));
        end
    end
    istep=istep+1;
    
    u_R=norm(un-u)/(nx*ny);
    v_R=norm(vn-v)/(nx*ny);
    p_R=norm(pn-p)/(nx*ny);
    u=un;
    v=vn;
    p=pn;
    F=Fn;
    [u,v,Fn]=set_BC(u,v,Fn,imax,imin,jmax,jmin);
    %     if (u_R>R_limit)||(v_R>R_limit)
    %         fprintf('残差过大不收敛');
    %          break;
    %      end
    if mod(istep,100)==0
        count=count+1;
        Residual(count,1)=u_R;
        Residual(count,2)=v_R;
        Residual(count,3)=p_R;
        check_mass(count)=sum(sum(abs(Fn(imin:imax,jmin:jmax))));
        fprintf('迭代次数%s\n u_R=%s\n v_R=%s\n check mass：%s\n',num2str(istep), ...
        num2str(u_R),num2str(v_R),num2str(check_mass(count)));
        plot_Fra( Fn,istep,xm,ym,imin,imax,jmin,jmax,dt );
    end
end
