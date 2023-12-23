function [total] = computeSatellitesOnSight(t,radius,latitude,longitude,X0,Y0,Z0,cartesian1,cartesian2,cartesian3,cartesian4)
% Compute local system

enuCoordinates1 = eciToEnu(cartesian1(t,:)-[X0,Y0,Z0],latitude,longitude);
enuCoordinates2 = eciToEnu(cartesian2(t,:)-[X0,Y0,Z0],latitude,longitude);
enuCoordinates3 = eciToEnu(cartesian3(t,:)-[X0,Y0,Z0],latitude,longitude);
enuCoordinates4 = eciToEnu(cartesian4(t,:)-[X0,Y0,Z0],latitude,longitude);

% earth = referenceSphere('Earth');
% [enuX1,enuY1,enuZ1] = ecef2enu(cartesian1(t,1),cartesian1(t,2),cartesian1(t,3),latitude,longitude,radius,earth,'radians');
% [enuX2,enuY2,enuZ2] = ecef2enu(cartesian2(t,1),cartesian2(t,2),cartesian2(t,3),latitude,longitude,radius,earth,'radians');
% [enuX3,enuY3,enuZ3] = ecef2enu(cartesian3(t,1),cartesian3(t,2),cartesian3(t,3),latitude,longitude,radius,earth,'radians');
% [enuX4,enuY4,enuZ4] = ecef2enu(cartesian4(t,1),cartesian4(t,2),cartesian4(t,3),latitude,longitude,radius,earth,'radians');
% enuCoordinates1 = [enuX1,enuY1,enuZ1];
% enuCoordinates2 = [enuX2,enuY2,enuZ2];
% enuCoordinates3 = [enuX3,enuY3,enuZ3];
% enuCoordinates4 = [enuX4,enuY4,enuZ4];
number1 = 0; number2 = 0; number3 = 0; number4 = 0;
upVector         = [X0,Y0,Z0]/...
                   norm([X0,Y0,Z0]);
satelliteVector1 = enuCoordinates1;
satelliteVector2 = enuCoordinates2;
satelliteVector3 = enuCoordinates3;
satelliteVector4 = enuCoordinates4;
elevation1       = computeElevation(upVector,satelliteVector1);
elevation2       = computeElevation(upVector,satelliteVector2);
elevation3       = computeElevation(upVector,satelliteVector3);
elevation4       = computeElevation(upVector,satelliteVector4);
if (elevation1)<=5
    number1 = 1;
end
if (elevation2)<=85
    number2 = 1;
end
if (elevation3)<=85
    number3 = 1;
end
if (elevation4)<=85
    number4 = 1;
end
total = number1;% + number2 + number3 + number4;
end