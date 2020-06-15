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
plot(t, t.**2, 'linewidth', 4, 'color', 'black');
legend("t^2 ", "location", "northwest");
grid on;
subplot(3, 2, 5);
plot(t, (t.**2) .* u(t), 'linewidth', 4, 'color', 'black');
legend("t^2 * u(t) ", "location", "northwest");
grid on;
% Discreto
n = -10:10;
subplot(3, 2, 2);
stem(n, u(n), 'linewidth', 4, 'color', 'black');
legend("u[n] ", "location", "northwest");
grid on;
subplot(3, 2, 4);
stem(n, n.**2, 'linewidth', 4, 'color', 'black');
legend("n^2 ", "location", "northwest");
grid on;
subplot(3, 2, 6);
stem(n, (n.**2) .* u(n), 'linewidth', 4, 'color', 'black');
legend("n^2 * u[n] ", "location", "northwest");
grid on;
