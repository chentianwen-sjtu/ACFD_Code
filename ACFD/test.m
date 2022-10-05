%mesh=========================================================================
nx=3;
ny=3;
Lx=1;
Ly=1;
% Index extents
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
% figure(1);
% mesh(x,y,zeros(imax+1,imax+1));
% hold on
% plot3(x,y,zeros(imax+1,imax+1),'*')
% plot3(xm,ym,zeros(imax,imax),'o')
% axis equal

L=zeros(nx*ny,nx*ny);
for j =1:1:ny
    for i =1:1:nx
        L(i+(j-1)*nx,i+(j-1)*nx)=2*dxi^2+2*dyi^2;
        for ii=i-1:2:i+1
            if (ii>0 && ii<=nx) % Interior point
                L(i+(j-1)*nx,ii+(j-1)*nx)=-dxi^2;
            else % Neuman conditions on boundary
                L(i+(j-1)*nx,i+(j-1)*nx)= ...
                    L(i+(j-1)*nx,i+(j-1)*nx)-dxi^2;
            end
        end
        for jj=j-1:2: j+1
            if (jj>0 && jj<=ny) % Interior point
                L(i+(j-1)*nx,i+(jj-1)*nx)=-dyi^2;
            else % Neuman conditions on boundary
                L(i+(j-1)*nx,i+(j-1)*nx)= ...
                    L(i+(j-1)*nx,i+(j-1)*nx)-dyi^2;
            end
        end
    end
end
% Set pressure in f i r s t cell ( all other pressures w. r . t to this one)
L(1 ,:)=0; L(1 ,1)=1;




