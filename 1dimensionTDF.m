
x = 0:127;
k = 4;
T = 128;

u = 2*pi*k/T;
f = cos(u*x);

plot(x,f);
F = fft(f);