function [elevation] = computeElevation(pointVector,satelliteVector)
% Compute the elevation angle between the two vectors
cosElevation = dot(satelliteVector, pointVector)/(norm(satelliteVector)*norm(pointVector));
elevation    = rad2deg(acos(cosElevation));
end