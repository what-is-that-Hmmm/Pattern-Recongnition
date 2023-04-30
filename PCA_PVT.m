function [cov_matrix,eigenvalues,eigenvectors,new] = PCA_PVT(Data)
% This function is for conducting PCA on a 3D dataset. Particularly for PVT
% new for the projected data
Data2 = Data;
Data = zscore(Data');

cov_matrix = cov(Data);
          
[eigenvectors,eigenvalues] = eig(cov_matrix);

new = eigenvectors' * Data';

end

