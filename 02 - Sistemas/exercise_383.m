dt = 0.001;
t = -4:dt:4;
%% Signal X
Xa = ((-4:dt:0)+4);
Xb = (-(dt:dt:4)+4);
X = [Xa Xb];
%% Signal H
Ha = zeros(1, length(-4:dt:(-1-dt)));
Hb = ones(1, length(-1:dt:1));
H = [Ha Hb Ha];

t1 = -5:dt:-3;
t2 = (-3+dt):dt:-1;
t3 = (-1+dt):dt:1;
t4 = (1+dt):dt:3;
t5 = (3+dt):dt:5;

y1 = ((t1.**2)/2) + (5.*t1) + (25/2);
y2 = (2.*t2) + 8;
y3 = (-t3.**2) + 7;
y4 = (-2.*t4) + 8;
y5 = ((t5.**2)/2) - (5.*t5) + (25/2);

fill = zeros(1, round(3/dt));
y = [fill y1 y2 y3 y4 y5 fill];

figure(1);
clf;
hold on;
plot(y, 'linewidth', 4, 'color', 'black');
plot(conv(X, H).*dt, 'linewidth', 4, 'color', 'red', '--');
legend(strcat('\fontsize{24}Solución análitica'), strcat('\fontsize{24}Solución computacional'));
grid on;