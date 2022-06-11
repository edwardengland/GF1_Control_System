function perf = evaluatesat(t, data, setpoint)
    sat_limit = 2*setpoint;

    sat = zeros(size(t));
    
    for i = 1:length(data)
        if abs(data(i) - sat_limit)/sat_limit < 0.025 || data(i)/setpoint < 0.025
            sat(i) = 1;
        end
    end

    i = cumtrapz(t, t.*sat);
    perf = i(end);
end