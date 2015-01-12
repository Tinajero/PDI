
ima = imread('C:\Users\Alumnos\Documents\MATLAB\PDI2\im\circuloDeformado.bmp');
imtool close all
[M,N] = size(ima);

[h,r] = imhist(ima);


imNueva = reshape(ima, M*N, 1);
r2 = 0:1:255; % crea un vector que sus valores sera entre 0 y 255 y se incrementara de uno en uno
h2 = hist(imNueva,r2);


sigma = var(double(imNueva));
s = 1- 1/(1+sigma*sigma);