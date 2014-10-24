% esta funcion regresa un vector que contiene los datos de una ventana W
% y que tiene como dimensiones tamW
% este sirve para no pasarse de los limites cuando queresmo una ventana W
% posicionada en los extremos


function PixV =ventana(img, poscx, poscy, tamW ) 
    [M,N] = size(img);
    mitadW = floor(tamW/2);
    indFil = poscx-mitadW:1:poscx+mitadW;
    indFilV = indFil(( indFil > 0 & indFil < M+1));
    indCol = poscy-mitadW:1:poscy+mitadW;
    indColV = indCol((indCol >0 & indCol < N+1));
    
    PixV = img( indFilV, indColV);
    %regresando el resultado como si fuera un vector
    PixV = reshape( PixV, 1, numel(PixV));
    %return PixV;
end


