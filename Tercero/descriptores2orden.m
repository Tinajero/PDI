%Practica descriptores de segundo orden
%late
%19/01/2015
ima = imread('C:\Users\Alumnos\Documents\MATLAB\PDI\Tercero\canvas1-a-p001.png');

%ima = imread('E:\Documentos+\2015 A\PDI\PDI\imagenes\floor1-a-p002.png');
% canvas1-a-p001
% ceiling1-a-p001
% floor1-a-p002
imtool close all

%[M,N] = size(ima);
M = 64;
N = 64;


[h,r] = imhist(ima);

emed0 = zeros(255,255);
emed45 = zeros(255,255);
emed135 = zeros(255,255);
emed90 = zeros(255,255);
s0 = 0;
s45 = 0;
s90 = 0;
s135 = 0;
L = max(max(ima))
%L = 64
for i = 1:L
    for j= 1:L
        a= i;
        b=j;
        d = 1;
        
        [emed0(i,j),emed45(i,j), emed90(i,j),emed135(i,j)]= cuenta(a,b,d,ima,M,N);%(a,b,d,ima,M,N)
        %emed0(i,j),emed45(i,j), emed90(i,j),emed135(i,j)
        %cont0, cont45, cont90, cont135
        s0 = s0 + emed0(i,j);
        s45 = s45 + emed45(i,j);
        s90 = s90 + emed90(i,j);
        s135 = s135 + emed135(i,j);
    end
    i
end

p0 = emed0/s0;
p45 = emed45/s45;
p90 = emed90/s90;
p135 = emed135/s135;

amb0 =0;
amb45 = 0;
amb90 = 0;
amb135 = 0;

cont0 = 0;
cont45 = 0;
cont90 = 0;
cont135 = 0;


idf0 =0;
idf1 =0;
idf2 =0;
idf3 =0;

ent0 = 0;
ent1 = 0;
ent2 = 0;
ent3 = 0;

for i =  1:L
    for j = 1:L
       amb0 = amb0+p0(i,j); 
       
        amb45 =amb45+p45(i,j)*p45(i,j); 
        amb90 = amb90+p90(i,j)*p90(i,j); 
        amb135 =amb135+p135(i,j)*p135(i,j); 
        
       n = i-j;
        idf0 = idf0 + p0(i,j)/(1-n*n);
        idf1 = idf1 + p45(i,j)/(1-n*n);
        idf2 = idf2 + p90(i,j)/(1-n*n);
        idf3 = idf3 + p135(i,j)/(1-n*n);
        
        ent0 = ent0 + (-p0(i,j)*log2(p0(i,j)));
        ent1 = ent1 + (-p45(i,j)*log2(p45(i,j)));
        ent2 = ent2 + (-p90(i,j)*log2(p90(i,j)));
        ent3 = ent3 + (-p135(i,j)*log2(p135(i,j)));
    end
end


for k = 1: L
    for i =  1:L
    for j = 1:L
         n = abs(i-j);
        cont0 =cont0 +  p45(i,j)*n*n;
        cont45 = cont45+p45(i,j)*n*n;
        cont90 =cont90+p90(i,j) *n*n ;
        cont135 =cont135+ p135(i,j)*n*n;
    end
    end
end





