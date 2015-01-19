% practica, entregada 13/01/2014 descripcion de Texturas
% solo dan un valor, r, U, y e, que corresponden a los valores de 
% varianza, uniformidad y entropia
% las formulas estan en el cuaderno de ITIL
% imagenes las envio al correo ayer
ima = imread('C:\Users\Alumnos\Documents\MATLAB\PDI\Tercero\floor1-a-p002.png');
% canvas1-a-p001
% ceiling1-a-p001
% floor1-a-p002
imtool close all
[M,N] = size(ima);

[h,r] = imhist(ima);


imNueva = reshape(ima, M*N, 1);
r2 = 0:1:255; % crea un vector que sus valores sera entre 0 y 255 y se incrementara de uno en uno
h2 = hist(imNueva,r2);
% R

varianza = var(double(imNueva));
R = 1.0 - (1.0 /(1.0+ varianza));
R

% uniformidad
u = zeros(255);
u = double(u);
p = h(1)/double(M*N);
p(1) = p*p; 
for i = 2:255
    p = h(i)/double(M*N);
    u(i) = p*p + u(i-1);
end
U = u(255)
%entropia
E = zeros(255);
E = double(E);
p = h(1) / double(M*N);
if p == 0
    p = 1;
end
loga = log(p);
E(1) = -1 * p *  log2(p);

log2(p);
for i = 2:255
    p = h(i)/double(M*N);
    if p == 0
        p = 1;
    end
    E(i) = -1 * p *  log2(p) + E(i-1);
end
e = E(255)

