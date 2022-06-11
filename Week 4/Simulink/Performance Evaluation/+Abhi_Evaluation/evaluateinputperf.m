function perf = evaluateinputperf(t, data, setpoint)
    ddata = [];
    
    for i = 1:length(data)-1
        ddata(end+1) = (data(i+1) - data(i))/(t(i+1)-t(i));
        if ddata(end) > 10
            ddata(end) = 10;
        end
    end
    t(end) = [];

    i = cumtrapz(t, t.*abs(ddata)/setpoint);
    perf = i(end);
end