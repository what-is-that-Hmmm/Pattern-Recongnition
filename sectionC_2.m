%   This is a copy from the file 'sectionC_1.m'. This file is going to be
%   used for aother 2 objects

clear
clc

%%  Load data of PVT
load('F0_PVT.mat');

%%  Split Pressure vs Vibration - (a1)
PV_flour_sack = [PVT_flour_sack.pressure; PVT_flour_sack.vibration];
PV_steel_vase = [PVT_steel_vase.pressure; PVT_steel_vase.vibration];

figure
hold on 
[PV_merged,PV_mean,mean_1,mean_2,Plt_fs,Plt_sv] = data_prepare(PV_flour_sack,PV_steel_vase);

% LDA process
[feature_PV,LDA_ax] = LDA_PVT(PV_flour_sack, PV_steel_vase,2);

% projecting the original data
new = (PV_merged' * feature_PV)';
% plot the new data
Plt_fs = scatter(new(1,1:10), new(2,1:10), ...
    30,[1 0 0.5],'filled');
Plt_sv = scatter(new(1,11:20), new(2,11:20), ...
    30,[0 0 0],'filled');

k = (LDA_ax(1,2)/LDA_ax(1,1));
x = -2:1:2;
y = k*x;
liner = plot(x,y);
x = -4:1:4;
z = (-1/k)*x;
plot(x,z,'--');
mean1 = scatter(mean_1(1,1),mean_1(1,2),60,[1 0 0.5]);
mean2 = scatter(mean_2(1,1),mean_2(1,2),60,[0 0 0]);
general_mean = scatter(PV_mean(1,1),PV_mean(1,2),60,'blue');
legend([Plt_fs Plt_sv mean1 mean2 general_mean liner], {'flour sack', 'steel vase' 'mean for black foam', 'mean for car sponge', ...
    'overall mean' 'LDA'});
axis equal
hold off
title('Traning data and LDA plot for Pressure VS Vibration');

%%  Split Pressure vs Temperature - (a2)
PT_flour_sack = [PVT_flour_sack.pressure; PVT_flour_sack.temperature];
PT_steel_vase = [PVT_steel_vase.pressure; PVT_steel_vase.temperature];

figure
hold on 
[PT_merged,PT_mean,mean_1,mean_2,Plt_fs,Plt_sv] = data_prepare(PT_flour_sack,PT_steel_vase);

% LDA process
[feature_PT,LDA_ax] = LDA_PVT(PT_flour_sack, PT_steel_vase,2);

% projecting the original data
new = (PT_merged' * feature_PT)';
% plot the new data
Plt_fs = scatter(new(1,1:10), new(2,1:10), ...
    30,[1 0 0.5],'filled');
Plt_sv = scatter(new(1,11:20), new(2,11:20), ...
    30,[0 0 0],'filled');

k = (LDA_ax(1,2)/LDA_ax(1,1));
x = -6:1:6;
y = k*x;
liner = plot(x,y);
x = -5:1:5;
z = (-1/k)*x;
plot(x,z,'--');
mean1 = scatter(mean_1(1,1),mean_1(1,2),60,[1 0 0.5]);
mean2 = scatter(mean_2(1,1),mean_2(1,2),60,[0 0 0]);
general_mean = scatter(PT_mean(1,1),PT_mean(1,2),60,'blue');
legend([Plt_fs Plt_sv mean1 mean2 general_mean liner], {'flour sack', 'steel vase' 'mean for black foam', 'mean for car sponge', ...
    'overall mean' 'LDA'});
axis equal
hold off
title('Traning data and LDA plot for Pressure VS Temperatur');

%%  Split Temperature vs Vibration - (a3)
TV_flour_sack = [PVT_black_foam.temperature; PVT_black_foam.vibration];
TV_steel_vase = [PVT_car_sponge.temperature; PVT_car_sponge.vibration];

figure
hold on 
[TV_merged,TV_mean,mean_1,mean_2,Plt_fs,Plt_sv] = data_prepare(TV_flour_sack,TV_steel_vase);

% LDA process
[feature_TV,LDA_ax] = LDA_PVT(TV_flour_sack, TV_steel_vase,2);

% projecting the original data
new = (TV_merged' * feature_TV)';
% plot the new data
Plt_fs = scatter(new(1,1:10), new(2,1:10), ...
    30,[1 0 0.5],'filled');
Plt_sv = scatter(new(1,11:20), new(2,11:20), ...
    30,[0 0 0],'filled');

k = (LDA_ax(1,2)/LDA_ax(1,1));
x = -0.4:0.1:0.4;
y = k*x;
liner = plot(x,y);
x = -4:0.1:4;
z = (-1/k)*x;
plot(x,z,'--');
mean1 = scatter(mean_1(1,1),mean_1(1,2),60,[1 0 0.5]);
mean2 = scatter(mean_2(1,1),mean_2(1,2),60,[0 0 0]);
general_mean = scatter(TV_mean(1,1),TV_mean(1,2),60,'blue');
axis equal
legend([Plt_fs Plt_sv mean1 mean2 general_mean liner], {'flour sack', 'steel vase' 'mean for black foam', 'mean for car sponge', ...
    'overall mean' 'LDA'});
hold off
title('Traning data and LDA plot for Temperature VS Vibration');

%% conclusion for sub question a: 
%   These two objects are similar in PVT features, so can be barely
%   seperated in this way. 


%%  3D LDA to PVT data
pvt_fs = [PVT_flour_sack.pressure; PVT_flour_sack.vibration; PVT_flour_sack.temperature];
pvt_sv = [PVT_steel_vase.pressure; PVT_steel_vase.vibration; PVT_steel_vase.temperature];
merged_PVT = [pvt_fs, pvt_sv];

figure
hold on 

% find the mean of merged dataset
mean_P = mean(merged_PVT(1,:));
mean_V = mean(merged_PVT(2,:));
mean_T = mean(merged_PVT(3,:));

std_P = std(merged_PVT(1,:));
std_V = std(merged_PVT(2,:));
std_T = std(merged_PVT(3,:));

% standardised results
standardised.P = (merged_PVT(1,:) - mean_P)/std_P;
standardised.V = (merged_PVT(2,:) - mean_V)/std_V;
standardised.T = (merged_PVT(3,:) - mean_T)/std_T;
standardised.merged = [standardised.P; standardised.V; standardised.T];

Mean.P = mean(standardised.P);
Mean.bf_P = mean(standardised.P(1,1:10));
Mean.cs_P = mean(standardised.P(1,11:20));
Mean.V = mean(standardised.V);
Mean.bf_V = mean(standardised.V(1,1:10));
Mean.cs_V = mean(standardised.V(1,11:20));
Mean.T = mean(standardised.T);
Mean.bf_T = mean(standardised.T(1,1:10));
Mean.cs_T = mean(standardised.T(1,11:20));
Mean.bf = [Mean.bf_P; Mean.bf_V; Mean.bf_T];
Mean.cs = [Mean.cs_P; Mean.cs_V; Mean.cs_T];

% calculate scatter matrix
% S_w is the within class scatter matrix
PVT_S_w = (standardised.merged(:,1:10) - Mean.bf)*(standardised.merged(:,1:10) - Mean.bf)' ...
    + (standardised.merged(:,11:20) - Mean.cs)*(standardised.merged(:,11:20) - Mean.cs)';

% S_b is the between class scatter
PVT_S_b = (Mean.bf - Mean.cs)*(Mean.bf - Mean.cs)';

[eigenvector, eigenvalue] = eig((inv(PVT_S_w))*PVT_S_b);

% Finding the feature vector
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
eigenvector(:, col_max2) = []; 
eigenvalue(:, col_max2) = [];
feature_vector = [feature_vector, eigenvector];

new_PVT = (standardised.merged' * feature_vector)';
new_PVT = real(new_PVT);
grid on

% plot LDA results
Plt_fs = scatter3(new_PVT(1,1:10), new_PVT(2,1:10), new_PVT(3,1:10),...
    30,[1 0 0.5],'filled');
Plt_sv = scatter3(new_PVT(1,11:20), new_PVT(2,11:20), new_PVT(3,1:10),...
    30,[0 0 0],'filled');

X1 = [-feature_vector(1,1) feature_vector(1,1)]*2;
Y1 = [-feature_vector(2,1) feature_vector(2,1)]*2;
Z1 = [-feature_vector(3,1) feature_vector(3,1)]*2;
LDA1 = plot3(X1,Y1,Z1);
X2 = [-feature_vector(1,2) feature_vector(1,2)]*2;
Y2 = [-feature_vector(2,2) feature_vector(2,2)]*2;
Z2 = [-feature_vector(3,2) feature_vector(3,2)]*2;
LDA2 = plot3(X2,Y2,Z2);
plane = patch('XData',[-feature_vector(1,1:2)*10 feature_vector(1,1:2)*10], ...
    'YData',[-feature_vector(2,1:2)*10 feature_vector(2,1:2)*10], ...
    'ZData',[-feature_vector(3,1:2)*10 feature_vector(3,1:2)*10],'FaceAlpha',0.5);
legend([Plt_fs Plt_sv LDA1 LDA2 plane], {'flour sack', 'steel vase' 'LDA1' ...
    'LDA2' 'split plane'});
hold off
title('Plot of 3D LDA of Pressure, Vibration, Temperature');
