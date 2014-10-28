% programa que hace la rotacion , traslacion y zoom 

%limpiado memoria de trabajo
clear all
% cerrando todas las ventanitas de imagenes
imtool close all
cuadrado = ones(50)*255;


cuadrado(20:42, 15:30) = 1;
% imtool(cuadrado, [])
traslacion = ones(50)*255;
despX = 10; % mi desplazamiento que tendra en X
despY = 10; % desplazazmiento que tendra en Y
limiteX = 50; % limites de la imagen 
limiteY = 50;  % limite y de la imagen
for i = 1:50
    for j = 1:50
       if i + despX < limiteX  && j + despY < limiteY
         traslacion( i + despX, j + despY) = cuadrado( i, j);
       end
    end
end

%imtool(cuadrado, [])
%imtool(traslacion, [])
zoom = 2;
%imZoom = ones(50 * zoom)*255;
for i =  1:50
    for j = 1:50
        for k = 1:zoom
            imZoom(zoom*i+k,zoom*j) = cuadrado(i,j);
            imZoom(i*zoom,j*zoom + k) = cuadrado(i,j);
        end
    end
end
%imtool(imZoom, [ ] )

% rotacion 
% primero se tiene que llevar ala centro del origen l aimagen con el centro
% de la imagen
% desepues se le aplica la rotacion
% por ultimo se regresa a donde estaba
imagen = imread('images/caballo.bmp');
[m,n] = size(imagen);
m
n
cx = m/2; % como es de 50px la debe llevar a la mitad
cy = n/2;
teta = 0.523598776*3;% 90 grados en radianes
rotacion = ones(m) * 255;
imtool(imagen,[]);
for i =  1:m
    for j = 1:n
        % esta es la rotacion                             llevando al
        %                                                       centro
     ans = [cos(teta) -sin(teta) ; sin(teta) cos(teta) ] * [i-cx j-cy]' + [cx cy]';
     %  la suma lo esta regresando a donde estaba                                                                   
     %ans
     nx = int64(ans(1));
     ny = int64(ans(2));
     if( nx < m && ny <m && nx >0 && ny > 0)
        rotacion(nx,ny) = imagen(i,j);
     end
    end
end
% como hay puntos que son enteros y da doubles, unos puntos no encuentran
% valor asi que se le debe de hacer una interpolacion
% aqui solo se toma el promedio de sus 4 vecinos y se agrega ese valor al
% pixel que sea blanco
for i= 1:m
    for j = 1:n
        if( rotacion(i,j) == 255 && i > 2 && j > 2 && j < 127 && i < 127  )
            prom = rotacion(i+1,j) + rotacion(i,j+1) + rotacion( i-1,j) + rotacion( i,j-1)
           rotacion(i,j) = prom /4;
        end
    end
end
imtool(rotacion, [] )
