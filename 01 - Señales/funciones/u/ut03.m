clear;
%graphics_toolkit("gnuplot");
function ret = u(t) ret = t >= 0; end
% Continuo
t = -2:0.001:2;
subplot(3, 2, 1);
plot(t, u(t), 'linewidth', 4, 'color', 'black');
legend("u(t) ", "location", "northwest");
grid on;
subplot(3, 2, 3);
plot(t, exp(-t), 'linewidth', 4, 'color', 'black');
legend("e^( ^- ^t ^) ", "location", "northwest");
grid on;
subplot(3, 2, 5);
plot(t, exp(-t) .* u(t), 'linewidth', 4, 'color', 'black');
legend("e^( ^- ^t ^) * u(t) ", "location", "northwest");
grid on;
% Discreto
n = -2:2;
subplot(3, 2, 2);
stem(n, u(n), 'linewidth', 4, 'color', 'black');
legend("u[n] ", "location", "northwest");
grid on;
subplot(3, 2, 4);
stem(n, exp(-n), 'linewidth', 4, 'color', 'black');
legend("e^[ ^- ^n ^] ", "location", "northwest");
grid on;
subplot(3, 2, 6);
stem(n, exp(-n) .* u(n), 'linewidth', 4, 'color', 'black');
legend("e^[ ^- ^n ^] * u[n] ", "location", "northwest");
grid on;
