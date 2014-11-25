
Do = 5;
H = zeros(256);
ima = zeros(256);
[M,N] = size(ima);
P = 2*M;
Q = 2*N;

fp = zeros(P,Q);
fp(1:M,1:N) = ima;
fp(M+1:P, N+1:Q) = 0;
fpl = zeros(P,Q);
for i = 1:P
    for j = 1:Q
        fpl(i,j) = fp(i,j)*((-1)^(i+j));
    end
end

F = fft2(fpl);

G = H*F;

gp = zeros(P,Q);
for i = 1:P
    for j = 1:Q
        gp(i,j) = real( ifft2( G(i,j) ) ) * (-1)^(i+j);
    end
end

g = gp(1:M,1:N);

