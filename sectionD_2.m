clear
clc

%%  load data
load('F0_ELEC.mat');

data_acrylic = ELEC_acrylic.ELEC;
data_black_foam = ELEC_black_foam.ELEC;
data_car_sponge = ELEC_car_sponge.ELEC;
data_flour_sack = ELEC_flour_sack.ELEC;
data_kitchen_sponge = ELEC_kitchen_sponge.ELEC;
data_steel_vase = ELEC_steel_vase.ELEC;

std_data = std_elec(data_acrylic, data_black_foam, data_car_sponge, data_flour_sack, ...
        data_kitchen_sponge, data_steel_vase);
    
%%  PCA process
%   PC1, PC2, PC3 would store the most significant 3 principal values,
%   which are the new 3 components for coordinating. 
[cov_matrix,eigenvalues,eigenvectors,new] = PCA_ELEC(std_data);
[PC1,PC2,PC3] = plot_MS_3PCs(eigenvalues,new);

%%  Clustering
dataset = [PC1; PC2; PC3]';
labels = { 'acrylic';'acrylic';'acrylic';'acrylic';'acrylic';'acrylic';...
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
[a,b] = size(dataset);
train_p = 0.6; % ratio for spliting dataset
order = randperm(a);
train_dataset = dataset(order(1:round(train_p * a)),:);
test_dataset = dataset(order(round(train_p * a)+1:end),:);
train_labels = labels(order(1:round(train_p * a)),:);
test_labels = labels(order(round(train_p * a)+1:end),:);

tranning_time = 120;    % so far, 120 gives best result
Mdl = TreeBagger(tranning_time,train_dataset,train_labels,'OOBPrediction',...
    'On','Method','classification'); 
%   initial tree
view(Mdl.Trees{1},'Mode','graph');

% % plotting errors
figure
oobErrorBaggedEnsemble = oobError(Mdl);
plot(oobErrorBaggedEnsemble)
xlabel('Number of grown trees');
ylabel('Out-of-bag classification error');
% the final tree
view(Mdl.Trees{tranning_time},'Mode','graph');

%======================= Comment on increasing accuracy ===================
%   Too many training time would cause over fitting, which would reduce the
%   accuracy of classification. Therefore, the best way to increase the
%   performance of current program is to design an 'early stop' mechanism.
%==========================================================================

% calculating accuracy 
prediction = Mdl.predict(test_dataset);
confusion_matrix = confusionmat(test_labels,prediction);

figure
confusionchart(test_labels,prediction);

acc = sum(diag(confusion_matrix)) / sum(confusion_matrix(:))*100;
disp(['The accuracy of classification is ', num2str(acc),'%']);

