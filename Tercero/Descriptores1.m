ima = imread('C:\Users\Alumnos\Documents\MATLAB\PDI2\im\circuloDeformado.bmp');
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

Ans = ima > T;
imtool(Ans,[]);
Ans2 = Ans
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
temp = Ans2;    
for i = 1:M
    for j = 1:N
        if(Ans2(i,j) == 0)
            ix = i;
            iy = j;
        end
    end
end

cola1 = 1;
for i = 1 : 1000
    for ind = 1:4
        x = ix + movx(ind);
        y = iy + movy(ind);
        if temp(x,y) == 0
            temp(ix,iy) = 1;
            ix = x;
            iy = y;
            cola1=cola1+1;
            break;
        end
    end
end

perimetro1 = cola1


for i = M:1
    for j = N:1
        if(Ans2(i,j) == 0)
            ix = i;
            iy = j;
        end
    end
end

temp = Ans;
cola1 = 1;
for i = 1 : 1000
    for ind = 1:4
        x = ix + movx(ind);
        y = iy + movy(ind);
        if temp(x,y) == 0
            temp(ix,iy) = 1;
            ix = x;
            iy = y;
            cola1=cola1+1;
            break;
        end
    end
end

perimetro2 = cola1


colaSimul = zeros(1000,2);

tope = 2;
actx = 147 ;
acty = 100 ;

colaSimul(1,1) = actx;
colaSimla(1,2) = acty;
temp = Ans2;
cont = 0;
while tope ~= 1
    actx = colaSimul(tope-1, 1);
    acty = colaSimul(tope-1, 2);
    for ind = 1:4
        x = actx + movx(ind);
        y = acty + movy(ind);
        if x > 0 && y > 0 
        if temp(x,y) == 1
            temp(x,y) = 0;
            cont=cont+1;
            colaSimul(tope, 1) = x;
            colaSimul(tope, 2) = y;
            tope = tope+1;
           
        end
        end
    end
end

area1 = cont

