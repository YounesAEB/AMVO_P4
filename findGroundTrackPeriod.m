function timeTaken = findGroundTrackPeriod(spherCoordECEF,time)

orbitalPeriod   = 95400;
relativeTime    = time(:)-time(1);
longitude      = spherCoordECEF(:,3,2);

i = find(relativeTime==orbitalPeriod); %ignore first orbit
periodicity = false;


while periodicity == false
    if (longitude(i) < longitude(1)) && (longitude(i) > longitude(2))
        periodicity = true;
        timeTaken = relativeTime(i);
    else
        i = i+1;
    end
    if i == size(time,1)+1
        periodicity = true;
        disp('The ground track does not repeat itself in the given time window.');
        timeTaken = -1;
    end
end

end

