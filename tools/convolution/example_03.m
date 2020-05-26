dt = 0.02;
t = -2:dt:1;
%% Signal X
X1 = 2.*t(1:length(-2:dt:0)) + 4;
X2 = zeros(1, length((0+dt):dt:1));
X = [X1 X2];
%% Signal H
H1 = zeros(1, length(-2:dt:-1));
H2 = 2.*ones(1, length((-1+dt):dt:0));
H3 = -2.*t(1:length((0+dt):dt:1)) - 2;
H = [H1 H2 H3];
conv_ani(X, length(-2:dt:0), H, length(-2:dt:0), dt, 10, 2);