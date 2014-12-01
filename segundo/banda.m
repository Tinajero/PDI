function HH = banda( tam, D0, w)
    
    H = zeros(tam);
    H = double(H);
    M = tam;
    N = tam;
    %D0 = 5;
    %tam
    for i = 1:tam
        for j = 1:tam
            D = sqrt( (i-M/2)*(i-M/2) + (j-N/2)*(j-N/2));
            if (D <= (D0 + w/2) )&& (D >= (D0 - w/2) )
                H(i,j) = 0;
            else
               H(i,j) = 1;
            end
        end
    end

    %imtool(H,[]);
    %h = 
    HH = H;