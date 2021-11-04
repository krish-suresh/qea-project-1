% Computes the Euclidean distance between two vectors
%
% PARAMS: U and V are column vectors of the same size
% RETURNS: the Euclidean distance between U and V
% AUTHOR: William Skelly

function res = edist(U, V)
    res = sqrt(sum((U - V).^2));
end