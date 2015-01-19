
function [cont0,cont45,cont90] = cuenta (a,b,d,ima,M,N)
cont = 0;
cont45 = 0;
    for i = 1: M
        for j = 1: N

            if ( j+d <= N && (ima(i,j) == a && ( ima(i,j+d) ==b) || (j-d>0 && ima(i,j) == a && ima(i,j-d) ==b) ) )
                cont= cont+1;
            end
            if( j+d <=N && i +d <=M && j-d >0 && i-d > 0 && ( (ima(i,j) == a && ima(i+d,j+d) ==b)|| (ima(i,j) == a && ima(i-d,j-d) == b) ) )
                
                cont45=cont45+1;
            end
            
            if(j+d <=N &&  j-d >0 && ( (ima(i,j)==a && ima(i+d,j)==b) || (ima(i,j)==a && ima(i+d,j)) ) )
                cont90=cont90+1;
            end
            
        end
    end
    cont0 = cont;
end
