function results = evaluate(run_title, out)
    %consts
    signals = [out.F2, out.F200, out.P100, out.L2, out.P2, out.X2];
    signalnames = {'IP F2'; 'IP F200'; 'IP P100'; 'OP L2'; 'OP P2'; 'OP X2'};
    setpoints = [2, 208, 194.7, 1, 50.5, 25];
    
    %output file directory
    dir = [pwd, '/Simulink/Gain_Scheduling/Tests/', run_title];
    mkdir(dir);

    % step time
    trigger = 1000;

    perf = zeros(6, 1);
    for i = 1:6
        %select signal
        signal = signals(i);

        %plot and format
        if i <=3
            plot(signal.time-trigger, signal.data, 'Color', '#A2142F');
        else
            plot(signal.time-trigger, signal.data, 'Color', '#77AC30');
        end
        ylabel(signalnames{i});
        xlabel('t (min)');
        xlim([0 100]);
        grid on
        plot_title = [signalnames{i}, ' ', run_title];
        title(plot_title);

        plot_file = [dir, '/', plot_title, '.png'];
        saveas(gcf, plot_file);
        
        %calculate respective performance index
        if i <= 3
            perf(i) = evaluateinputperf(signal, trigger);
        else
            perf(i) = evaluateoutputperf(signal, trigger, setpoints(i));
        end
    end
    
    results = table(signalnames, perf);
    table_file = [dir, '/', run_title, '.txt'];
    writetable(results, table_file);
    workspace_file = [dir, '/', run_title];
    save(workspace_file, 'out');
end