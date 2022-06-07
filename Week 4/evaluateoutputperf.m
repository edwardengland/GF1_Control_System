function perf = evaluateoutputperf(signal, trigger, setpoint)
t = [];
data = [];

for i = 1:length(signal.time)
    if signal.time(i) > trigger
        if signal.time(i) < trigger + 50
            t(end+1) = signal.time(i) - trigger;
            data(end+1) = signal.data(i);
        end
    end
end

i = cumtrapz(t, t.*abs(data - setpoint)./setpoint);
perf = i(end);
end