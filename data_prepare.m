function [data_merged,overal_mean,mean_1,mean_2,Plt_bf,Plt_cs] = data_prepare(input1,input2)
%   This function is particularly used for secion C.
%   In this function, preprocessing would be conducted

% standerdlisation
mean_P_bf = mean(input1(1,:));
mean_V_bf = mean(input1(2,:));

mean_P_cs = mean(input2(1,:));
mean_V_cs = mean(input2(2,:));
tot_mean_P = mean([mean_P_bf, mean_P_cs]);
tot_mean_V = mean([mean_V_bf, mean_V_cs]);

std_P_cs = std(input2(1,:));
std_P_bf = std(input1(1,:));

tot_std_P = std(input2(1,:),input1(1,:));

std_V_bf = std(input1(2,:));
std_V_cs = std(input2(2,:));
tot_std_V = std(input2(2,:),input1(2,:));

% standardised results
% standerdlised_bf(1,:) = (input1(1,:) - mean_P_bf)/std_P_bf;
% standerdlised_bf(2,:) = (input1(2,:) - mean_V_bf)/std_V_bf;
% standerdlised_cs(1,:) = (input2(1,:) - mean_P_cs)/std_P_cs;
% standerdlised_cs(2,:) = (input2(2,:) - mean_V_cs)/std_V_cs;
standerdlised_bf(1,:) = (input1(1,:) - tot_mean_P)/tot_std_P;
standerdlised_bf(2,:) = (input1(2,:) - tot_mean_V)/tot_std_V;
standerdlised_cs(1,:) = (input2(1,:) - tot_mean_P)/tot_std_P;
standerdlised_cs(2,:) = (input2(2,:) - tot_mean_V)/tot_std_V;

data_merged = [standerdlised_bf, standerdlised_cs];
overal_mean = [mean(data_merged(1,:)),mean(data_merged(2,:))];

% plot the original data
Plt_bf = scatter(standerdlised_bf(1,:), standerdlised_bf(2,:), ...
    30,[1 0 0.5],'filled');
Plt_cs = scatter(standerdlised_cs(1,:), standerdlised_cs(2,:), ...
    30,[0 0 0],'filled');
mean_1 = mean((standerdlised_bf')); %[mean(standerdlised_PVbf(1,:));mean(standerdlised_PVbf(2,:))];
mean_2 = mean((standerdlised_cs')); %[mean(standerdlised_PVcs(1,:));mean(standerdlised_PVcs(2,:))];

end

