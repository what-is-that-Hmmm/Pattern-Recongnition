function [data_merged,standerdlised_1, standerdlised_2, standerdlised_3, ...
    standerdlised_4, standerdlised_5, standerdlised_6] = standardizing(input1, ...
    input2,input3,input4,input5,input6)
%
%   Detailed explanation goes here

% standerdlisation
mean_P_1 = mean(input1(1,:));
mean_V_1 = mean(input1(2,:));
mean_T_1 = mean(input1(3,:));

mean_P_2 = mean(input2(1,:));
mean_V_2 = mean(input2(2,:));
mean_T_2 = mean(input2(3,:));

mean_P_3 = mean(input3(1,:));
mean_V_3 = mean(input3(2,:));
mean_T_3 = mean(input3(3,:));

mean_P_4 = mean(input4(1,:));
mean_V_4 = mean(input4(2,:));
mean_T_4 = mean(input4(3,:));

mean_P_5 = mean(input5(1,:));
mean_V_5 = mean(input5(2,:));
mean_T_5 = mean(input5(3,:));

mean_P_6 = mean(input6(1,:));
mean_V_6 = mean(input6(2,:));
mean_T_6 = mean(input6(3,:));

tot_mean_P = mean([mean_P_1, mean_P_2, mean_P_3, mean_P_4, mean_P_5, mean_P_6]);
tot_mean_V = mean([mean_V_1, mean_V_2, mean_V_3, mean_V_4, mean_V_5, mean_V_6]);
tot_mean_T = mean([mean_T_1, mean_T_2, mean_T_3, mean_T_4, mean_T_5, mean_T_6]);

tot_std_P = std([input1(1,:),input2(1,:), input3(1,:), input4(1,:), input5(1,:), input6(1,:)]);
tot_std_V = std([input1(2,:),input2(2,:), input3(2,:), input4(2,:), input5(2,:), input6(2,:)]);
tot_std_T = std([input1(3,:),input2(3,:), input3(3,:), input4(3,:), input5(3,:), input6(3,:)]);

standerdlised_1(1,:) = (input1(1,:) - tot_mean_P)/tot_std_P;
standerdlised_1(2,:) = (input1(2,:) - tot_mean_V)/tot_std_V;
standerdlised_1(3,:) = (input1(3,:) - tot_mean_T)/tot_std_T;
standerdlised_2(1,:) = (input2(1,:) - tot_mean_P)/tot_std_P;
standerdlised_2(2,:) = (input2(2,:) - tot_mean_V)/tot_std_V;
standerdlised_2(3,:) = (input2(3,:) - tot_mean_T)/tot_std_T;
standerdlised_3(1,:) = (input3(1,:) - tot_mean_P)/tot_std_P;
standerdlised_3(2,:) = (input3(2,:) - tot_mean_V)/tot_std_V;
standerdlised_3(3,:) = (input3(3,:) - tot_mean_T)/tot_std_T;
standerdlised_4(1,:) = (input4(1,:) - tot_mean_P)/tot_std_P;
standerdlised_4(2,:) = (input4(2,:) - tot_mean_V)/tot_std_V;
standerdlised_4(3,:) = (input4(3,:) - tot_mean_T)/tot_std_T;
standerdlised_5(1,:) = (input5(1,:) - tot_mean_P)/tot_std_P;
standerdlised_5(2,:) = (input5(2,:) - tot_mean_V)/tot_std_V;
standerdlised_5(3,:) = (input5(3,:) - tot_mean_T)/tot_std_T;
standerdlised_6(1,:) = (input6(1,:) - tot_mean_P)/tot_std_P;
standerdlised_6(2,:) = (input6(2,:) - tot_mean_V)/tot_std_V;
standerdlised_6(3,:) = (input6(3,:) - tot_mean_T)/tot_std_T;

data_merged = [standerdlised_1, standerdlised_2, standerdlised_3, standerdlised_4, ...
    standerdlised_5, standerdlised_6];

end

