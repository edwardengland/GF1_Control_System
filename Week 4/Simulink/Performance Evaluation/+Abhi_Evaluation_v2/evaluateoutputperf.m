function perf = evaluateoutputperf(t, data, setpoint)
    i = cumtrapz(t, t.*abs(data - setpoint)./setpoint);
    perf = i(end);
end