
imtool close all
x = 0:127;
k = 80;
T = 128;

u = 2*pi*k/T;
f = zeros(T);
fh = zeros(T);
fdiag = zeros(T);
fdiag2 = zeros(T);

for i = 1:128
    f(i,:) = cos(u*x);
    fh(:,i) = cos(u*x);
end
imtool(f, []);
%imtool(fh, []);

for i = 1:128
        for j= 1:128
            fdiag(i,j) = cos(  (u*i)/2  + (u*j)/2  );
            fdiag2(i,j) = sin(  (u*i)/2  + (u*j)/2  );
        end
end

%imtool(fdiag, []);
%imtool(fdiag2, []);

F = fft2(fh);% los puntos salen a la derecha , dos puntitos
%F = fft2(f); % aqui los puntos salen arriba
imtool( real(F), []);
plot(x, real(F)); 
% se ven dos puntitos hasta arriba , dependiendo de que patrones sean ,
% vertical u horizontal
