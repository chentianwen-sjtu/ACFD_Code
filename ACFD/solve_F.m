function [Fn] = solve_F( u,v,F,imax,imin,jmax,jmin,dt,dxi,dyi)
%差分法求解体积分数F
Fn=zeros(imax+1,jmax+1);
for j=jmin:1:jmax
    for i=imin:1:imax
        u_loc=3/8*(u(i,j)+u(i+1,j))+1/16* ...
            (u(i,j+1)+u(i+1,j+1)+u(i,j-1)+u(i+1,j-1));
        v_loc=3/8*(v(i,j)+v(i,j+1))+1/16* ...
            (v(i-1,j)+v(i-1,j+1)+v(i+1,j)+v(i+1,j+1));
        Fn(i,j)=F(i,j)-dt* ...
            (u_loc*(F(i+1,j)-F(i-1,j))*dxi/2+ ...
            v_loc*(F(i,j+1)-F(i,j-1))*dyi/2);
    end
end
end

