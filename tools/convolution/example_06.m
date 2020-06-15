% La señal X
X = ones(1, 7);
% La señal H
H = X;
% Asumimos que las señales comienzan en el instante 0 (cero)
conv_ani(X, 1, H, 1, 1);