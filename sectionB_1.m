clear
clc

%%  load data
load('F0_PVT.mat');     % only PVT data needed for this part
% load('F0_ELEC.mat');


%%  merge the PVT data from different dataset
merged_PVT = [PVT_acrylic.pressure, PVT_black_foam.pressure, PVT_car_sponge.pressure, ...
    PVT_flour_sack.pressure, PVT_kitchen_sponge.pressure, PVT_steel_vase.pressure;...
    PVT_acrylic.vibration, PVT_black_foam.vibration, PVT_car_sponge.vibration, ...
    PVT_flour_sack.vibration, PVT_kitchen_sponge.vibration, PVT_steel_vase.vibration; ...
    PVT_acrylic.temperature, PVT_black_foam.temperature, PVT_car_sponge.temperature, ...
    PVT_flour_sack.temperature, PVT_kitchen_sponge.temperature, PVT_steel_vase.temperature]; 

[cov_matrix,eigenvalues,eigenvectors,new] = PCA_PVT(merged_PVT);

%%  plot the standerlised data with PCs - a & b
figure
standerlised_data = zscore(merged_PVT');     % standerlise the data
standerlised_data = standerlised_data';
acrylic = scatter3(standerlised_data(1,1:10), standerlised_data(2,1:10), standerlised_data(3,1:10), ...
    30,[0.5 0.5 0.5],'filled');
hold on
black_foam = scatter3(standerlised_data(1,11:20), standerlised_data(2,11:20), standerlised_data(3,11:20),...
    30,[1 0 0.5],'filled');
car_sponge = scatter3(standerlised_data(1,21:30), standerlised_data(2,21:30), standerlised_data(3,21:30),...
    30,[0 0 0],'filled');
flour_sack = scatter3(standerlised_data(1,31:40), standerlised_data(2,31:40), standerlised_data(3,31:40),...
    30,[1 0.5 1],'filled');
kitchen_sponge = scatter3(standerlised_data(1,41:50), standerlised_data(2,41:50), standerlised_data(3,41:50),...
    30,[0 1 0.5],'filled');
steel_vase = scatter3(standerlised_data(1,51:60), standerlised_data(2,51:60), standerlised_data(3,51:60),...
    30,[0.25 1 1],'filled');

% plot the new axis
for i=1:3
    quiver3(0, eigenvectors(i,1), eigenvectors(i,2), eigenvectors(i,3)); 
end
hold off
title('Scatter plot of the standerlised data with PCs');
legend([acrylic black_foam car_sponge flour_sack kitchen_sponge steel_vase], ...
    {'acrylic', 'black foam', 'car sponge', 'flour sack', 'kitchen sponge', ...
    'steel vase'});

%%  plot the data in 2D after PCA - c
% find the most significant 2 PCs
e_v = [1,1,1] * eigenvalues;
max1 = max(e_v,[],2);
temp_max = 0;
temp_min = max1+10;

% find the second largest value and corresponding location
for i=1:3
   if(max1 == e_v(1,i))
       max1_ax = i;     % find the 1st PC
   else
       if (e_v(1,i)>temp_max)
           temp_max = e_v(1,i);     % temperary maximal value
           temp_max_ax = i;         % temperary maximal value's location
       end
       if (e_v(1,i)<temp_min)
           temp_min = e_v(1,i);     % temperary minimal value
           temp_min_ax = i;         % temperary minimal value's location
       end
   end
end

figure
acrylic = scatter(new(max1_ax,1:10), new(temp_max_ax,1:10), ...
    30,[0.5 0.5 0.5],'filled');
hold on
black_foam = scatter(new(max1_ax,11:20), new(temp_max_ax,11:20), ...
    30,[1 0 0.5],'filled');
car_sponge = scatter(new(max1_ax,21:30), new(temp_max_ax,21:30), ...
    30,[0 0 0],'filled');
flour_sack = scatter(new(max1_ax,31:40), new(temp_max_ax,31:40), ...
    30,[1 0.5 1],'filled');
kitchen_sponge = scatter(new(max1_ax,41:50), new(temp_max_ax,41:50), ...
    30,[0 1 0.5],'filled');
steel_vase = scatter(new(max1_ax,51:60), new(temp_max_ax,51:60), ...
    30,[0.25 1 1],'filled');
hold off
title('Scatter plot of the new data (After PCA)');
legend([acrylic black_foam car_sponge flour_sack kitchen_sponge steel_vase], ...
    {'acrylic', 'black foam', 'car sponge', 'flour sack', 'kitchen sponge', ...
    'steel vase'});

%%  plot the data in three 1D lines - d
figure
acrylic1 = scatter(new(max1_ax,1:10), max1, ...
    30,[0.5 0.5 0.5],'filled');
hold on
black_foam1 = scatter(new(max1_ax,11:20), max1, ...
    30,[1 0 0.5],'filled');
car_sponge1 = scatter(new(max1_ax,21:30), max1, ...
    30,[0 0 0],'filled');
flour_sack1 = scatter(new(max1_ax,31:40), max1, ...
    30,[1 0.5 1],'filled');
kitchen_sponge1 = scatter(new(max1_ax,41:50), max1, ...
    30,[0 1 0.5],'filled');
steel_vase1 = scatter(new(max1_ax,51:60), max1, ...
    30,[0.25 1 1],'filled');

acrylic2 = scatter(new(temp_max_ax,1:10), temp_max, ...
    30,[0.5 0.5 0.5],'filled');
black_foam2 = scatter(new(temp_max_ax,11:20), temp_max, ...
    30,[1 0 0.5],'filled');
car_sponge2 = scatter(new(temp_max_ax,21:30), temp_max, ...
    30,[0 0 0],'filled');
flour_sack2 = scatter(new(temp_max_ax,31:40), temp_max, ...
    30,[1 0.5 1],'filled');
kitchen_sponge2 = scatter(new(temp_max_ax,41:50), temp_max, ...
    30,[0 1 0.5],'filled');
steel_vase2 = scatter(new(temp_max_ax,51:60), temp_max, ...
    30,[0.25 1 1],'filled');

acrylic3 = scatter(new(temp_min_ax,1:10), temp_min, ...
    30,[0.5 0.5 0.5],'filled');
black_foam3 = scatter(new(temp_min_ax,11:20), temp_min, ...
    30,[1 0 0.5],'filled');
car_sponge3 = scatter(new(temp_min_ax,21:30), temp_min, ...
    30,[0 0 0],'filled');
flour_sack3 = scatter(new(temp_min_ax,31:40), temp_min, ...
    30,[1 0.5 1],'filled');
kitchen_sponge3 = scatter(new(temp_min_ax,41:50), temp_min, ...
    30,[0 1 0.5],'filled');
steel_vase3 = scatter(new(temp_min_ax,51:60), temp_min, ...
    30,[0.25 1 1],'filled');
hold off
set(gca,'YTick',0:0.1:2)
title('Data distribution across all principal components');