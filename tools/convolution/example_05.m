dt = 0.05;
t = -4:dt:4;
%% Signal X
Xa = ((-4:dt:0)+4);
Xb = (-(dt:dt:4)+4);
X = [Xa Xb];
%% Signal H
Ha = zeros(1, length(-4:dt:(-1-dt)));
Hb = ones(1, length(-1:dt:1));
Hc = zeros(1, length((1+dt):dt:4));
H = [Ha Hb Hc];
%% Animation
conv_ani(X, round(length(X)/2), H, round(length(H)/2), dt);