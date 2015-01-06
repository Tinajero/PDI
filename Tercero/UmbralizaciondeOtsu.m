
ima = imread('C:\Users\Alumnos\Documents\MATLAB\PDI2\im\reloj.bmp');

[M,N] = size(ima);
h = imhist(ima);

h = h/(M*N); % normalizando
[tam,x] = size(h);
p1 = zeros(tam,x);
m = zeros(tam,x);
rob = zeros(tam, x); % el de las varianzas
rob1 = zeros(tam, x);
rob2 = zeros(tam, x);
mg = 0; %media global de intensidades
p1(1) = h(1);
m(1) = h(1);
for i = 2: tam
    p1(i) = p1(i-1) + h(i); % paso 2
    m(i) = m(i-1) + h(i) * i; % paso 3
end
 mg = m(tam);
 maximo = 0;
 for i = 1:tam
     rob1(i) = ( mg * p1( i ) - m( i ) )^2;
     rob2(i) =  p1(i)*( 1 - p1(i) );
     rob(i) =  ( ( mg * p1( i ) - m( i ) )^2 )/( p1(i)*(1-p1(i)) );
     if rob(i) > maximo
         maximo = rob(i);
         k = i;
     end
 end
 
 %kasterisco = max(rob)
 g = zeros(M,N);
% for i = 1:M
%     for j = 1: N
%         if ima(i,j) < k
%             g(i,j) = ima(i,j);
%         end
%     end
% end
g = ima > k
imtool(ima,[]);
imtool(g,[]);           
    

