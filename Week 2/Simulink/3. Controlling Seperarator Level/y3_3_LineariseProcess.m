[sizes, x0, xnames] = y3_3_SISO_OL_PropControl_System([], [], [], 0)

% States to Linearisation Around
% L2: 1
% X2: 25
% P2: 50.5
% P100 Lag : 194.7
% F200 Lag: 208
% F2 Lag: 2
lin = linmod('y3_3_SISO_OL_PropControl_System', [1, 2, 208, 194.7, 50.5, 25], [0])

% Assemble linearised LTI system

sys1 = ss(lin.a, -14*lin.b, lin.c, lin.d)
% MULTIPLY B MATRIX BY PROPORTIONAL GAIN TO SEE EFFECTS


bode(sys1)

% 23db for 45deg phase margin
% gain of 14