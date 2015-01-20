%Practica descriptores de segundo orden
%late
%19/01/2015
%ima = imread('C:\Users\Alumnos\Documents\MATLAB\PDI\Tercero\floor1-a-p002.png');
ima = imread('E:\Documentos+\2015 A\PDI\PDI\imagenes\floor1-a-p002.png');
% canvas1-a-p001
% ceiling1-a-p001
% floor1-a-p002
imtool close all
[M,N] = size(ima);

[h,r] = imhist(ima);

emed0 = zeros(255,255);
emed45 = zeros(255,255);
emed135 = zeros(255,255);
emed90 = zeros(255,255);
s0 = 0;
s45 = 0;
s90 = 0;
s135 = 0;
L = max(max(ima))
for i = 1:L
    for j= 1:L
        a= i;
        b=j;
        d = 1;
        [emed0(i,j),emed45(i,j), emed90(i,j),emed135(i,j)]= cuenta(a,b,d,ima,M,N);%(a,b,d,ima,M,N)
        s0 = s0 + emed0(i,j);
        s45 = s45 + emed45(i,j);
        s90 = s90 + emed90(i,j);
        s135 = s135 + emed135(i,j);
    end
end

11

