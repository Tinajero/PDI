
Do = 5;
imtool close all;
ima = imread('C:\Users\Alumnos\Documents\MATLAB/images/reloj.bmp');
ima = double(ima);
[M,N] = size(ima);
P = 2*M;
Q = 2*N;

fp = zeros(P,Q);
fp(1:M,1:N) = ima;
fp(M+1:P, N+1:Q) = 0;
fpl = zeros(P,Q);
imtool(fp,[]);

for i = 1:P
    for j = 1:Q
        fpl(i,j) = fp(i,j)*( (-1)^(i+j) );
    end
end

% fpl = fp.*(exp((-1)*(M+N)));

imtool(fpl,[]);

F = fft2(fpl);
H = ideall( P, 100 );
G = H.*F;

gp = zeros(P,Q);
gp = double(gp);
for i = 1:P
    for j = 1:Q
        G(i,j) = G(i,j)  * ( (1)^(i+j) );
        
    end
end
gp = abs( real( ifft2( G ) )    );

g = gp(1:M,1:N);
imtool(gp,[]);
imtool(g,[]);

H = ideall( P, 3 );
H = 1 - H;
G = H.*F;

gp = zeros(P,Q);
gp = double(gp);
for i = 1:P
    for j = 1:Q
        G(i,j) = G(i,j)  * ( (1)^(i+j) );
        
    end
end
gp = abs( real( ifft2( G ) )    );
g = gp(1:M,1:N);
imtool(g, []);


H = banda( P, 50, 50 );
G = H.*F;

gp = zeros(P,Q);
gp = double(gp);
for i = 1:P
    for j = 1:Q
        G(i,j) = G(i,j)  * ( (1)^(i+j) );        
    end
end
gp = abs( real( ifft2( G ) )    );
g = gp(1:M,1:N);
imtool(g, []);
