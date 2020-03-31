clear;
%graphics_toolkit("gnuplot");
function ret = u(t) ret = t >= 0; end
% Continuo
t = -10:0.01:10;
subplot(3, 2, 1);
plot(t, u(t), 'linewidth', 4, 'color', 'black');
legend("u(t) ", "location", "northwest");
grid on;
subplot(3, 2, 3);
plot(t, t, 'linewidth', 4, 'color', 'black');
legend("t ", "location", "northwest");
grid on;
subplot(3, 2, 5);
plot(t, t .* u(t), 'linewidth', 4, 'color', 'black');
legend("t * u(t) ", "location", "northwest");
grid on;
% Discreto
n = -10:10;
subplot(3, 2, 2);
stem(n, u(n), 'linewidth', 4, 'color', 'black');
legend("u[n] ", "location", "northwest");
grid on;
subplot(3, 2, 4);
stem(n, n, 'linewidth', 4, 'color', 'black');
legend("n ", "location", "northwest");
grid on;
subplot(3, 2, 6);
stem(n, n .* u(n), 'linewidth', 4, 'color', 'black');
legend("n * u[n] ", "location", "northwest");
grid on;