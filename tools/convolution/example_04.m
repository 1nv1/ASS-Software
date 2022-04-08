dt = 0.01;
t = 0:dt:1;
ang = 2.*pi.*t;
%% Signal X
X = sin(ang);
%% Signal H
H = ones(1, length(ang));
conv_ani(X, 1, H, 1, dt,5);