% programa que usa las tranformaciones
% primero de transformaciones 14/10/2014

im = imread('images/angio.bmp');
[M,N] = size(im);

imnueva = ones(M)*255;
maximo = max(max(im))
minimo = min(min(im))
for i= 1:M
    for j = 1:N
        r = im(i,j);
        imnueva(i,j) = (maximo-r)+minimo;
    end
end

imtool(imnueva, [])