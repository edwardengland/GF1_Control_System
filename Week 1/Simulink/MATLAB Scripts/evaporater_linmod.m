% Linearise Evaporator around:
% P2 = 50.5
% X2 = 25.0
% F1 = F2 = X1 = F5 = T1 = Q100 = 1

% Used to view order of integrators in Simulink model
[sizes, x0, xnames] = evaporator([], [], [], 0)

[evapA, evapB, evapC, evapD] = linmod('evaporator', [50.5, 25.0], [1, 1, 1, 1, 1, 1])

% 1/eigenvalues gives time constant as previously.
eigA = eig(evapA)