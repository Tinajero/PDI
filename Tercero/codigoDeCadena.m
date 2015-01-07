
% usando la umbralizacion se obtiene dos regionezs la region 1 que es el
% fondo y la 2 que es el objeto
% se tiene que encontrar sus borde ya sea con 4 conectividad o 8
% conectividad
% despues aplicar la representacion del borde con el codigo de cadena

% practica codigos de cadena 7/01/2014 hecha
ima = imread('C:\Users\Alumnos\Documents\MATLAB\PDI2\im\bola23.bmp');
imtool close all
[M,N] = size(ima);
T = 78;
Tn = 360;
g = zeros(M,N);
deltaT = 2;



while( abs(T-Tn) > deltaT )
    g1 = ima > T;
    g2 = ima <= T;
    indicesg1 = find( ima> T);
    indicesg2 = find( ima <= T);
    
    m1 = mean( ima( indicesg1 ) );
    m2 = mean( ima(indicesg2) );
    Tn = T;
    T = (m1 +m2 ) / 2;
end

%T
Ans = ima > T;
imtool(Ans,[]);
Ans2 = Ans;
Ans3 = Ans;

% haciendo 4 conectividad
for i = 1:M
    for j = 1:N
         bandera = 1;
        for x = -1:1
            for y = -1:1
               
                if i+ x < M && j + y < N && i + x > 0 && j + y > 0
                    if ( Ans(i+x,j+y) == 1 )
                        %Ans2(i,j) = 1
                        bandera = 0;
                    end 
                end 
            end
        end % for x
        
        if bandera == 1
            Ans2(i,j) = 1;
        end
    end
end
                        
imtool(Ans2,[]);     
movx = [0,1,0,-1];
movy = [-1,0,1,0];
% haciendo 8 conectividad
for i = 1:M
    for j = 1:N
         bandera = 1;
        for ind = 1:4
           
            x =  movx(ind);
            y = movy(ind);
                if i + x < M && j + y < N && i + x > 0 && j + y > 0
                    if ( Ans(i+x,j+y) == 1 )
                        %Ans2(i,j) = 1
                        bandera = 0;
                    end 
                end 
        end
        if bandera == 1
            Ans3(i,j) = 1;
        end
    end
end

imtool(Ans3,[]);

temp = Ans2;    
for i = 1:M
    for j = 1:N
        if(Ans2(i,j) == 0)
            ix = i;
            iy = j;
        end
    end
end

cadena = zeros(1000,1);
cola1 = 1;
for i = 1 : 1000
  
    for ind = 1:4
        x = ix + movx(ind);
        y = iy + movy(ind);
        if temp(x,y) == 0
            temp(ix,iy) = 1;
            ix = x;
            iy = y;
            
            cadena(cola1) = ind-1;
            cola1=cola1+1;
            break;
        end
    end
end

%imtool(temp,[]);
temp = Ans3;
movx = [0,1,1,1,0,-1,-1,-1];
movy = [-1,-1,0,1,1,1,0,-1];
cadena2 = zeros(1000,1);
cola = 1;
for i = 1 : 1000
  
    for ind = 1:8
        x = ix + movx(ind);
        y = iy + movy(ind);
        if temp(x,y) == 0
            temp(ix,iy) = 1;
            ix = x;
            iy = y;
            
            cadena2(cola) = ind-1;
            cola=cola+1;
            break;
        end
    end
end
imtool(temp,[]);

