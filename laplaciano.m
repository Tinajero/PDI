
imtool close all
im = imread('C:\Users\Alumnos\Documents\MATLAB/images/reloj.bmp');
[M, N ] = size(im);
w1 = [ -1 -1 -1 ; -1 8 -1; -1 -1 -1 ];
w2 = [ 1 1 1; 1 -8 1; 1 1 1 ];
w3 = [ 0 -1 0 ; -1 4 -1 ; 0 -1 0 ];
w4 = [ 0 1 0 ; 1 -4 1 ; 0 1 0 ];

lap1 = imfilter(im, w3);
lap2 = imfilter(im, w4);

g = zeros(M, N);
g2 = zeros(M, N);

for i = 1:M
    for j = 1:N
        g(i,j) = im(i,j) - lap1(i,j);
         g2(i,j) = im(i,j) - lap2(i,j);
    end
end

imtool(im, []);
imtool(lap1, []);
imtool(lap2, []);
imtool( g, []);
imtool( g2, []);