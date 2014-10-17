% programa que realiza las tranformaciones de 
%  logaritmo
% exponencial
% ecualizacion
% autor: Daniel M 17/10/2014
image = imread('images/bola.bmp');
[m,n] = size(image);
imtool close all
close all
loga = ones(m,n)*255;
expo = ones(m,n)*255;
h = imhist( image);
ecua = ones(m,n)*255;
L = double(max(max(image)));
c = 20;
 
suma =0;

for i = 1:m
    for j = 1:n
        r = double(image(i,j) );
        loga(i,j) = c* log( r+1 );
        expo(i,j) = c * exp( r+1);
    end
end

sk = 1:256;

for i=1:255
    suma = 0;
    for j = 1:i
        suma = suma + h(j); 
    end   
    ssk = suma
    sk(i) = ssk ;
    
end
sk = fix( (L-1)/(m*n)*sk );
for i=1:m
    for j=1:n
        ind = image(i,j);
        ecua(i,j) = sk( ind + 1 );
    end
end

figure;
plot(h);
imtool(loga, [])
imtool(expo,[])
imtool(ecua,[])
