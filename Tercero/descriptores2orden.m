%Practica descriptores de segundo orden
%late
%19/01/2015
ima = imread('C:\Users\Alumnos\Documents\MATLAB\PDI\Tercero\floor1-a-p002.png');
% canvas1-a-p001
% ceiling1-a-p001
% floor1-a-p002
imtool close all
[M,N] = size(ima);

[h,r] = imhist(ima);

emed0 = zeros(255,255);
emed45 = zeros(255,255);
emede135 = zeros(255,255);
emede90 = zeros(255,255);

for i = 1:3
    for j= 1:3
        a= i;
        b=j;
        d = 1;
        emed0(i,j) = cuenta(a,b,d,ima,M,N);%(a,b,d,ima,M,N)
        
    end
end

