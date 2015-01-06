ima = imread('C:\Users\Alumnos\Documents\MATLAB\PDI2\im\reloj.bmp');

[M,N] = size(ima);
h = imhist(ima);
[tam,tam2] = size(h);
h = h / (M*N);
limite1 = 255/3;
limite2 = (255/3)*2;


% for i = 2: limite1
%     p1(i) = p1(i-1) + h(i); 
%     m1(i) = m1(i-1) + h(i) * i;
% 
%     p2(i) = p2(i-1) + h(limite1+i); 
%     m2(i) = m2(i-1) + h(limite1+i) * i;
% 
%     p3(i) = p3(i-1) + h(limite2+i); 
%     m3(i) = m3(i-1) + h(limite2+i) * i; 
%     
%     mg(i) = p1(i)*m1(i) + p2(i)*m2(i) + p3(i)*m3(i);
% end

max = 0;
for k1 = 1 : tam
    for k2 = k1 + 1 : limite2
        answ = getrob2(k1,k2,h);
        if max < answ
            max = answ;
            k1as = k1;
            k2as = k2;
        end
    end
end


a = 0; b = 50; c = 200;

g = zeros(M,N);
for i = 1: M
    for j = 1: N
        if ima(i,j) <= k1as
            g(i,j) = a;
        else if ima(i,j) > k1as && ima (i,j) < k2as
                g(i,j) = b;
            else
                g(i,j) = c;
            end
        end
    end
end

imtool(g,[]);

         









