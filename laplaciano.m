
imtool close all
im = imread('C:\Users\Alumnos\Documents\MATLAB/images/tools3.bmp');
[M, N ] = size(im);
w1 = [ -1 -1 -1 ; -1 8 -1; -1 -1 -1 ];
w2 = [ 1 1 1; 1 -8 1; 1 1 1 ];
w3 = [ 0 -1 0 ; -1 4 -1 ; 0 -1 0 ];
w4 = [ 0 1 0 ; 1 -4 1 ; 0 1 0 ];


lap = imfilter(im, w4);

g = zeros(M, N);


for i = 1:M
    for j = 1:N
        g(i,j) = im(i,j) - lap(i,j);
    end
end

imtool(im, []);
imtool(lap, []);
imtool( g, []);