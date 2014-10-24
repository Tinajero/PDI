% programa que realiza los filtros de 
% - Mediana
% - Max
% - Min
% - punto medio 
% con la ayuda de la funcion ventana
imtool Close All

%img = magic(5);
img = imread('C:\Users\Alumnos\Documents\MATLAB/images/tools3.bmp');
img = imnoise( img, 'salt & pepper', 0.2); % agregando sal y pimienta a la imagen
img = double(img)
imtool( img, [] );

[M, N] = size(img);
M
N
med = zeros(M, N);
maxim = zeros(M, N);
minim = zeros(M, N);
puntomedio = zeros(M ,N);
for i = 1:M
    for j = 1:N
        vent = ventana(img, i, j ,3);% ventana funcion que te regresa una ventana de longitud 3 
        med(i,j) = median(  vent );
        maxim(i,j) = max( vent );
        minim(i,j) = min( vent );
        puntomedio(i,j) = (maxim(i,j) + minim(i,j)) / 2;
    end
end
%med
%maxim
%minim
%puntomedio

imtool( med, []);
imtool( maxim, []);
imtool( minim, []);
imtool( puntomedio, []);