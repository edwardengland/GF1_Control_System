[sizes, x0, xnames] = x1_4_Phase_Margin_Analysis([], [], [], 0)

% States to Linearisation Around
% P2: 50.5
% X2: 25
% P100 Lag : 194.7
% L2: 1
% F200 Lag: 208
% P2 PID Int: 0
% P2 PID Deriv: 0
% X2 PID Int: 0
% X2 PID Deriv: 0
% F2 Lag: 2
% L2 PID Int: 0
% L2 PID Deriv: 0
lin = linmod('x1_4_Phase_Margin_Analysis', [50.5, 25, 194.7, 1, 208, 0, 0, 0, 0, 2, 0, 0], [0, 0, 0]); % system, states, inputs

% TF from input 1 to output 6 (F2 to L2)
A = lin.a;
B = lin.b(:, 1);
C = lin.c(6, :);
D = lin.d(6, 1);

% Assemble linearised LTI system

sys1 = ss(A, -B, C, D);
% MULTIPLY B MATRIX BY PROPORTIONAL GAIN TO SEE EFFECTS

% bode(sys1)
margin(sys1)