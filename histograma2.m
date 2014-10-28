% frma de hacer mas histogramas
% solo que como este se usara cuando usemos filtros

im = imread('images/franjas1.bmp');
[M,N] = size(im);
% es necesario que se l e envie imagen si no saldra basura
% pues lo lee como un entero corto sin signo
imNueva = reshape(im, M*N, 1);
% reshape cambia las dimensiones de la imagen, con esta matriz im, la
% convertiras en un vector de m*n filas y 1 columna (un vector)
r = 0:1:255; % crea un vector que sus valores sera entre 0 y 255 y se incrementara de uno en uno
h = hist(imNueva,r); % solo recibe vectores y tambien  r son los beans sobre cuales se hara el histograma
figure; plot(r,h);
%histograma normalizado
p = h/(M*N);
figure; plot(r,p);