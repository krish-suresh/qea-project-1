% Identifies a song as a member of a knwon genre or as a member of a new
% genre
%
% PARAMS: testSong = the song to identify
% Return: the index of the genre the song belongs to, or "new genre" if
%         song does not belong to new genre

function res = trainAlgorithm(testSong)
    %%%%%%%%%%%%%%%%%%
    % Create SongSpace
    %%%%%%%%%%%%%%%%%%
    
    % get principle eigensongs
    trainData = %add training data
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
    
    % Matrices for each average genre vector and threshold
    numGenres      = %the number of genres that are "known", should be 
                        %equal to length(genreAveMatrix)
    genreAveMatrix = [G2Ave, G1Ave, %etc.] %NOTE: This is psudocode
    thresholds     = [threshold1, threshold2, %etc] %NOTE: This is psudocode
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Identify Genre of unknown song
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Get test song
    testSongFreqs = songToVector(testSong);
    test_song = V' * testSongFreqs;
    
    % Calculate distance to closest genre
    closestDist  = intmax; %start as large as possible
    closestIndex = -1 %set to -1 to throw error if not changed
    for index = 1:numGenres
        GenreAve = genreAveMatrix(index);
        distToGenre = edist(test_song, GenreAve);
        if distToGenre < closestDist
            closestDist  = distToGenre;
            closestIndex = index;
        end
    end
    
    % Check if member of genre and return
    if closestDist < thresholds(closestIndex)
        res = closestIndex %song has been recognized as part of genre 
                           % represented by closestIndex
    else
        res = "new genre"; %song is not part of a known genre
    
end