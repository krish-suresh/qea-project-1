T = readtable('fma_metadata/tracks.csv');
T1 = T(:,{'Var1', 'set_1','track_8'});
S = T1(ismember(T1.set_1,{'small'}), :);
S = S(randperm(size(S,1)), :);
G = zeros(size(S,1),1);
for i=1:size(S,1)
    a = split(S(i,:).track_8);
    G(i) = str2num(regexprep(a{1},'[^0-9.]',''));
end
S.genreID = G; 
writetable(S,'smallTracksShuffled.csv');