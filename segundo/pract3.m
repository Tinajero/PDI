% prasctica 3 de aplicar el  detectodr de canny 03/12/2014
ima = imread('C:\Users\Alumnos\Documents\MATLAB/images/sinte.bmp');
[M,N] = size(ima);

%H = gausiano(M, 5, 4);
H = fspecial('gaussian');

f = imfilter(ima, H);

dx = [-1 -2 -1 ; 0 0 0; 1 2 1];
dy = [-1 0 1; -2 0 2; -1 0 1];

dfx = imfilter(f, dx);
dfy = imfilter(f, dy);

dfx = double(dfx);
dfy = double(dfy);


mag = zeros(M,N);
fase = zeros(M,N);
for i = 1:M
    for j = i:N
        dix = dfx(i,j);
        djy = dfy(i,j);
        mag(i,j) = sqrt(dix*dix + djy*djy);
        fase(i,j) = atan2(djy,dix);
    end
end

fased = zeros(M,N);
fased = fase*57.2957795;