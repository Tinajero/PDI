
H = zeros(256);
tam = 256;
D0 = 5;

for i = 1:256
    for j = 1:256
        D = sqrt( (i-128)*(i-128) + (j-128)*(j-128));
        if D <= Do
            H(i,j) = 1;
        else
           H(i,j) = 0;
        end
    end
end

imtool(H,[]);
h = ifft2(H);
imtool(abs(real(h)),[]);
