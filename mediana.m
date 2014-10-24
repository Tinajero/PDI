
img = magic(5);
img = double(img)


[M, N] = size(img);
med = zeros(5);
for i = 1:M
    for j = 1:N
        vent = ventana(img, i, j ,3);% ventana funcion que te regresa una ventana de longitud 3 
        med(i,j) = median(  vent);
    end
end
med

