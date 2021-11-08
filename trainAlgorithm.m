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
    
    % use for loops to load songs 1 at a time and turn into frequency
    % vectors
    num_freqs = 100; %number of frequencies to use for frequency vectors
    
    % NOTE: I used 1 for loop for each genre
  
    %Genre 1
    genre1Filenames = trainFilenames(1);
    for index = 1:length(genre1Filenames)
        trainFreqVector = songToVector(genre1Filenames(index), num_freqs);
        trainG1(index) = trainFreqVector; %add new song vector to train data
    end
    
    %Genre 2
    genre2Filenames = trainFilenames(2);
    for index = 1:length(genre2Filenames)
        trainFreqVector = songToVector(genre2Filenames(index), num_freqs);
        trainG2(index) = trainFreqVector; %add new song vector to train data
    end
    
    %Genre 3
    genre3Filenames = trainFilenames(3);
    for index = 1:length(genre3Filenames)
        trainFreqVector = songToVector(genre3Filenames(index), num_freqs);
        trainG3(index) = trainFreqVector; %add new song vector to train data
    end
    
    %Genre 4
    genre4Filenames = trainFilenames(4);
    for index = 1:length(genre4Filenames)
        trainFreqVector = songToVector(genre4Filenames(index), num_freqs);
        trainG4(index) = trainFreqVector; %add new song vector to train data
    end
    
    %Genre 5
    genre5Filenames = trainFilenames(5);
    for index = 1:length(genre5Filenames)
        trainFreqVector = songToVector(genre5Filenames(index), num_freqs);
        trainG5(index) = trainFreqVector; %add new song vector to train data
    end
    
    %Genre 6
    genre6Filenames = trainFilenames(6);
    for index = 1:length(genre6Filenames)
        trainFreqVector = songToVector(genre6Filenames(index), num_freqs);
        trainG6(index) = trainFreqVector; %add new song vector to train data
    end
    
    %Genre 7
    genre7Filenames = trainFilenames(7);
    for index = 1:length(genre7Filenames)
        trainFreqVector = songToVector(genre7Filenames(index), num_freqs);
        trainG7(index) = trainFreqVector; %add new song vector to train data
    end
    
    %Genre 8
    genre8Filenames = trainFilenames(8);
    for index = 1:length(genre8Filenames)
        trainFreqVector = songToVector(genre8Filenames(index), num_freqs);
        trainG8(index) = trainFreqVector; %add new song vector to train data
    end
    
    %NOTE: trainGn now contains the frequenicy vectors for each
    % training song in genre n

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