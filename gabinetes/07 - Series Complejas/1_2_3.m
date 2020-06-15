graphics_toolkit("gnuplot");
n = [0:0.1:100];
f = (i.**(n+1))./n;
figure(1);
clf;
plot(real(f), imag(f), 'linewidth', 4);
axis([-1 1 -1 1]);
grid on;

