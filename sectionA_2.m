clear
clc

%%  load these two dataset 
% load acrylic
data_acrylic1 = load("PR_CW_DATA_2021\acrylic_211_01_HOLD.mat");
data_acrylic2 = load("PR_CW_DATA_2021\acrylic_211_02_HOLD.mat");
data_acrylic3 = load("PR_CW_DATA_2021\acrylic_211_03_HOLD.mat");
data_acrylic4 = load("PR_CW_DATA_2021\acrylic_211_04_HOLD.mat");
data_acrylic5 = load("PR_CW_DATA_2021\acrylic_211_05_HOLD.mat");
data_acrylic6 = load("PR_CW_DATA_2021\acrylic_211_06_HOLD.mat");
data_acrylic7 = load("PR_CW_DATA_2021\acrylic_211_07_HOLD.mat");
data_acrylic8 = load("PR_CW_DATA_2021\acrylic_211_08_HOLD.mat");
data_acrylic9 = load("PR_CW_DATA_2021\acrylic_211_09_HOLD.mat");
data_acrylic10 = load("PR_CW_DATA_2021\acrylic_211_10_HOLD.mat");

% load black foam
data_black_foam1 = load("PR_CW_DATA_2021\black_foam_110_01_HOLD.mat");
data_black_foam2 = load("PR_CW_DATA_2021\black_foam_110_02_HOLD.mat");
data_black_foam3 = load("PR_CW_DATA_2021\black_foam_110_03_HOLD.mat");
data_black_foam4 = load("PR_CW_DATA_2021\black_foam_110_04_HOLD.mat");
data_black_foam5 = load("PR_CW_DATA_2021\black_foam_110_05_HOLD.mat");
data_black_foam6 = load("PR_CW_DATA_2021\black_foam_110_06_HOLD.mat");
data_black_foam7 = load("PR_CW_DATA_2021\black_foam_110_07_HOLD.mat");
data_black_foam8 = load("PR_CW_DATA_2021\black_foam_110_08_HOLD.mat");
data_black_foam9 = load("PR_CW_DATA_2021\black_foam_110_09_HOLD.mat");
data_black_foam10 = load("PR_CW_DATA_2021\black_foam_110_10_HOLD.mat");

% load car sponge 
data_car_sponge1 = load("PR_CW_DATA_2021\car_sponge_101_01_HOLD.mat");
data_car_sponge2 = load("PR_CW_DATA_2021\car_sponge_101_02_HOLD.mat");
data_car_sponge3 = load("PR_CW_DATA_2021\car_sponge_101_03_HOLD.mat");
data_car_sponge4 = load("PR_CW_DATA_2021\car_sponge_101_04_HOLD.mat");
data_car_sponge5 = load("PR_CW_DATA_2021\car_sponge_101_05_HOLD.mat");
data_car_sponge6 = load("PR_CW_DATA_2021\car_sponge_101_06_HOLD.mat");
data_car_sponge7 = load("PR_CW_DATA_2021\car_sponge_101_07_HOLD.mat");
data_car_sponge8 = load("PR_CW_DATA_2021\car_sponge_101_08_HOLD.mat");
data_car_sponge9 = load("PR_CW_DATA_2021\car_sponge_101_09_HOLD.mat");
data_car_sponge10 = load("PR_CW_DATA_2021\car_sponge_101_10_HOLD.mat");

% load flour sack
data_flour_sack1 = load("PR_CW_DATA_2021\flour_sack_410_01_HOLD.mat");
data_flour_sack2 = load("PR_CW_DATA_2021\flour_sack_410_02_HOLD.mat");
data_flour_sack3 = load("PR_CW_DATA_2021\flour_sack_410_03_HOLD.mat");
data_flour_sack4 = load("PR_CW_DATA_2021\flour_sack_410_04_HOLD.mat");
data_flour_sack5 = load("PR_CW_DATA_2021\flour_sack_410_05_HOLD.mat");
data_flour_sack6 = load("PR_CW_DATA_2021\flour_sack_410_06_HOLD.mat");
data_flour_sack7 = load("PR_CW_DATA_2021\flour_sack_410_07_HOLD.mat");
data_flour_sack8 = load("PR_CW_DATA_2021\flour_sack_410_08_HOLD.mat");
data_flour_sack9 = load("PR_CW_DATA_2021\steel_vase_702_09_HOLD.mat"); 
data_flour_sack10 = load("PR_CW_DATA_2021\steel_vase_702_10_HOLD.mat"); 

% load kitchen sponge
data_kitchen_sponge1 = load("PR_CW_DATA_2021\kitchen_sponge_114_01_HOLD.mat");
data_kitchen_sponge2 = load("PR_CW_DATA_2021\kitchen_sponge_114_02_HOLD.mat");
data_kitchen_sponge3 = load("PR_CW_DATA_2021\kitchen_sponge_114_03_HOLD.mat");
data_kitchen_sponge4 = load("PR_CW_DATA_2021\kitchen_sponge_114_04_HOLD.mat");
data_kitchen_sponge5 = load("PR_CW_DATA_2021\kitchen_sponge_114_05_HOLD.mat");
data_kitchen_sponge6 = load("PR_CW_DATA_2021\kitchen_sponge_114_06_HOLD.mat");
data_kitchen_sponge7 = load("PR_CW_DATA_2021\kitchen_sponge_114_07_HOLD.mat");
data_kitchen_sponge8 = load("PR_CW_DATA_2021\kitchen_sponge_114_08_HOLD.mat");
data_kitchen_sponge9 = load("PR_CW_DATA_2021\kitchen_sponge_114_09_HOLD.mat");
data_kitchen_sponge10 = load("PR_CW_DATA_2021\kitchen_sponge_114_10_HOLD.mat");

