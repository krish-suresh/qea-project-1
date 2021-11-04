% Creates Genre "classes"
%
% PARAMS: trainGenre = the songSpace projected data for a group of songs
%                      all in the same genre
% Return: GAve      = the average songSpace vector representing the genre
%         threshold = the maximum distance a songSpace vector can be from
%                     GAve and still be considered part of the genre

function [GAve, threshold] = getGenreClass(trainGenre)
    % Create average genre vector
    GAve = sum(trainGenre,2) / length(trainGenre);
    
    % Compute distance of all songs in genre to GAve
    % set threshold to max distance of training song still in genre
    maxDistance = 0; %start as low as possible
    for index = 1:length(trainGenre)
        song = trainGenre(index);
        songDist = edist(song, GAve) %euclidian distance between song and GAve
        if songDist > maxDistance
            maxDistance = songDist;
        end
    end
    
    %set threshold for return
    threshold = maxDistance;
end