% Identifies a song as a member of a knwon genre or as a member of a new
% genre
%
% PARAMS: trainFilenames = a vector containing the filenames of all the
%                          training songs
% Return: V              = the matrix whows columns are the eigensongs
%                          genreAveMatrix = a matrix whose columns are the
%                          average genre vectors for each song
%         thresholds     = a vector containing the thresholds corresponding
%                          to the genres in genreAveMatrix

function [V, genreAveMatrix, thresholds] = trainAlgorithm(trainFilenames)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Get data into workable format
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Turn training data into column vectors
    n = 100;
    trainVectors = songToVector(trainData, 100); %NOTE: this is psuedocode
   
    %NOTE: trainCompressed now is a matrix whose column-vectors each represent
    %one song in terms of it's most prevelant frequencies

    %%%%%%%%%%%%%%%%%%
    % Create SongSpace
    %%%%%%%%%%%%%%%%%%
    
    % get principle eigensongs
    trainData = genre1Train, genre2Train %add training data
    V = getSongSpace(trainData);
    
    %Project training data onto V
    trainCompressed = V' * train_matrix;
    
    %%%%%%%%%%%%%%%%%%%%%
    % Create Genre classes
    %%%%%%%%%%%%%%%%%%%%%
    
    %Genre 1 (e.g. "jazz")
    [G1Ave, threshold1] = getGenreClass(trainG1);
    
    %Genre 2
    [G2Ave, threshold2] = getGenreClass(trainG2);
    
    % Etc. for each genre. Instead of numbers, genre names could be
    % incorperated into variable names
    
    % Matrices for each average genre vector and threshold
    numGenres      = %the number of genres that are "known", should be 
                        %equal to length(genreAveMatrix)
    genreAveMatrix = [G2Ave, G1Ave, %etc.] %NOTE: This is psudocode
    thresholds     = [threshold1, threshold2, %etc] %NOTE: This is psudocode
end