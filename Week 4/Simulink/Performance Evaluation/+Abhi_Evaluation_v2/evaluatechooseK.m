function K_L = evaluatechooseK(code)
    switch code
        case 'A0' %   0: -0.5x3, -0.45x3
            K_L = 1.0e+03 * [
            -0.0000    0.0000   -0.0011   -0.0000    0.0000   -0.0004;
            -4.2105   -0.8234    0.1570   -1.4035   -0.2778    0.0561;
            -0.7895   -0.0039    0.0273   -0.2632   -0.0000    0.0105
            ];
        case 'A1' %   1: -0.5, -0.5e^ipi/4, -0.5e^-ipi/4, -0.75, -0.75e^ipi/4, -0.75e^-ipi/4   
            K_L = 1.0e+03 * [
           -0.0000    0.0000   -0.0005   -0.0000    0.0000   -0.0002;
           -3.4174   -0.5700    0.0664   -1.0252   -0.3076    0.0273;
           -0.6519   -0.0039    0.0105   -0.1956   -0.0000    0.0052;
           ];
        case 'A2' %   2: -1, -1e^ipi/4, -1e^-ipi/4, -1.5, -1.5e^ipi/4, -1.5e^-ipi/4 
            K_L = 1.0e+03 * [
           -0.0000    0.0000   -0.0011   -0.0000    0.0000   -0.0008;
           -6.8348   -1.1499    0.1437   -4.1009   -1.2303    0.1094;
           -1.3038   -0.0039    0.0252   -0.7823   -0.0000    0.0209;
           ];
        case 'A3' %   3: -0.25, -0.25e^ipi/4, -0.25e^-ipi/4, -0.375, -0.375e^ipi/4, -0.375e^-ipi/4 
            K_L = 1.0e+03 * [
           -0.0000    0.0000   -0.0003   -0.0000   -0.0000   -0.0001;
           -1.7087   -0.2305   -0.0202   -0.2563   -0.0487    0.0049;
           -0.3259   -0.0052    0.0053   -0.0489    0.0002    0.0020;
           ];
        case 'A4' %   4: -0.5, -0.5e^ipi/6, -0.5e^-ipi/6, -0.75, -0.75e^ipi/6, -0.75e^-ipi/6 
            K_L = 1.0e+03 * [
           -0.0000    0.0001   -0.0008   -0.0000   -0.0000   -0.0003;
           -3.4174   -0.5883    0.0342   -1.0252   -0.2012    0.0368;
           -0.6519   -0.0063    0.0185   -0.1956    0.0002    0.0079;
           ];
        case 'A5' %   5: -1.5x3, -1x3
            K_L = 1.0e+03 * [
           -0.0000    0.0000   -0.0019   -0.0000    0.0000   -0.0012;
           -6.8348   -1.3570    0.2625   -4.1009   -0.8202    0.1640;
           -1.3038   -0.0039    0.0479   -0.7823   -0.0000    0.0313;
           ];
        case 'A6' %   6: -0.5, -0.5e^ipi/4, -0.5e^-ipi/4, -0.45, -0.45e^ipi/4, -0.45e^-ipi/4 
            K_L = 1.0e+03 * [
           -0.0000    0.0000   -0.0004   -0.0000    0.0000   -0.0002;
           -2.5972   -0.3767    0.0587   -0.6151   -0.1367    0.0221;
           -0.4954   -0.0039    0.0090   -0.1173   -0.0000    0.0042;
           ];
        case 'A7' %   7: -0.35, -0.4, -0.45, -0.5, -0.55, -0.6
            K_L = 1.0e+03 * [
           -0.0000    0.0000   -0.0006   -0.0000    0.0000   -0.0001;
           -3.1440   -0.4548    0.0820   -0.9022   -0.0984    0.0191;
           -0.5997   -0.0039    0.0135   -0.1721   -0.0000    0.0037;
           ];
        case 'B1' % 1: -0.2115   -4.8648   -0.9460   -3.3356   -2.9322   -3.3756
            K_L = 1.0e+04 * [
           -0.0000    0.0000   -0.0003   -0.0000    0.0000   -0.0001;
           -1.7245   -0.3167    0.0377   -2.7060   -0.2516    0.0077;
           -0.3290   -0.0004    0.0070   -0.5162   -0.0000    0.0015;
           ];
        case 'B2' % 2: -3.9498   -1.5926   -2.6703   -0.4498   -0.5585   -0.6815
           K_L = 1.0e+03 * [
           -0.0000    0.0000   -0.0034   -0.0000    0.0000   -0.0014;
           -3.3901   -2.3209    0.4702   -1.0406   -2.3253    0.1943;
           -0.6467   -0.0039    0.0875   -0.1985   -0.0000    0.0371;
           ];
    end
end