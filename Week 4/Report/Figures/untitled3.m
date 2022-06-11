X2 = 15:2.5:35;

Kp = fliplr([0.309, 0.294, 0.277, 0.257, 0.236, 0.211, 0.185, 0.156, 0.126]);

Kc = (0.257*4.774)./Kp;

figure()

sp1 = subplot(1, 2, 1)
sp2 = subplot(1, 2, 2)

scatter(sp1, X2, Kp, 'x', 'MarkerEdgeColor', 'k')
xlabel(sp1, 'X2 (%)')
ylabel(sp1, 'K_p')
title(sp1, 'Process Gain Variation with X2 Operating Point')
grid(sp1, 'on')
axis(sp1, 'square')

scatter(sp2, X2, Kc, 'x', 'MarkerEdgeColor', 'k')
xlabel(sp2, 'X2 (%)')
ylabel(sp2, 'K_p')
title('Required Controller Gain for each X2 Operating Point')
grid(sp2, 'on')
axis(sp2, 'square')
hold on
xlim(sp1, [12.5, 37.5])
xlim(sp2, [12.5, 37.5])


% REG1 = 1:3
% REG2 = 3:6
% REG3 = 6:9
% 
% [p, S] = polyfit(X2(REG1), Kc(REG1), 1);
% y1 = polyval(p, X2(REG1))
% 
% plot(X2(REG1), y1, 'Color', 'b')