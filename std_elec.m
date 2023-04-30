function [standerdised] = std_elec(input1, input2,input3,input4,input5,input6)
%STANDARDIZING Summary of this function goes here
%   Detailed explanation goes here

% standerdlisation
% mean for data input
merged = [input1,input2,input3,input4,input5,input6];
mean_1 = mean([input1']);
mean_2 = mean([input2']);
mean_3 = mean([input3']);
mean_4 = mean([input4']);
mean_5 = mean([input5']);
mean_6 = mean([input6']);
% mean for electrodes
mean_elec = mean([merged'])';
% standard deviation
std_elec = std([merged'])';
% standerdised result
standerdised = (merged - mean_elec)./std_elec;

end

