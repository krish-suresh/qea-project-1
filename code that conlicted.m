% Krishna's code under "Create Songspace get\n principle eigensongs" that
% conflicted

smallTracks = readtable('smallTracksShuffled.csv');
    numPCA = 20;
    numSongs = 30;
    trainData = zeros(numPCA, numSongs);
    for i=1:numSongs
        trainData(:,i) = songToVector(getTrackFilePathFromID(smallTracks(i,:).Var1),numPCA);
    end
    trainData = %add training data
    V = getSongSpace(trainData)