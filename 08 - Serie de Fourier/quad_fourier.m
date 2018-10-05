graphics_toolkit("gnuplot");
t = -0.5:0.001:0.5;
n = 9;
j = 1;
cc=hsv2rgb ([(0:n-1)'/n, ones(n,2)]);
armonico = [;];
senial = zeros(1,length(t));
espectro = [];
figure(1);
clf;
hold on;
for i=1:2:n 
  armonico(i,:) = (4/pi)*(1/i)*sin(i*2*pi*t);
  espectro(i) = (4/pi)*(1/i);
  plot(t, armonico(i, :), 'linewidth', 2, 'color',cc(j,:));
  senial = senial + armonico(i,:);
  j = j + 1; 
end
plot(t, senial, 'linewidth', 2,'color',cc(j,:));
original = [(ones(1, length(t)/2).*(-1)) ones(1, (length(t)/2)+1)];
plot(t, original, 'linewidth', 2, 'color', "black");
legend("Fundamental ",
  "Tercer armonico ",
  "Quinto armonico ",
  "Septimo armonico ",
  "Noveno armonico ",
  "Suma ",
  "Original ",
  "location",
  "southeast");
title('Composición de la serie de Fourier de la señal cuadrada');
ylabel('Amplitud');
xlabel('Tiempo');
grid on;
axis([-0.5 0.5 -1.5 1.5]);
figure(2);
clf;
hold on;
stem(espectro, 'linewidth', 2, 'color', 'black');
title('Espectro en frecuencia de la señal cuadrada');
ylabel('Amplitud');
xlabel('Frecuencia angular');
grid on;
