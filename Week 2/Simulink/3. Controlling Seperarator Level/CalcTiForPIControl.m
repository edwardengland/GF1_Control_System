Kp = 14
Ti = 1

sysPI = tf([Kp*Ti, Kp] , [Ti, 0])

bode(sysPI)

% find Ti such that phase LAG of controller is 5 degrees.
% When combined with plant (which has been designed with lag of 45 degrees)
% the overall phase become 45-5 = 40 degrees, which is our overall design
% target.
% 
% We must use the Bode plot for the isolated PI controller and tweak Ti
% to get the desired phase lag at the crossover frequency from the earlier
% section of controller design, in this case 0.6 rad s^-1.
% (NB: other groups seemed to use 0.8 rad s^-1?)

% Can be done graphically with Bode plot, alternatively, substitute s=jw
% into transfer function and find complex angle.