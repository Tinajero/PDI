% da un efecto de suavisamiento, este es un filtro suavizante que ayuda a
% eliminar cierto tipo de ruido 
% -"Reducion del ruido" (reduce los cambios abruptos de intesidad), 
% - hace un suavizamiento de bordes falsos.
% - Reduce detalles irrelevantes ( dependiendo del tamaño de la mascara, va
% ser el efecto reductor): regiones pequeñas con respecto al tamaño de la
% mascara de filtrado
% pero nos dara un efecto de coronomiento en bordes de interes, para ver
% que tanto queremos

imOrg = imread('images/tools3.bmp');
% los corchetes es p ara que lo despliege con el rango dinamico de la
% imagen
imtool(imOrg, []);
% recomendable convertirla a double
j = double(imOrg);
% filtro de caja de 3 x 3
w = [1 1 1; 1 1 1; 1 1 1];
% si no se le especifica nada esto hace la correlacion
corr = imfilter(j,w)*1/9; % correlacion
% si quiere convolucion se le especifica con el 'conv' 
% el 0 es para decirle que rellene con ceros la imagen
% ponga n-1 ceros en filas y en columnas
conv = imfilter(j, w, 0, 'conv')*1/9; % convolucion
% convolucion, copia borde de la imagen
% en esto tambien le dice, haz la convolucion pero en ves de llenar con
% ceros pon lo que tiene nuestra imagen en sus marcos
convIR = imfilter(j, w, 'replicate', 'conv')*1/9;
imtool(corr, []);
imtool(conv, []);
imtool(convIR, []);

% =====================================
% Tipos :
% - Filtros de caja, son los que tienen todos unos 
%   1 1 1
%   1 1 1 x 1/9
%   1 1 1
% - Filtros de promedio pesado
% 