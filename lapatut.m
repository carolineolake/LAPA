clear all
%Caroline Deluce
%101041614
%LAPA
%Matlab R2020b

%tiledlayout(4,4)

nx = 20; %This is L
ny = 20; %This is W

Vo = 1;

G = sparse(nx*ny);
F = zeros(nx*ny, 1);

for i = 1:nx
    for j = 1:ny 
        
        n = j + (i - 1) * ny; 
        
        if (i == 1)%indexes from 1 instead of 0, x boundary
            
             G(n,n) = 1;
             F(n) = 1; 
             
        elseif (i == nx)
            
            G(n,n) = 1;
            F(n) = 1;
             
        elseif (j == 1) %j can't go anymore left, so no nym
            
            G(n,n) = 1;
            F(n) = 0;
            
            
            
           
         elseif (j == ny) %j can't go anymore left, so no nyp
            
            G(n,n) = 1;
            F(n) = 0;
            
            
            
        else 
        
            nxm =  j + (i - 2) * ny; % i = (i - 1)
            nxp = j + (i) * ny; % i = (i+1)
            nym = (j - 1) + (i - 1) * ny; % j = (j-1)
            nyp = (j + 1) + (i - 1) * ny; % j = (j+1)
            
            G(n,n) = -4;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
            
       
            
        end % if statement
          
    end %j loop

end % i loop

V=G\F;  

A = zeros(nx,ny);



for i = 1:nx
    for j = 1:ny 
        
        n = j + (i - 1) * ny;
       A(i,j) = V(n); 
            

    end
end

nexttile
surf(A);
xlabel('x');
ylabel('y');
zlabel('V(x,y)');
title('Potential Difference');


[Ex, Ey] = gradient(A);

nexttile
surf(Ex);
xlabel('Width (y)');
ylabel('Length (x)');
zlabel('V(x,y)');
title('X-Direction Electric Field');

nexttile
surf(Ey);
xlabel('Width (y)');
ylabel('Length (x)');
zlabel('V(x,y)');
title('Y-Direction Electric Field');

nexttile
quiver(Ex, Ey);
title('Vector Field');
xlabel('Width (y)');
ylabel('Length (x)');

%mboxfilt(V,3);
