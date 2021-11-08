% Uses PCA to create a "songspace"
%
% PARAMS: trainData = the training dataset
% Return: V = the principle eigenvectors that represent the songSpace (the
%                                                            'eigensongs')

function V = getSongSpace(trainData)
    %Find principle eigenvectors of covariance matrix of training data
    R = cov(trainVectors'); %note transpose
    dimensions = 10; %number of eigensongs to define songSpace with
    [V, D] = eigs(R, dimensions);
end