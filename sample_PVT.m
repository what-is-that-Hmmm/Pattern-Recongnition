function [datapoints] = sample_PVT(dataset1, dataset2, dataset3, dataset4, ...
    dataset5, dataset6, dataset7, dataset8, dataset9, dataset10)
%   This function is for taking the final values of pressure, vibrations
%   and temperatures 
index = 800;

% recording pressure data
datapoints.pressure = zeros(1,10);      % initialise for recording pressure
datapoints.pressure(1,1) = dataset1.F0pdc(index);
datapoints.pressure(1,2) = dataset2.F0pdc(index);
datapoints.pressure(1,3) = dataset3.F0pdc(index);
datapoints.pressure(1,4) = dataset4.F0pdc(index);
datapoints.pressure(1,5) = dataset5.F0pdc(index);
datapoints.pressure(1,6) = dataset6.F0pdc(index);
datapoints.pressure(1,7) = dataset7.F0pdc(index);
datapoints.pressure(1,8) = dataset8.F0pdc(index);
datapoints.pressure(1,9) = dataset9.F0pdc(index);
datapoints.pressure(1,10) = dataset10.F0pdc(index);

% recording vibration data
datapoints.vibration = zeros(1,10);     % initialise for recording vibration
datapoints.vibration(1,1) = dataset1.F0pac(2,index);
datapoints.vibration(1,2) = dataset2.F0pac(2,index);
datapoints.vibration(1,3) = dataset3.F0pac(2,index);
datapoints.vibration(1,4) = dataset4.F0pac(2,index);
datapoints.vibration(1,5) = dataset5.F0pac(2,index);
datapoints.vibration(1,6) = dataset6.F0pac(2,index);
datapoints.vibration(1,7) = dataset7.F0pac(2,index);
datapoints.vibration(1,8) = dataset8.F0pac(2,index);
datapoints.vibration(1,9) = dataset9.F0pac(2,index);
datapoints.vibration(1,10) = dataset10.F0pac(2,index);

% recording temperature data
datapoints.temperature = zeros(1,10);     % initialise for recording temperature
datapoints.temperature(1,1) = dataset1.F0tdc(index);
datapoints.temperature(1,2) = dataset2.F0tdc(index);
datapoints.temperature(1,3) = dataset3.F0tdc(index);
datapoints.temperature(1,4) = dataset4.F0tdc(index);
datapoints.temperature(1,5) = dataset5.F0tdc(index);
datapoints.temperature(1,6) = dataset6.F0tdc(index);
datapoints.temperature(1,7) = dataset7.F0tdc(index);
datapoints.temperature(1,8) = dataset8.F0tdc(index);
datapoints.temperature(1,9) = dataset9.F0tdc(index);
datapoints.temperature(1,10) = dataset10.F0tdc(index);

end

