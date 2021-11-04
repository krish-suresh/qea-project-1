% Uses PCA to create a "songspace"
%
% PARAMS: trainData = the training dataset
% Return: V = the principle eigenvectors that represent the songSpace (the
%                                                            'eigensongs')

function V = getSongSpace(trainData)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Get data into workable format
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Turn training data into column vectors
    n = 100;
    trainVectors = songToVector(trainData, 100); %NOTE: this is psuedocode
   
    %NOTE: trainCompressed now is a matrix whose column-vectors each represent
    %one song in terms of it's most prevelant frequencies
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Use PCA to create "songSpace"
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Find principle eigenvectors of covariance matrix of training data
    R = cov(trainVectors'); %note transpose
    dimensions = 10; %number of eigensongs to define songSpace with
    [V, D] = eigs(R, dimensions);
    
    % V now contains the principle eigenvectors (eigensongs) that define
    % the songSpace
end