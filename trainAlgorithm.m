% The Big'ole overarching function that does the whole shebang 
% this doc comment is no longer even accurate because the scope of this
% function has grown out of it's original intented purpose
%
% PARAMS: trainData = the training dataset
% Return: the algorithm vector X

function res = trainAlgorithm(trainData)
    %%%%%%%%%%%%%%%%%%
    % Create SongSpace
    %%%%%%%%%%%%%%%%%%
    
    % get principle eigensongs
    V = getSongSpace(trainData)
    
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
    
    % Matrix of each average genre vector
    numGenres      = %the number of genres that are "known", should be 
                        %equal to length(genreAveMatrix)
    genreAveMatrix = [G2Ave, G1Ave, %etc.] %NOTE: This is psudocode
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Identify Genre of unknown song
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Get test song
    testSongFreqs = songToVector(testSong);
    test_song = V' * testSongFreqs;
    
    % Calculate distance to closest genre
    closestDist = intmax; %start as large as possible
    for index = 1:numGenres
        GenreAve = genreAveMatrix(index);
        distToGenre = edist(
    
end