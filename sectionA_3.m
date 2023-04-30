clear
clc

%%  load the mat file for PVT
load('F0_PVT.mat');
load('F0_ELEC.mat');

%%  plot data points with different specific color.
%   Color table:
%   acrylic:        grey            [0.5 0.5 0.5]
%   black foam:     red             [1 0 0.5]
%   car sponge:     black           [0 0 0]
%   flour sack:     pink            [1 0.5 1]
%   kitchen sponge: green           [0 1 0.5]
%   steel vase:     light blue      [0.25 1 1]

acrylic = scatter3(PVT_acrylic.pressure, PVT_acrylic.vibration, PVT_acrylic.temperature...
    ,30,[0.5 0.5 0.5],'filled');
hold on
black_foam = scatter3(PVT_black_foam.pressure, PVT_black_foam.vibration, ...
    PVT_black_foam.temperature,30,[1 0 0.5],'filled');
car_sponge = scatter3(PVT_car_sponge.pressure, PVT_car_sponge.vibration, ...
    PVT_car_sponge.temperature,30,[0 0 0],'filled');
flour_sack = scatter3(PVT_flour_sack.pressure, PVT_flour_sack.vibration, ...
    PVT_flour_sack.temperature,30,[1 0.5 1],'filled');
kitchen_sponge = scatter3(PVT_kitchen_sponge.pressure, PVT_kitchen_sponge.vibration, ...
    PVT_kitchen_sponge.temperature,30,[0 1 0.5],'filled');
steel_vase = scatter3(PVT_steel_vase.pressure, PVT_steel_vase.vibration, ...
    PVT_steel_vase.temperature,30,[0.25 1 1],'filled');
hold off

%%  labeling
% axis equal;
xlabel Pressure;
ylabel Vibration;
zlabel Temperature;
legend([acrylic black_foam car_sponge flour_sack kitchen_sponge steel_vase], ...
    {'acrylic', 'black foam', 'car sponge', 'flour sack', 'kitchen sponge', ...
    'steel vase'});