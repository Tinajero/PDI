

ima = imread('C:\Users\Alumnos\Documents\MATLAB/images/reloj.bmp');
[M,N] = size(ima);
T = 78;
Tn = 360;
g = zeros(M,N);
deltaT = 2;


g1 = ima > T;
g2 = ima <= T;


indicesg1 = find( ima> T);
indicesg2 = find( ima <= T);

