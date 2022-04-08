d = @(x) (x >= 0) && (x <= 4);
u = @(x) x >= 0;
% Definimos el vector del tiempo 'continuo'
dt = 1; % ~~50[ms]
% El vector del tiempo coincide con un ciclo completo
t = -4:dt:4;
% La señal X
X = ones(1, length(t));
% La señal H
H = d(t);
% Asumimos que las señales comienzan en el instante 0 (cero)
conv_ani(X, round(length(X)/2), H, round(length(H)/2), dt);
