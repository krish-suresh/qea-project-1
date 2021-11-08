% Identifies the genre of an unknown song using the eigensongs algorithm
%
% PARAMS: testSongFilename = the filename of the song to identify the genre
%         of
% RETURN: the index of the genre the song is a member of

function res = identifyGenre(testSongFilename)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Identify Genre of unknown song
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Get test song
    testSongFreqs = songToVector(testSongFilename);
    test_song = V' * testSongFreqs;
    
    % Calculate distance to closest genre
    closestDist  = intmax; %start as large as possible
    closestIndex = -1; %set to -1 to throw error if not changed
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