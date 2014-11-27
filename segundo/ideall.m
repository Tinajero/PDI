

function HH = ideall( tam, D0)
    
    

    H = zeros(tam);
    M = tam;
    N = tam;
    %D0 = 5;
    tam
    for i = 1:tam
        for j = 1:tam
            D = sqrt( (i-M/2)*(i-M/2) + (j-N/2)*(j-N/2));
            if D <= D0
                H(i,j) = 1;
            else
               H(i,j) = 0;
            end
        end
    end

    imtool(H,[]);
    %h = ifft2(H);
    HH = H;
    %return H;
%imtool(abs(real(h)),[]);
