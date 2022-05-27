[sizes, x0, xnames] = y3_3_2_Linearisation_Ready([], [], [], 0)

% States to Linearisation Around
% P2: 50.5
% X2: 25
% P100 Lag : 194.7
% L2: 1
% F200 Lag: 208
% F2 Lag: 2
lin = linmod('y3_3_Linearisation_Ready', [50.5, 25, 194.7, 1, 208, 2] ,[10, 2, 5, 40, 208, 25, 50, 194.7])

% Assemble linearised LTI system

sys1 = ss(lin.a, -lin.b, lin.c, lin.d)
% MULTIPLY B MATRIX BY PROPORTIONAL GAIN TO SEE EFFECTS

bode(sys1)

% 23db for 45deg phase margin
% gain of 14
