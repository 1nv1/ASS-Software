graphics_toolkit("gnuplot");
t = -0.5:0.01:0.5;
n = 8;
j = 1;
cc=hsv2rgb ([(0:n-1)'/n, ones(n,2)]);
figure(1);
clf;
hold on;
an = [;];
senial = ones(1,length(t))*(1/pi);
plot(t, senial, 'linewidth', 2, 'color', cc(j,:));
espectro = [];
b1 = (1/2)*sin(2*pi*t);
plot(t, b1, 'linewidth', 2, 'color', cc(j,:));
espectro(1) = 1/2;
for i=2:2:n 
  an(i,:) = -(1/pi)*(2/((i*i)-1))*cos(i*2*pi*t);
  espectro(i) = -(1/pi)*(2/((i*i)-1))
  plot(t, an(i, :), 'linewidth', 2, 'color',cc(j,:));
  senial = senial + an(i,:);
  j = j + 1; 
end
senial = senial + b1;
plot(t, senial, 'linewidth', 2,'color', cc(j,:));
original = [(zeros(1, length(t)/2)) sin(t((length(t)/2):(length(t)))*2*pi)];
plot(t, original, 'linewidth', 1, 'color', "black");
title('Composición de la serie de Fourier de la señal de media onda rectificada');
ylabel('Amplitud');
xlabel('Tiempo');
grid on;
axis([-0.5 0.5 -1.5 1.5]);
legend("a0",
  "b1 ",
  "a2 ",
  "a4 ",
  "a6 ",
  "a8 ",
  "Suma ",
  "Original ",
  "location",
  "southeast");
figure(2);
clf;
hold on;
stem(espectro, 'linewidth', 2, 'color', 'black');
title('Espectro en frecuencia de la señal de media onda rectificada');
ylabel('Amplitud');
xlabel('Frecuencia angular');
grid on;
