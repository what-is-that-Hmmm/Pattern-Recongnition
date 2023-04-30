function [feature_vector, LDA_ax] = LDA_PVT(input1,input2,dim)
% LDA_PVT is for conducting linear discriminant analysis
% Each input includes two dimensions from P,V,T.

% standerdlisation
mean_P_bf = mean(input1(1,:));
mean_V_bf = mean(input1(2,:));

mean_P_cs = mean(input2(1,:));
mean_V_cs = mean(input2(2,:));

tot_mean_P = mean([mean_P_bf, mean_P_cs]);
tot_mean_V = mean([mean_V_bf, mean_V_cs]);

std_P_bf = std(input1(1,:));
std_V_bf = std(input1(2,:));
std_P_cs = std(input2(1,:));
std_V_cs = std(input2(2,:));
tot_std_P = std(input2(1,:),input1(1,:));
tot_std_V = std(input2(2,:),input1(2,:));

% standardised results
Data1(1,:) = (input1(1,:) - tot_mean_P)/tot_std_P;
Data1(2,:) = (input1(2,:) - tot_mean_V)/tot_std_V;
Data2(1,:) = (input2(1,:) - tot_mean_P)/tot_std_P;
Data2(2,:) = (input2(2,:) - tot_mean_V)/tot_std_V;
data_merged = [Data1, Data2];
overal_mean = [mean(data_merged(1,:)),mean(data_merged(2,:))];



% calculate group mean
mean_D11 = mean(Data1(:,1));    % mean of the first colum of input 1
mean_D12 = mean(Data1(:,2));    % mean of the second colum of input 1
mean_1 = [mean_D11; mean_D12];

mean_D21 = mean(Data2(:,1));    % mean of the first colum of input 2
mean_D22 = mean(Data2(:,2));    % mean of the second colum of input 2
mean_2 = [mean_D21; mean_D22];

% calculate scatter matrix
% S_w is the within class scatter matrix
S_w = (Data1 - mean_1)*(Data1 - mean_1)' + (Data2 - mean_2)*(Data2 - mean_2)';

% S_b is the between class scatter
S_b = (mean_1 - mean_2)*(mean_1 - mean_2)';

[eigenvector, eigenvalue] = eig((inv(S_w))*S_b);
% finding coordinates of the highest eigenvalue
[row_max, col_max] = find(eigenvalue == max(eigenvalue, [], 'all')); 
LDA_ax = eigenvector(col_max, :);
feature_vector = eigenvector(:, col_max); % registering feature vector component
% removing registered vector
eigenvector(:, col_max) = []; 
eigenvalue(:, col_max) = [];
% find the second largest eigenvalue
[row_max2, col_max2] = find(eigenvalue == max(eigenvalue, [], 'all'));
col_max2 = col_max2(1,1);

feature_vector = [feature_vector, eigenvector(:, col_max2)];

if(dim == 3)
    eigenvector(:, col_max2) = []; 
    eigenvalue(:, col_max2) = [];
    [row_max3, col_max3] = find(eigenvalue == max(eigenvalue, [], 'all'));
    col_max3 = col_max3(1,1);
    feature_vector = [feature_vector, eigenvector(:, col_max3)];
end
end

