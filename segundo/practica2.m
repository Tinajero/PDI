% practica, no se pudo
% imple,emtar la deteccion de lineas y puntos con el lLaplaciano 
%usar imagen gel.bmp u una imagen sntetica


ima = imread('C:\Users\Alumnos\Documents\MATLAB/images/sinte.bmp');
im = double(ima);
[M,N] = size(im);


w = [-1 -1 -1; 2 2 2; -1 -1 -1];
conv = imfilter(im, w, 0, 'conv')*1/9; % convolucion
mag= zeros(M,N);
fase = zeros(M,N);
for i = 2:M
    for j = 2:N 
        dx = im(i,j)-im(i-1,j);
        dy = im(i,j)-im(i, j-1);
        mag(i,j) = sqrt(dx*dx + dy*dy);
        %fase(i,j) = arctan(dy/dx);
    end
end


imtool(mag,[]);
imtool(fase,[]);

%T = max(abs(Fllap(conv))) * 0.75;
imtool(im, []);












