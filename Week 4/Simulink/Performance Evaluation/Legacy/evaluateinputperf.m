function perf = evaluateinputperf(signal, trigger)
t = [];
data = [];
ddata = [];

for i = 1:length(signal.time)
    if signal.time(i) > trigger
        if signal.time(i) < trigger + 50
            t(end+1) = signal.time(i) - trigger;
            data(end+1) = signal.data(i);
        end
    end
end

for i = 1:length(data)-1
    ddata(end+1) = (data(i) + data(i+1))/(t(i+1)-t(i));
    if ddata(end) > 10
        ddata(end) = 10;
    end
end
t(end) = [];

i = cumtrapz(t, t.*abs(ddata));
perf = i(end);
end