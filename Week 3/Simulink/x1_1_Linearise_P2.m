clc

% System to Linearise
[sizes, x0, xnames] = x1_1_Pre_P2_Linearisation([], [], [], 0);

% Linearisation about operating point
% P2
% X2
% P100
% L2
% F200
% F2
% L2 PID Int
% L2 PID Deriv
lin = linmod('x1_1_Pre_P2_Linearisation', [50.5, 25, 194.7, 1, 208, 2, 0, 0], [10, 0, 5, 40, 208, 25, 50, 194.7]);

% Select IP/OP TF of interest
A = lin.a;
B = lin.b(:, 5);
C = lin.c(5, :);
D = lin.d(5, 5);

% Assemble linearised LTI system
sys1 = ss(A, -B, C, D);
% MULTIPLY B MATRIX BY PROPORTIONAL GAIN TO SEE EFFECTS

%% Calcaulate Required Gain and Crossover Frequency for Target Phase Margin
targetPM = 45;

win = logspace(-3, 2, 1000);
[mag, phase, wout] = bode(sys1, win);
% bode(sys1)

mag = reshape(mag, [], 1);
phase = reshape(phase, [], 1);
requiredGain = 1 / interp1(phase, mag, -180+targetPM, 'spline');
xoFreq = interp1(phase, wout, -180+targetPM, 'spline');

disp(['Proportional Control:'])
disp(['Required Gain for Phase Margin of ' num2str(targetPM) char(176) ': ' num2str(requiredGain) ' (' num2str(20*log10(requiredGain)) ' dB)'])
disp(['Crossover Frequency: ' num2str(xoFreq) ' rad s^-1'])

%% PI Controller

% Target Phase Margin with PI controller
targetPM_PI = 40;

% calc required controller lead/lag at crossover frequency
controllerLag = targetPM_PI - targetPM;

% calc required integrator time constant for the target PM
Ti = 1/(xoFreq * tan(deg2rad(-controllerLag)));

disp([newline 'PI Control:'])
disp(['Kp: ' num2str(requiredGain)])
disp(['Ti: ' num2str(Ti)])