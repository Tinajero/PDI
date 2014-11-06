imtool close all

img = imread('C:\Users\Alumnos\Documents\MATLAB/images/reloj.bmp');
[M, N ] = size(img);
w = [1 1 1; 1 1 1; 1 1 1];

imtool(img, []);
suavizada = imfilter(img, w);
suavizada = double(suavizada);
suavizada = suavizada/9;
imtool( suavizada, []);
highboos = ones(M,N);
mask1 = ones(M,N);
mask1 = double(img)-suavizada;
k = 50;
highboos = double(img) + k*mask1;
%for i = 1:M
   % for j = 1:N
  %      mask1(i,j) = img(i,j) - suavizada(i,j);
 %   end
%end

imtool( highboos, []);

s1 = [-1 -2 -1; 0 0 0 ; 1 2 1];
s2 = [-1 0 1 ; -2 0 2; -1 0 1 ];

d1 = imfilter( img, s1);
d2 = imfilter( img, s2);
mag = ones(M,N);
mag = double(mag);
d1 = double(d1);
d2 = double(d2);
for i = 1:M
    for j = 1:N
        dx = d1(i,j);
        dy = d2(i,j);
        mag (i,j) = sqrt( dx*dx + dy*dy );
    end
end
magsuav = imfilter(mag, w);
magsuav= double(magsuav);
g = double(ones(M,N));

w4 = [ 0 1 0 ; 1 -4 1 ; 0 1 0 ];

lap1 = imfilter(img, w4);
lap1 = double(lap1);
mask = ones(M,N);
mask = double(mask); 
mask = lap1.*magsuav;
imtool(mask,[]);
img = double(img);
g = img + mask;
%for i = 1:M
   % for j = 1:N
  %      g(i,j) = img(i,j) + mask(i,j);
 %   end
%end

imtool( g, []);
    
