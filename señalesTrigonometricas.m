
x = 0:127;
k = 1;
T = 128;
u = 2*pi*k/T;
f = zeros(tam);
for i = 1:128
    f(i,:) = cos(u*x);
end
imtool(f, []);