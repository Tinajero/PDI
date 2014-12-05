ima = imread('C:\Users\Alumnos\Documents\MATLAB/images/reloj.bmp');
[M,N] = size(ima);
T = 78;
Tn = 360;
g = zeros(M,N);
deltaT = 2;
while( (abs( T - Tn )) < deltaT)
    g1,g2;
    g1 = 0.0;
    g2 = 0.0;
    c1 = 0;
    c2 = 0;
    for i = 1:M
        for j = 1:N
            if ima(i,j) <= T
                g1(i,j) = 0;
                g1 = g1 + g(i,j);
                c1 = c1 + 1;
            else
                g2(i,j) = 1
                g2 = g2 + g(i,j);
                c2 = c2 + 1;
            end
        end
    end

    m1 =  g1 / c1;
    m2 = g2/c2;

    Tn = (m1+m2)/2;
   
end

Tn