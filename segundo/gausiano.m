
function HH = gausiano(tam, D0, n)
H = zeros(256);
%tam = 256;
%D0 = 5;
%n = 2; % orden del filtro
for i = 1:256
    for j = 1:256
         D  = sqrt( (i-128)*(i-128) + (j-128)*(j-128));
         D2 = D*D;
         D02 = D0*D0;
        H(i,j) = exp(-D2/(2*D02) );
    end
end
%imtool(H,[]);
 HH = abs(real(H))  ;
%h = ifft2(H);
%imtool(abs(real(h)),[]);

