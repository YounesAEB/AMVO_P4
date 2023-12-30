function [globalGrid,globalGrid_polar] = computeGlobalGrid()


globalGrid_polar = zeros(180+1,360+1,3);
for i=1:180+1
    for j=1:360+1
        globalGrid_polar(i,j,1) = 6371*10^3;       % Earth radius
        globalGrid_polar(i,j,2) = 89.5 - (i-1);  % Latitude
        globalGrid_polar(i,j,3) =-179.5 + (j-1); % Longitude
    end
end


globalGrid_polar(:,:,2) = deg2rad(globalGrid_polar(:,:,2));
globalGrid_polar(:,:,3) = deg2rad(globalGrid_polar(:,:,3));

% Coordinate change from polar to cartesian earth centered
globalGrid(:,:,1) = globalGrid_polar(:,:,1).*cos(globalGrid_polar(:,:,2)).*cos(globalGrid_polar(:,:,3));
globalGrid(:,:,2) = globalGrid_polar(:,:,1).*cos(globalGrid_polar(:,:,2)).*sin(globalGrid_polar(:,:,3));
globalGrid(:,:,3) = globalGrid_polar(:,:,1).*sin(globalGrid_polar(:,:,2));

end