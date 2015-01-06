function [answ] = getrob2(k1, k2, h)
    l3 = size(h);
    p1 = 0;
    p2 = 0;
    p3 = 0;
    for i=1:k1
        p1 = p1 + h(i);
        sm1 = p1 * i;
    end
    
    for i = k1+1:k2
        p2 = p2+ h(i);
        sm2 = p2 *i;
    end
    for i= k2+1:l3
        p3 = p3 + h(i);
        sm3 = p3 * i;
    end
    m1 = sm1/p1;
    m2 = sm2/p2;
    m3 = sm3/p3;
     
    mg = p1*m1 + p2*m2+p3*m3;
    
    answ =p1*(m1-mg)^2 + p2*(m2-mg)^2 + p3*(m3-mg)^2;
end