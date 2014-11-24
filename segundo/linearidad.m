% 24 nov 2015


%leer dos imagenes
% calcule el tdf
% aplicar linearidad
% es es lo mismo la suma de dos tdf, a la tdf de la suma de esos dos
imtool close all

f = imread('C:\Users\Alumnos\Documents\MATLAB/images/reloj.bmp');
h = imread('C:\Users\Alumnos\Documents\MATLAB/images/tools.bmp');

f = double(f);
h = double(h);

g = f + h;
F = fft2(f);
H = fft2(h);
imtool(f,[]);
imtool(h,[]);
%observar los rangos dinamicos seran los mismos

G1 = F + H;
G1mag = sqrt(real(G1).*real(G1)+imag(G1).*imag(G1));
G1log = log(G1);
imtool(G1mag, []);
imtool(G1log, []);

G2 = fft2(g);

G2mag = sqrt(real(G2).*real(G2)+imag(G2).*imag(G2));
G2log = log(G2);
imtool(G2mag,[]);
imtool(G2log, []);