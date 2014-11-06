
x = 0:127;
k = 4;
T = 128;
u = 2*pi*k/T;
f = zeros(T);
for i = 1:128
    f(i,:) = cos(u*x);
end
imtool(f, []);
