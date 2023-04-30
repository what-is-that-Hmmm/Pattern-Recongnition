function plotting_PVTE(t, data_struct, name)
% This function plots the pressure, vibration, temperature, and Electrodes
% readings from finger 0. 

figure;
subplot(4,1,1);
plot(t, data_struct.F0pdc, 'b');
title('Pressure feature for ', name);
subplot(4,1,2);
plot(t, data_struct.F0pac(2,:), 'b');
title('Vibration feature for ', name);
subplot(4,1,3);
plot(t, data_struct.F0tdc, 'b');
title('Temperature feature for ', name);
subplot(4,1,4);
plot(t, data_struct.F0Electrodes(1,:), 'b-');
hold on
plot(t, data_struct.F0Electrodes(2,:), 'm-');
plot(t, data_struct.F0Electrodes(3,:), 'c-');
plot(t, data_struct.F0Electrodes(4,:), 'y-');
plot(t, data_struct.F0Electrodes(5,:), 'r-');
plot(t, data_struct.F0Electrodes(6,:), 'g-');
plot(t, data_struct.F0Electrodes(7,:), 'k-');
plot(t, data_struct.F0Electrodes(8,:), 'b:');
plot(t, data_struct.F0Electrodes(9,:), 'm:');
plot(t, data_struct.F0Electrodes(10,:), 'c:');
plot(t, data_struct.F0Electrodes(11,:), 'y:');
plot(t, data_struct.F0Electrodes(12,:), 'r:');
plot(t, data_struct.F0Electrodes(13,:), 'g:');
plot(t, data_struct.F0Electrodes(14,:), 'k:');
plot(t, data_struct.F0Electrodes(15,:), 'b-.');
plot(t, data_struct.F0Electrodes(16,:), 'm-.');
plot(t, data_struct.F0Electrodes(17,:), 'r-.');
plot(t, data_struct.F0Electrodes(18,:), 'g-.');
plot(t, data_struct.F0Electrodes(19,:), 'r-.');
hold off
title('Electrodes feature for ', name);
end

