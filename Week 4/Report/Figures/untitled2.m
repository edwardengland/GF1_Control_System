time = out.X2.time - 900;

X2 = out.X2.data / out.X2.data(end);

plot(time, X2)
hold on


xlim([0, 400])

xlabel('Time (mins)')
ylabel('X2, Normalised')
title('Step Time: 100 mins')

legend({'X2: 15%', 'X2: 25%', 'X2: 35%'})