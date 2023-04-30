function [datapoints] = sample_Electrodes(dataset1, dataset2, dataset3, dataset4, ...
    dataset5, dataset6, dataset7, dataset8, dataset9, dataset10)
%   This function is for taking the final values of electrodes
index = 800;
datapoints.ELEC = zeros(19,10);
% Data structure:
%   each raw represents the data from a specific electrode.
%   each colum represents a trial. 

for i = 1:19 
    datapoints.ELEC(i,1) = dataset1.F0Electrodes(i,index);
    datapoints.ELEC(i,2) = dataset2.F0Electrodes(i,index);
    datapoints.ELEC(i,3) = dataset3.F0Electrodes(i,index);
    datapoints.ELEC(i,4) = dataset4.F0Electrodes(i,index);
    datapoints.ELEC(i,5) = dataset5.F0Electrodes(i,index);
    datapoints.ELEC(i,6) = dataset6.F0Electrodes(i,index);
    datapoints.ELEC(i,7) = dataset7.F0Electrodes(i,index);
    datapoints.ELEC(i,8) = dataset8.F0Electrodes(i,index);
    datapoints.ELEC(i,9) = dataset9.F0Electrodes(i,index);
    datapoints.ELEC(i,10) = dataset10.F0Electrodes(i,index);
end

end

