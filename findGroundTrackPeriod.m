function timeTaken = findGroundTrackPeriod(spherCoordECEF,time,nSat)

relativeTime    = time(:) - time(1);
orbitalPeriod   = 95400;
firstOrbitIndex = find(relativeTime == orbitalPeriod);
timeTaken       = zeros(nSat,1);

for j = 1 : nSat    
    longitude     = spherCoordECEF(:,3,j);
    firstOrbitLongitudes = (longitude(1:firstOrbitIndex));
    relativeLongitudes = zeros(size(firstOrbitLongitudes,1),1);
    for k = 1:size(firstOrbitLongitudes,1)
        if (firstOrbitLongitudes(1) < 0) && (firstOrbitLongitudes(k) < 0)
            relativeLongitudes(k) = firstOrbitLongitudes(k) + 360;
        else
            relativeLongitudes(k) = firstOrbitLongitudes(k);
        end
    end
    
    [~,goalIndex] = max(relativeLongitudes);
    goalLongitude = firstOrbitLongitudes(goalIndex);  
    initialTime = relativeTime(goalIndex);
    

    elegibleIndexes    = find(longitude(firstOrbitIndex+1:end) > goalLongitude-5);
    elegibleLongitude  = longitude(elegibleIndexes+firstOrbitIndex);
    elegibleTime       = relativeTime(elegibleIndexes+firstOrbitIndex);    
    i           = 1;
    periodicity = false;

    while periodicity == false
        if (elegibleLongitude(i) < goalLongitude)
            periodicity = true;
            timeTaken(j) = elegibleTime(i)-initialTime;
        else
            i = i+1;
        end
        if i == size(elegibleLongitude,1)+1
            periodicity = true;
            % disp('The ground track does not repeat itself in the given time window.');
            timeTaken(j) = -1;
        end
    end
end


end

