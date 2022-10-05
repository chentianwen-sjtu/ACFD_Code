function [ rho,mu ] = cal_mu_rho( F,rho,mu,imin,imax,jmin,jmax)
%计算密度和mu
rho_water=1;
rho_air=0.5;
nu_water=0.01;%运动粘性系数
nu_air=0.005;
for j=jmin-1:1:jmax+1
    for i=imin-1:1:imax+1
        rho(i,j)=rho_air*(1-var(0,1,F(i,j)))+rho_water*var(0,1,F(i,j));
        mu(i,j)=(nu_water*(1-var(0,1,F(i,j)))+nu_air*var(0,1,F(i,j)))/ rho(i,j);
    end
end
end

