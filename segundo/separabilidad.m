% separabilidad
% 24 de nov 2015

% podemos obtener la tdf por filas
% luego por columnas y tengo la tdf
imtool close all
f = imread('C:\Users\Alumnos\Documents\MATLAB/images/reloj.bmp');
f = double(f);
F = fft2(f);
[m,n] = size(f);
F2 = zeros(m,n);
for i = 1:m
    F2(i,:) = fft(f(i,:)) ;
end


for j = 1:n
    F2(:,j) = fft(F2(:,j)) ;
end

fmag = sqrt(real(F).*real(F)+imag(F).*imag(F));
f2mag = sqrt(real(F2).*real(F2)+imag(F2).*imag(F2));

flog = log(F);
f2log = log(F2);

imtool(F2,[]);
imtool(F,[]);


imtool(fmag,[]);
imtool(f2mag,[]);

imtool(flog,[]);
imtool(f2log,[]);