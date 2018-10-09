graphics_toolkit("gnuplot");
t = [0:0.1:100].* pi;
F = (cos(t ./ 3)) + (cos(t ./ 4));
figure(1);
clf;
hold on;
plot(t, F, 'linewidth', 2);
