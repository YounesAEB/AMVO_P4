function satESEIAAT = computeNumSatsESEIAAT(coordECEF)
satellitesOnSight = zeros(size(coordECEF,1),1); % Array for ESEIAAT location
coordESEIAAT = getESEIAATCoordinates();
for t=1:size(coordECEF,1)
satellitesOnSight(t,:) = computeSatellitesOnSight(t,coordESEIAAT(:,1),coordESEIAAT(:,2),coordESEIAAT(:,3),coordECEF);
end
satESEIAAT = satellitesOnSight;
end