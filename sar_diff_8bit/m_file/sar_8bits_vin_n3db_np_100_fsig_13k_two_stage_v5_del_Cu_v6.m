% Matlab M-file converted by [Custom WaveView] saved 23:35:04 Sun Aug 18 2019
TIME = [ 0.000E+00  1.000E-05  2.000E-05  3.000E-05  4.000E-05  5.000E-05  6.000E-05  7.000E-05  8.000E-05  9.000E-05  1.000E-04  1.100E-04  1.200E-04  1.300E-04  1.400E-04  1.500E-04  1.600E-04  1.700E-04  1.800E-04  1.900E-04  2.000E-04  2.100E-04  2.200E-04  2.300E-04  2.400E-04  2.500E-04  2.600E-04  2.700E-04  2.800E-04  2.900E-04  3.000E-04  3.100E-04  3.200E-04  3.300E-04  3.400E-04  3.500E-04  3.600E-04  3.700E-04  3.800E-04  3.900E-04  4.000E-04  4.100E-04  4.200E-04  4.300E-04  4.400E-04  4.500E-04  4.600E-04  4.700E-04  4.800E-04  4.900E-04  5.000E-04  5.100E-04  5.200E-04  5.300E-04  5.400E-04  5.500E-04  5.600E-04  5.700E-04  5.800E-04  5.900E-04  6.000E-04  6.100E-04  6.200E-04  6.300E-04  6.400E-04  6.500E-04  6.600E-04  6.700E-04  6.800E-04  6.900E-04  7.000E-04  7.100E-04  7.200E-04  7.300E-04  7.400E-04  7.500E-04  7.600E-04  7.700E-04  7.800E-04  7.900E-04  8.000E-04  8.100E-04  8.200E-04  8.300E-04  8.400E-04  8.500E-04  8.600E-04  8.700E-04  8.800E-04  8.900E-04  9.000E-04  9.100E-04  9.200E-04  9.300E-04  9.400E-04  9.500E-04  9.600E-04  9.700E-04  9.800E-04  9.900E-04  1.000E-03 ];
par__d_out__ = [ 9.961E-01  5.156E-01  7.617E-01  8.438E-01  7.070E-01  4.336E-01  2.031E-01  1.562E-01  3.203E-01  5.977E-01  8.125E-01  8.242E-01  6.328E-01  3.516E-01  1.641E-01  1.875E-01  4.023E-01  6.797E-01  8.398E-01  7.852E-01  5.469E-01  2.773E-01  1.484E-01  2.344E-01  4.883E-01  7.461E-01  8.477E-01  7.227E-01  4.570E-01  2.148E-01  1.523E-01  3.047E-01  5.781E-01  8.008E-01  8.320E-01  6.523E-01  3.711E-01  1.719E-01  1.758E-01  3.828E-01  6.602E-01  8.359E-01  7.969E-01  5.703E-01  2.930E-01  1.484E-01  2.227E-01  4.648E-01  7.305E-01  8.477E-01  7.383E-01  4.766E-01  2.305E-01  1.484E-01  2.852E-01  5.586E-01  7.891E-01  8.359E-01  6.719E-01  3.945E-01  1.797E-01  1.680E-01  3.594E-01  6.406E-01  8.281E-01  8.047E-01  5.898E-01  3.125E-01  1.523E-01  2.070E-01  4.453E-01  7.148E-01  8.438E-01  7.578E-01  5.039E-01  2.422E-01  1.445E-01  2.695E-01  5.352E-01  7.773E-01  8.398E-01  6.875E-01  4.141E-01  1.914E-01  1.602E-01  3.398E-01  6.211E-01  8.203E-01  8.164E-01  6.094E-01  3.320E-01  1.562E-01  1.953E-01  4.219E-01  6.992E-01  8.438E-01  7.695E-01  5.273E-01  2.617E-01  1.445E-01  2.539E-01 ];
v__clk__ = [ 0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00 ];
v__cmp_inp__ = [ 4.995E-04  5.003E-01  5.028E-01  5.022E-01  5.015E-01  5.026E-01  5.014E-01  5.007E-01  5.026E-01  5.029E-01  5.006E-01  5.017E-01  5.007E-01  5.016E-01  5.019E-01  5.003E-01  5.014E-01  5.010E-01  5.010E-01  5.006E-01  5.019E-01  5.016E-01  5.002E-01  5.023E-01  5.013E-01  5.020E-01  5.004E-01  5.025E-01  5.013E-01  5.019E-01  5.002E-01  5.001E-01  5.018E-01  5.015E-01  5.011E-01  5.008E-01  5.018E-01  5.018E-01  5.017E-01  5.006E-01  5.016E-01  5.001E-01  5.007E-01  5.005E-01  5.030E-01  5.021E-01  5.005E-01  5.027E-01  5.021E-01  5.007E-01  5.028E-01  5.029E-01  5.003E-01  5.010E-01  5.017E-01  5.002E-01  5.018E-01  5.025E-01  5.006E-01  5.003E-01  5.026E-01  5.014E-01  5.024E-01  5.016E-01  5.013E-01  5.029E-01  5.016E-01  5.022E-01  5.020E-01  5.026E-01  5.013E-01  5.014E-01  5.029E-01  5.009E-01  5.018E-01  5.025E-01  5.027E-01  5.006E-01  5.019E-01  5.011E-01  5.028E-01  5.030E-01  5.014E-01  5.017E-01  5.021E-01  5.022E-01  5.005E-01  5.014E-01  5.015E-01  5.026E-01  5.016E-01  5.031E-01  5.025E-01  5.027E-01  5.001E-01  5.011E-01  5.026E-01  5.003E-01  5.010E-01  5.025E-01  5.004E-01 ];
v__d_0__ = [ 1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00 ];
v__d_1__ = [ 1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14 ];
v__d_2__ = [ 1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14 ];
v__d_3__ = [ 1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14 ];
v__d_4__ = [ 1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14 ];
v__d_5__ = [ 1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14 ];
v__d_6__ = [ 1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E-14  1.000E+00  1.000E-14  1.000E+00  1.000E+00  1.000E-14  1.000E+00  1.000E-14  1.000E+00 ];
v__d_7__ = [ 1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E+00  1.000E+00  1.000E+00  1.000E+00  1.000E-14  1.000E-14  1.000E-14 ];
v__pdac__ = [ 1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14  1.000E-14 ];
v__psamp__ = [ 0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00  0.000E+00 ];
v__vinp__ = [ 5.000E-01  7.580E-01  8.533E-01  7.256E-01  4.556E-01  2.136E-01  1.523E-01  3.103E-01  5.880E-01  8.102E-01  8.366E-01  6.507E-01  3.697E-01  1.709E-01  1.797E-01  3.906E-01  6.705E-01  8.429E-01  7.989E-01  5.663E-01  2.919E-01  1.488E-01  2.273E-01  4.778E-01  7.423E-01  8.540E-01  7.423E-01  4.778E-01  2.273E-01  1.488E-01  2.919E-01  5.663E-01  7.989E-01  8.429E-01  6.705E-01  3.906E-01  1.797E-01  1.709E-01  3.697E-01  6.507E-01  8.366E-01  8.102E-01  5.880E-01  3.103E-01  1.523E-01  2.136E-01  4.556E-01  7.256E-01  8.533E-01  7.580E-01  5.000E-01  2.420E-01  1.467E-01  2.744E-01  5.444E-01  7.864E-01  8.477E-01  6.897E-01  4.120E-01  1.898E-01  1.634E-01  3.493E-01  6.303E-01  8.291E-01  8.203E-01  6.094E-01  3.295E-01  1.571E-01  2.011E-01  4.337E-01  7.081E-01  8.512E-01  7.727E-01  5.222E-01  2.577E-01  1.460E-01  2.577E-01  5.222E-01  7.727E-01  8.512E-01  7.081E-01  4.337E-01  2.011E-01  1.571E-01  3.295E-01  6.094E-01  8.203E-01  8.291E-01  6.303E-01  3.493E-01  1.634E-01  1.898E-01  4.120E-01  6.897E-01  8.477E-01  7.864E-01  5.444E-01  2.744E-01  1.467E-01  2.420E-01  5.000E-01 ];
