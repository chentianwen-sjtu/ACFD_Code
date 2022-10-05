function [ u,v,p ] = M_Possion(L,u,v,p,imax,imin,jmax,jmin,mu,rho,dxi,dyi,dt)
%投影法求解压力泊松方程
u_star=zeros(imax+1,jmax+1);
v_star=zeros(imax+1,jmax+1);
for j=jmin:jmax
    for i=imin+1:imax
        v_here =0.25*(v(i-1,j)+v(i-1,j+1)+v(i,j)+v(i,j +1));
        u_star(i,j)=u(i,j)+dt*...
            (mu*(u(i-1,j)-2*u(i,j)+u(i+1,j))*dxi^2 ...
            +mu*(u(i,j-1)-2*u(i,j)+u(i,j+1))*dyi^2 ...
            -u(i,j)*(u(i+1,j)-u(i-1,j))*0.5*dxi ...
            -v_here*(u(i,j+1)-u(i,j-1))*0.5*dyi);
    end
end
for j=jmin+1:jmax
    for i=imin : imax
        u_here =0.25*(u(i,j-1)+u(i,j)+u(i+1,j-1)+u(i+1,j));
        v_star(i,j)=v(i,j)+dt* ...
            (mu*(v(i-1,j)-2*v(i,j)+v(i+1,j))*dxi^2 ...
            +mu*(v(i,j-1)-2*v(i,j)+v(i,j+1))*dyi^2 ...
            -u_here*(v(i+1,j)-v(i-1,j))*0.5*dxi ...
            -v(i,j)*(v(i,j+1)-v(i,j-1))*0.5*dyi);
    end
end
n=0;
R=zeros(imax-imin+1,1);
for j=jmin : jmax
    for i=imin : imax
        n=n+1;
        R(n)=-rho/dt*((u_star(i+1,j)-u_star(i,j))*dxi ...
            +(v_star(i,j+1)-v_star(i,j))*dyi);
    end
end
pv=L\R;
n=0;
%p=zeros(imax,jmax);
for j=jmin : jmax
    for i=imin : imax
        n=n+1;
        p(i,j)=pv(n);
    end
end

for j=jmin : jmax
    for i=imin+1:imax
        u(i,j)=u_star(i,j)-dt/rho*(p(i,j)-p(i-1,j))*dxi;
    end
end
for j=jmin+1:jmax
    for i=imin : imax
        v(i,j)=v_star(i,j)-dt/rho*(p(i,j)-p(i,j-1))*dyi;
    end
end
end

