clear;
%graphics_toolkit("gnuplot");
function ret = u(t) ret = t >= 0; end
% Continuo
t = -5:0.001:5;
subplot(4, 2, 1);
plot(t, u(t), 'linewidth', 4, 'color', 'black');
legend("u(t) ", "location", "northwest");
grid on;
subplot(4, 2, 3);
plot(t, u(-t), 'linewidth', 4, 'color', 'black');
legend("u(-t) ", "location", "northwest");
grid on;
subplot(4, 2, 5);
plot(t, u(t + 1), 'linewidth', 4, 'color', 'black');
legend("u(t+1) ", "location", "northwest");
grid on;
subplot(4, 2, 7);
plot(t, u(t - 1), 'linewidth', 4, 'color', 'black');
legend("u(t-1) ", "location", "northwest");
grid on;
% Discreto
n = -5:5;
subplot(4, 2, 2);
stem(n, u(n), 'linewidth', 4, 'color', 'black');
legend("u[n] ", "location", "northwest");
grid on;
subplot(4, 2, 4);
stem(n, u(-n), 'linewidth', 4, 'color', 'black');
legend("u[-n] ", "location", "northwest");
grid on;
subplot(4, 2, 6);
stem(n, u(n + 1), 'linewidth', 4, 'color', 'black');
legend("u[n+1] ", "location", "northwest");
grid on;
subplot(4, 2, 8);
stem(n, u(n - 1), 'linewidth', 4, 'color', 'black');
legend("u[n-1] ", "location", "northwest");
grid on;
