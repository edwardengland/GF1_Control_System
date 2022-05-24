[sizes, x0, xnames] = x3_3_Linearisation_Ready([], [], [], 0);

% States to Linearisation Around
% L2: 1
% X2: 25
% P2: 50.5
% Lag1: 194.7
% Lag2: 208
% Lag IC2: 2
lin = linmod('x3_3_Linearisation_Ready', [1, 25, 50.5, 194.7, 208, 2], [0])

% Assemble linearised LTI system

sys1 = ss(lin.a, lin.b, lin.c, lin.d)

bode(sys1)