%filtros suavizante butterworth
H = zeros(256);
H = double(H);
tam = 256;
D0 = 5;
n = 5; % orden del filtro
for i = 1:256
    for j = 1:256
        D  = sqrt( (i-128)*(i-128) + (j-128)*(j-128));
        H(i,j) = 1 /( 1 + ((D/D0)^(2*n)) );
    end
end


imtool(H,[]);
h = ifft2(H);
imtool(abs(real(h)),[]);
