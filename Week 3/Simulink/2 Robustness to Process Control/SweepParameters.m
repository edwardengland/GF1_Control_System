%% CONFIGURE
mdl = 'x2_1_Param_Sweep';
mdl = 'x2_2_Param_Sweep_w_Pulse'

% Input parameter values to sweep;
rhoA_sweep = 10:1:40; % 20
M_sweep = 15:1:25; % 20
UA2_sweep = 5:0.3:8; % 6.84

rhoA_sweep = 10:5:40; % 20
M_sweep = 15:2:25; % 20
UA2_sweep = 5:1:8; % 6.84


%% COMPUTE
% Setup sims for parallel computing
i = 1;
simData = struct();

for rhoA = rhoA_sweep
    for M = M_sweep
        for UA2 = UA2_sweep
            in(i) = Simulink.SimulationInput(mdl);
            in(i) = setBlockParameter(in(i), [mdl '/process/Evaporator/M_gain'], 'Gain', num2str(1/M));
            in(i) = setBlockParameter(in(i), [mdl '/process/Condenser/UA2_gain'], 'Gain', num2str(UA2));
            in(i) = setBlockParameter(in(i), [mdl '/process/Condenser/UA2_gain2'], 'Gain', num2str(UA2));
            in(i) = setBlockParameter(in(i), [mdl '/process/Seperator/rhoA_gain'], 'Gain', num2str(1/rhoA));
            
            simData(i).M = M;
            simData(i).rhoA = rhoA;
            simData(i).UA2 = UA2;

            i = i+1;
        end
    end
end

% run sims in parallel
out = parsim(in, 'ShowProgress', 'on');

%% Post-Processing

nSims = numel(out);

fig = figure()
sp1 = subplot(3, 1, 1)
hold on
sp2 = subplot(3, 1, 2)
hold on
sp3 = subplot(3, 1, 3)
hold on

% Collect data in array
for iSim = 1:nSims

    this_t = out(1, iSim).tout;
    this_X2 = out(1, iSim).yout{4}.Values.Data;
    this_P2 = out(1, iSim).yout{5}.Values.Data;
    this_L2 = out(1, iSim).yout{6}.Values.Data;

    simData(iSim).t = this_t;
    simData(iSim).X2 = this_X2;
    simData(iSim).P2 = this_P2;
    simData(iSim).L2 = this_L2;

    plot(sp1, this_t, this_L2)
    ylabel(sp1, 'L2')
    plot(sp2, this_t, this_P2)
    ylabel(sp2, 'P2')
    plot(sp3, this_t, this_X2)
    ylabel(sp3, 'X2')

end