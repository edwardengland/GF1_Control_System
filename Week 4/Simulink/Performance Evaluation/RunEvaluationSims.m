clear all;
clc;
close all;

%% CONFIGURE
model = 'x_1_GainSchedule_AutoSim';
% model = 'x_2_StateFeedback_AutoSim';
% model = 'x_3_PI_AutoSim';

simConfigPath = 'C:\Workspaces\GF1_Control_System\Week 4\Simulink\Performance Evaluation\SimulationConfig.xlsx';
perfIndicesOutPath = 'C:\Workspaces\GF1_Control_System\Week 4\Simulink\Performance Evaluation\PerformanceIndices.xlsx';
%% SIMULATE

% Read config file
[~, ~, simConfig] = xlsread(simConfigPath);
simConfig = cell2table(simConfig(2:end, :), 'VariableNames', simConfig(1, :));
simConfig = rmmissing(simConfig);

numSims = numel(simConfig.Sim);

% Setup sims for parallel computing
for iSim = 1:numSims

    in(iSim) = Simulink.SimulationInput(model);

    in(iSim) = setBlockParameter(in(iSim), [model '/L2 Set Point'], 'Before', num2str(simConfig.L2_init(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/L2 Set Point'], 'After', num2str(simConfig.L2_init(iSim) + simConfig.L2_init(iSim)*simConfig.L2_step_pc(iSim)/100 ));

    in(iSim) = setBlockParameter(in(iSim), [model '/F1 In'], 'Before', num2str(simConfig.F1_init(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/F1 In'], 'After', num2str(simConfig.F1_init(iSim) + simConfig.F1_init(iSim)*simConfig.F1_step_pc(iSim)/100 ));

    in(iSim) = setBlockParameter(in(iSim), [model '/X1 In'], 'Before', num2str(simConfig.X1_init(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/X1 In'], 'After', num2str(simConfig.X1_init(iSim) + simConfig.X1_init(iSim)*simConfig.X1_step_pc(iSim)/100 ));

    in(iSim) = setBlockParameter(in(iSim), [model '/T1 In'], 'Before', num2str(simConfig.T1_init(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/T1 In'], 'After', num2str(simConfig.T1_init(iSim) + simConfig.T1_init(iSim)*simConfig.T1_step_pc(iSim)/100 ));

    in(iSim) = setBlockParameter(in(iSim), [model '/T200 In'], 'Before', num2str(simConfig.T200_init(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/T200 In'], 'After', num2str(simConfig.T200_init(iSim) + simConfig.T200_init(iSim)*simConfig.T200_step_pc(iSim)/100 ));

    in(iSim) = setBlockParameter(in(iSim), [model '/F3 In'], 'Before', num2str(simConfig.F3_init(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/F3 In'], 'After', num2str(simConfig.F3_init(iSim) + simConfig.F3_init(iSim)*simConfig.F3_step_pc(iSim)/100 ));

    in(iSim) = setBlockParameter(in(iSim), [model '/F2 Set Point'], 'Before', num2str(simConfig.F2_init(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/F2 Set Point'], 'After', num2str(simConfig.F2_init(iSim) + simConfig.F2_init(iSim)*simConfig.F2_step_pc(iSim)/100 ));

    in(iSim) = setBlockParameter(in(iSim), [model '/F200 Set Point'], 'Before', num2str(simConfig.F200_init(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/F200 Set Point'], 'After', num2str(simConfig.F200_init(iSim) + simConfig.F200_init(iSim)*simConfig.F200_step_pc(iSim)/100 ));

    in(iSim) = setBlockParameter(in(iSim), [model '/P100 Set Point'], 'Before', num2str(simConfig.P100_init(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/P100 Set Point'], 'After', num2str(simConfig.P100_init(iSim) + simConfig.P100_init(iSim)*simConfig.P100_step_pc(iSim)/100 ));

    in(iSim) = setBlockParameter(in(iSim), [model '/P2 Set Point'], 'Before', num2str(simConfig.P2_init(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/P2 Set Point'], 'After', num2str(simConfig.P2_init(iSim) + simConfig.P2_init(iSim)*simConfig.P2_step_pc(iSim)/100 ));

    in(iSim) = setBlockParameter(in(iSim), [model '/X2 Set Point'], 'Before', num2str(simConfig.X2_init(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/X2 Set Point'], 'After', num2str(simConfig.X2_init(iSim) + simConfig.X2_init(iSim)*simConfig.X2_step_pc(iSim)/100 ));

    in(iSim) = setBlockParameter(in(iSim), [model '/process/Evaporator/M_gain'], 'Gain', num2str(1/simConfig.M(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/process/Condenser/UA2_gain'], 'Gain', num2str(simConfig.UA2(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/process/Condenser/UA2_gain2'], 'Gain', num2str(simConfig.UA2(iSim)));
    in(iSim) = setBlockParameter(in(iSim), [model '/process/Seperator/rhoA_gain'], 'Gain', num2str(1/simConfig.rhoA(iSim)));

end

% run sims in parallel
out = parsim(in, 'ShowProgress', 'on');

%% POST PRO
trigger = 1000;
total = 1100;

matITAE = zeros(numSims, 6);
matSat = zeros(numSims, 6);

for iSim = 1:numSims

    saveFolder = ['Results_' num2str(iSim)];
    try
        results = Abhi_Evaluation.evaluate(saveFolder, out(iSim), trigger, total);

        matITAE(iSim, 1) = results.perf(4); % L2
        matITAE(iSim, 2) = results.perf(5); % P2
        matITAE(iSim, 3) = results.perf(6); % X2
        matITAE(iSim, 4) = results.perf(1); % F2
        matITAE(iSim, 5) = results.perf(2); % F200
        matITAE(iSim, 6) = results.perf(3); % P100

        matSat(iSim, 1) = results.sat_perf(4); % L2
        matSat(iSim, 2) = results.sat_perf(5); % P2
        matSat(iSim, 3) = results.sat_perf(6); % X2
        matSat(iSim, 4) = results.sat_perf(1); % F2
        matSat(iSim, 5) = results.sat_perf(2); % F200
        matSat(iSim, 6) = results.sat_perf(3); % P100

    catch

        matITAE(iSim, 1) = 888888;
        matITAE(iSim, 2) = 888888;
        matITAE(iSim, 3) = 888888;
        matITAE(iSim, 4) = 888888;
        matITAE(iSim, 5) = 888888;
        matITAE(iSim, 6) = 888888;

        matSat(iSim, 1) = 888888;
        matSat(iSim, 2) = 888888;
        matSat(iSim, 3) = 888888; 
        matSat(iSim, 4) = 888888; 
        matSat(iSim, 5) = 888888; 
        matSat(iSim, 6) = 888888; 

    end
    

end

xlswrite(perfIndicesOutPath, matITAE, 1)
xlswrite(perfIndicesOutPath, matSat, 2)
