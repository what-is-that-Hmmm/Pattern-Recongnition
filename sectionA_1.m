clear
clc

%%  load data
%   include the data for steel vase and kitchen sponge
data_steel_vase = load("PR_CW_DATA_2021\steel_vase_702_09_HOLD.mat"); 
data_kitchen_sponge = load("PR_CW_DATA_2021\kitchen_sponge_114_09_HOLD.mat");
data_black_foam = load("PR_CW_DATA_2021\black_foam_110_09_HOLD.mat");
data_car_sponge = load("PR_CW_DATA_2021\car_sponge_101_09_HOLD.mat");
data_flour_sack = load("PR_CW_DATA_2021\flour_sack_410_08_HOLD.mat");
data_acrylic = load("PR_CW_DATA_2021\acrylic_211_09_HOLD.mat");
t = 1:1:1000;   % generate the time sequence for further plotting

%%  visualise the data
%   plot the steel vase, finger 0 only.
plotting_PVTE(t, data_steel_vase, 'steel vase');

%   plot the kitchen sponge, finger 0 only.
plotting_PVTE(t, data_kitchen_sponge, 'kitchen sponge');

%   plot the black foam, finger 0 only.
plotting_PVTE(t, data_black_foam, 'black foam');

%   plot the car sponge, finger 0 only.
plotting_PVTE(t, data_car_sponge, 'car sponge');

%   plot the flour sack, finger 0 only.
plotting_PVTE(t, data_flour_sack, 'flour sack');

%   plot the acrylic, finger 0 only.
plotting_PVTE(t, data_acrylic, 'acrylic');

%   According to the plots from the sub question 1 from section A, there
%   are two objects selected for further investigation:
%   1, flour sack;
%   2, steel vase;
%   The curves (plotted in sub question 1) are of the most significant
%   difference. 
