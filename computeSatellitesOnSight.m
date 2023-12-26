function [numSatsOnSight] = computeSatellitesOnSight(t,X0,Y0,Z0,coordECEF)

number1 = 0; 
number2 = 0; 
number3 = 0; 
number4 = 0;

upVector          = [X0,Y0,Z0];
satelliteVector   = coordECEF(t,:,:)-[X0,Y0,Z0];
elevation(1,1)    = computeElevation(upVector,satelliteVector(:,:,1));
elevation(1,2)    = computeElevation(upVector,satelliteVector(:,:,2));
elevation(1,3)    = computeElevation(upVector,satelliteVector(:,:,3));
elevation(1,4)    = computeElevation(upVector,satelliteVector(:,:,4));

if (elevation(1,1))<=5
    number1 = 1;
end
if (elevation(1,2))<=85
    number2 = 1;
end
if (elevation(1,3))<=85
    number3 = 1;
end
if (elevation(1,4))<=85
    number4 = 1;
end
numSatsOnSight = number1 ;%+ number2 + number3 + number4;
end