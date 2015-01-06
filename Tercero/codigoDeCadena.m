
% usando la umbralizacion se obtiene dos regionezs la region 1 que es el
% fondo y la 2 que es el objeto
% se tiene que encontrar sus borde ya sea con 4 conectividad o 8
% conectividad
% despues aplicar la representacion del borde con el codigo de cadena
ima = imread('C:\Users\Alumnos\Documents\MATLAB\PDI2\im\reloj.bmp');
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
ans = ima > T;
imtool(ans,[]);

