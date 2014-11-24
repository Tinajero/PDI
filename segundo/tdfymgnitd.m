% 24 de noviembre de 2015
% programa que saca la magnitud  logaritmo de una TDF
% crea un cuadrito, a ese cuadro se le saca su transformada de fourier,
% luego el numero complejo 
% se obtiene la magnitud y su logaritmo
% en G lo que se hace es una traslacion al multiplicar por la exponencial
imtool close all
f = zeros(256);
f(118:138, 118:138) = 255;
F = fft2(f);
imtool(f,[]);
imtool(F);
Fmag = sqrt(real(F).*real(F)+imag(F).*imag(F));
imtool(Fmag, []);
FmagL = log(Fmag);
imtool( FmagL, []);

expI = zeros(256);
g = zeros(256);
for i = 1:256
    for j = 1:256
        expI(i,j) = (-1)^(i+j);
    end
end

g = f.*expI;
imtool(g);
G = fft2(g);
%Magnitud G
gmag = sqrt(real(G).*real(G)+imag(G).*imag(G));

%logaritmo G

gl = log(G);

imtool(gmag, []);
imtool(gl, []);
