im = imread('images/franjas1.bmp');
%histograma
imhist(im)
%histograma normalizado
[h,r] = imhist(im);
[M,N] = size(im);
% h el conteno de cada uno de los niveles de intesidad
% r los niveles de intesidad sobre los cuales se hace elc onteo
p = h/(M*N);
figure;
plot(r,p);
% el 0 es un negro
% un 255 es un blanco