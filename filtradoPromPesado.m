% Filtrado de promedio pesado
% Autor : Daniel Ruiz
% 

%clear all
%imtool close alll
 imOriginal = imread ('C:\Users\Alumnos\Documents\MATLAB/images/tools3.bmp');
 imOriginal = double(imOriginal);
 [M,N] = size( imOriginal);
 w = ones(3);
 [m,n] = size(w);
 MRell = M+(m-1)*2;
 NRell = N+(n-1)*2;
 imRellena = zeros(MRell, NRell );
 
 imRell(m:M+(m-1),n:N+(n-1)) = imOriginal;
 a = (m-1)/2;
 b = (n-1)/2;

 imConv = zeros(MRell, NRell);
for i = m:M+(m-1)
    for j = n:N+(n-1)
        for s = -a:a
            for t = -b:b
                posx = i-s;
                posy = j-t;
                imConv(i,j) = imConv(i,j) + imRell(posx, posy)*w(s+a+1,t+b+1 );
            end
        end
    end
end
cteN = sum(sum(w));
imConv = imConv / cteN;
imtool(imConv, []);
%recupero la imagen con las dimensiones correctas
imRes = imConv(m:M+(m-1), n:N+(n-1));
imtool(imRes, []);
