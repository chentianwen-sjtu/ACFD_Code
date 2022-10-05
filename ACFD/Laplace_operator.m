function [L] = Laplace_operator(nx,ny,dxi,dyi)
%¼ÆËãLaplaceËã×Ó¾ØÕó
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
%Set pressure in first cell (all other pressures w.r.t to this one)
L(1 ,:)=0; L(1 ,1)=1;
end

