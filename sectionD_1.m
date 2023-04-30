clear
clc

%%  load data
load('F0_PVT.mat');

data_acrylic = [PVT_acrylic.pressure; PVT_acrylic.vibration; PVT_acrylic.temperature];
data_black_foam = [PVT_black_foam.pressure; PVT_black_foam.vibration; PVT_black_foam.temperature];
data_car_sponge = [PVT_car_sponge.pressure; PVT_car_sponge.vibration; PVT_car_sponge.temperature];
data_flour_sack = [PVT_flour_sack.pressure; PVT_flour_sack.vibration; PVT_flour_sack.temperature];
data_kitchen_sponge = [PVT_kitchen_sponge.pressure; PVT_kitchen_sponge.vibration; ...
    PVT_kitchen_sponge.temperature];
data_steel_vase = [PVT_steel_vase.pressure; PVT_steel_vase.vibration; PVT_steel_vase.temperature];

[data_merged, standerdlised_acrylic,standerdlised_black_foam,standerdlised_car_sponge, ...
    standerdlised_flour_sack,standerdlised_kitchen_sponge,standerdlised_steel_vase] = ... 
    standardizing(data_acrylic,data_black_foam,data_car_sponge,data_flour_sack, ...
    data_kitchen_sponge,data_steel_vase);

% plot the original data
figure
acrylic = scatter3(standerdlised_acrylic(1,:), standerdlised_acrylic(2,:), ...
    standerdlised_acrylic(3,:),30,[0.5 0.5 0.5],'filled');
hold on
black_foam = scatter3(standerdlised_black_foam(1,:), standerdlised_black_foam(2,:), ...
    standerdlised_black_foam(3,:),30,[1 0 0.5],'filled');
car_sponge = scatter3(standerdlised_car_sponge(1,:), standerdlised_car_sponge(2,:), ...
    standerdlised_car_sponge(3,:),30,[0 0 0],'filled');
flour_sack = scatter3(standerdlised_flour_sack(1,:), standerdlised_flour_sack(2,:), ...
    standerdlised_flour_sack(3,:),30,[1 0.5 1],'filled');
kitchen_sponge = scatter3(standerdlised_kitchen_sponge(1,:), standerdlised_kitchen_sponge(2,:), ...
    standerdlised_kitchen_sponge(3,:),30,[0 1 0.5],'filled');
steel_vase = scatter3(standerdlised_steel_vase(1,:), standerdlised_steel_vase(2,:), ...
    standerdlised_steel_vase(3,:),30,[0.25 1 1],'filled');
hold off
% axis equal;
xlabel Pressure;
ylabel Vibration;
zlabel Temperature;
title('The original standerdized data');
legend([acrylic black_foam car_sponge flour_sack kitchen_sponge steel_vase], ...
    {'acrylic', 'black foam', 'car sponge', 'flour sack', 'kitchen sponge', ...
    'steel vase'});
%%  Hierarchical Clustering
species = { 'acrylic';'acrylic';'acrylic';'acrylic';'acrylic';'acrylic';...
            'acrylic';'acrylic';'acrylic';'acrylic';...
            'black foam';'black foam';'black foam';'black foam';'black foam';...
            'black foam';'black foam';'black foam';'black foam';'black foam';
            'car sponge';'car sponge';'car sponge';'car sponge';'car sponge';...
            'car sponge';'car sponge';'car sponge';'car sponge';'car sponge';...
            'flour sack';'flour sack';'flour sack';'flour sack';'flour sack';...
            'flour sack';'flour sack';'flour sack';'flour sack';'flour sack';...
            'kitchen sponge';'kitchen sponge';'kitchen sponge';'kitchen sponge';'kitchen sponge';...
            'kitchen sponge';'kitchen sponge';'kitchen sponge';'kitchen sponge';'kitchen sponge';...
            'steel vase';'steel vase';'steel vase';'steel vase';'steel vase';...
            'steel vase';'steel vase';'steel vase';'steel vase';'steel vase'};
tree = linkage(data_merged','complete');
distance = pdist(data_merged','euclidean');
classification = optimalleaforder(tree, distance);

figure
[H,T,outperm] = dendrogram(tree,60,'Reorder',classification,'Labels',species);
xlabel('Type');
ylabel('Euclidean Distance');

% changed distance matrix
distance = pdist(data_merged','cityblock');
classification = optimalleaforder(tree, distance);
figure
[H2,T2,outperm2] = dendrogram(tree,60,'Reorder',classification,'Labels',species);
xlabel('Type');
ylabel('Manhattan Distance');
%%  Comment
%   The soft and tough object can be distinguished, but detailed clustering
%   is not that accurate. 