% load steel vase
data_steel_vase1 = load("PR_CW_DATA_2021\steel_vase_702_01_HOLD.mat");
data_steel_vase2 = load("PR_CW_DATA_2021\steel_vase_702_02_HOLD.mat");
data_steel_vase3 = load("PR_CW_DATA_2021\steel_vase_702_03_HOLD.mat");
data_steel_vase4 = load("PR_CW_DATA_2021\steel_vase_702_04_HOLD.mat");
data_steel_vase5 = load("PR_CW_DATA_2021\steel_vase_702_05_HOLD.mat");
data_steel_vase6 = load("PR_CW_DATA_2021\steel_vase_702_06_HOLD.mat");
data_steel_vase7 = load("PR_CW_DATA_2021\steel_vase_702_07_HOLD.mat");
data_steel_vase8 = load("PR_CW_DATA_2021\steel_vase_702_08_HOLD.mat");
data_steel_vase9 = load("PR_CW_DATA_2021\steel_vase_702_09_HOLD.mat");
data_steel_vase10 = load("PR_CW_DATA_2021\steel_vase_702_10_HOLD.mat");

t = 1:1:1000;   % generate the time sequence for further plotting

%%  data point selection (F0)
%   By inspecting the plots from previous program, transient stages were
%   discovered in the beginnings of the curves plotted. Therefore, the
%   final data points in these two dataset would be selected. 


% sampling the data of acrylic
PVT_acrylic = sample_PVT(data_acrylic1,data_acrylic2,data_acrylic3,...
    data_acrylic4,data_acrylic5,data_acrylic6,data_acrylic7,...
    data_acrylic8,data_acrylic9,data_acrylic10);

ELEC_acrylic = sample_Electrodes(data_acrylic1,data_acrylic2,data_acrylic3,...
    data_acrylic4,data_acrylic5,data_acrylic6,data_acrylic7,...
    data_acrylic8,data_acrylic9,data_acrylic10);

% sampling the data of black foam
PVT_black_foam = sample_PVT(data_black_foam1,data_black_foam2,data_black_foam3,...
    data_black_foam4,data_black_foam5,data_black_foam6,data_black_foam7,...
    data_black_foam8,data_black_foam9,data_black_foam10);

ELEC_black_foam = sample_Electrodes(data_black_foam1,data_black_foam2,data_black_foam3,...
    data_black_foam4,data_black_foam5,data_black_foam6,data_black_foam7,...
    data_black_foam8,data_black_foam9,data_black_foam10);

% sampling the data of car sponge
PVT_car_sponge = sample_PVT(data_car_sponge1,data_car_sponge2,data_car_sponge3,...
    data_car_sponge4,data_car_sponge5,data_car_sponge6,data_car_sponge7,...
    data_car_sponge8,data_car_sponge9,data_car_sponge10);

ELEC_car_sponge = sample_Electrodes(data_car_sponge1,data_car_sponge2,data_car_sponge3,...
    data_car_sponge4,data_car_sponge5,data_car_sponge6,data_car_sponge7,...
    data_car_sponge8,data_car_sponge9,data_car_sponge10);

% sampling the data of flour sack
PVT_flour_sack = sample_PVT(data_flour_sack1,data_flour_sack2,data_flour_sack3,...
    data_flour_sack4,data_flour_sack5,data_flour_sack6,data_flour_sack7,...
    data_flour_sack8,data_flour_sack9,data_flour_sack10);

ELEC_flour_sack = sample_Electrodes(data_flour_sack1,data_flour_sack2,data_flour_sack3,...
    data_flour_sack4,data_flour_sack5,data_flour_sack6,data_flour_sack7,...
    data_flour_sack8,data_flour_sack9,data_flour_sack10);


% sampling the data of kitchen sponge
PVT_kitchen_sponge = sample_PVT(data_kitchen_sponge1,data_kitchen_sponge2,data_kitchen_sponge3,...
    data_kitchen_sponge4,data_kitchen_sponge5,data_kitchen_sponge6,data_kitchen_sponge7,...
    data_kitchen_sponge8,data_kitchen_sponge9,data_kitchen_sponge10);

ELEC_kitchen_sponge = sample_Electrodes(data_kitchen_sponge1,data_kitchen_sponge2,data_kitchen_sponge3,...
    data_kitchen_sponge4,data_kitchen_sponge5,data_kitchen_sponge6,data_kitchen_sponge7,...
    data_kitchen_sponge8,data_kitchen_sponge9,data_kitchen_sponge10);

% sampling the data of steel vase
PVT_steel_vase = sample_PVT(data_steel_vase1,data_steel_vase2,data_steel_vase3,...
    data_steel_vase4,data_steel_vase5,data_steel_vase6,data_steel_vase7,...
    data_steel_vase8,data_steel_vase9,data_steel_vase10);

ELEC_steel_vase = sample_Electrodes(data_steel_vase1,data_steel_vase2,data_steel_vase3,...
    data_steel_vase4,data_steel_vase5,data_steel_vase6,data_steel_vase7,...
    data_steel_vase8,data_steel_vase9,data_steel_vase10);

%% Saving the data as MAT file
% F0_PVT for PVT parameters from finger 0
% F0_ELEC for electrodes parameters from finger 0

save('F0_PVT.mat', 'PVT_acrylic', 'PVT_black_foam', 'PVT_car_sponge', ...
    'PVT_flour_sack', 'PVT_kitchen_sponge', 'PVT_steel_vase');
save('F0_ELEC.mat', 'ELEC_acrylic', 'ELEC_black_foam', 'ELEC_car_sponge', ...
    'ELEC_flour_sack', 'ELEC_kitchen_sponge', 'ELEC_steel_vase');