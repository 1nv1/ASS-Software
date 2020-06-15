% La señal X
X = (1:7) .* (1/7);
% La señal H
H = (7:-1:1) .* (1/7);
% Asumimos que las señales comienzan en el instante 0 (cero)
conv_ani(X, 1, H, 1, 1);