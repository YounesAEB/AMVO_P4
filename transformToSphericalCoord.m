function spherCoordECEF = transformToSphericalCoord(coordECEF)
% Spherical geocentric coordinates in the form [radius,latitude,longitude]
spherCoordECEF = zeros(size(coordECEF,1),3,4);

% Coordinate change from cartesian to spherical earth centered
for i=1:size(coordECEF,1)
    spherCoordECEF(i,:,1) = [norm(coordECEF(i,:,1)),180/pi*atan2(coordECEF(i,3,1),...
        sqrt(coordECEF(i,1,1)^2+coordECEF(i,2,1)^2)),180/pi*atan2(coordECEF(i,2,1),coordECEF(i,1,1))];
    spherCoordECEF(i,:,2) = [norm(coordECEF(i,:,2)),180/pi*atan2(coordECEF(i,3,2),...
        sqrt(coordECEF(i,1,2)^2+coordECEF(i,2,2)^2)),180/pi*atan2(coordECEF(i,2,2),coordECEF(i,1,2))];
    spherCoordECEF(i,:,3) = [norm(coordECEF(i,:,3)),180/pi*atan2(coordECEF(i,3,3),...
        sqrt(coordECEF(i,1,3)^2+coordECEF(i,2,3)^2)),180/pi*atan2(coordECEF(i,2,3),coordECEF(i,1,3))];
    spherCoordECEF(i,:,4) = [norm(coordECEF(i,:,4)),180/pi*atan2(coordECEF(i,3,4),...
        sqrt(coordECEF(i,1,4)^2+coordECEF(i,2,4)^2)),180/pi*atan2(coordECEF(i,2,4),coordECEF(i,1,4))];
end
end