figure()

setpoint = out.X2_SP.Data
param = out.X2.data
time = out.X2.Time


plot(time, param)
hold on
% plot(time, setpoint, '--')

% xlim([0, 400])

legend({'X2', 'X2 Set Point'})

xlabel('Time (mins)')
ylabel('X2 (%)')

L2_SP = out.L2_SP.Data/1
X2 = out.X2.data/25
L2 = out.L2.data/1
time = out.X2.Time

plot(time, L2_SP, '--', 'Color', 'r')
hold on
plot(time, L2, 'Color', 'r')
plot(time, X2, 'Color', 'b')

legend({'L2 Setpoint', 'L2', 'X2'})

xlabel('Time (mins)')
ylabel('Normalised Variable')

xlim([0, 400])