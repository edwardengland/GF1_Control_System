function results = evaluate(dir2, run_title, out, trigger, total)
    %consts
    signals = [out.F2, out.F200, out.P100, out.L2, out.P2, out.X2];
    signalnames = {'IP F2'; 'IP F200'; 'IP P100'; 'OP L2'; 'OP P2'; 'OP X2'};
    setpoints = [2, 208, 194.7, 1, 50.5, 25];
    
    %output file directory
    dir = [dir2, '/', run_title];
    mkdir(dir);

    perf = zeros(6, 1);
    sat_perf = zeros(6, 1);
    for i = 1:6
        %select signal
        signal = signals(i);

        %truncate to trigger
        t = [];
        data = [];

        for k = 1:length(signal.time)
            if signal.time(k) > trigger
                t(end+1) = signal.time(k) - trigger;
                data(end+1) = signal.data(k);
            end
        end
        
        %plot and format
        if i <=3
            plot(t, data, 'Color', '#A2142F');
        else
            plot(t, data, 'Color', '#77AC30');
        end
        ylabel(signalnames{i});
        xlabel('t (min)');
        xlim([0 total-trigger]);
        grid on
        plot_title = [signalnames{i}, ' ', run_title];
        title(strrep(plot_title, '_', '\_'));

        plot_file = [dir, '/', plot_title, '.png'];
        saveas(gcf, plot_file);
        
        %calculate respective performance index
        if i <= 3
            perf(i) = Abhi_Evaluation_v2.evaluateinputperf(t, data, setpoints(i));
        else
            perf(i) = Abhi_Evaluation_v2.evaluateoutputperf(t, data, setpoints(i));
        end
        sat_perf(i) = Abhi_Evaluation_v2.evaluatesat(t, data, setpoints(i));
    end
    
    results = table(signalnames, perf, sat_perf);
    table_file = [dir, '/', run_title, '.txt'];
    writetable(results, table_file);
    workspace_file = [dir, '/', run_title];
    save(workspace_file, 'out');
end