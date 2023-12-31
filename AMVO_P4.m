%--------------------------------------------------------------------------
%  /  POTENTIAL AERODYNAMICS - AMVO 
%  /  Code to assess the numerical process of a 4 satellite constellation                                            
%  /  ESEIAAT_UPC                                           
%  /  MUEA - MQ1 - Younes Akhazzan - Joel Rajo - Pol Ruiz                         
%--------------------------------------------------------------------------
clc; clear; close all;
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

% DATA DEFINITION
date       = [3,12];  % Birthday date in format [day, month]
rate       = 600;     % Seconds between satellite data
epoch_bday = dateToSecondsSinceEpoch(date);
% epoch_bday = 0;
window     = 868800; % Time window in seconds
nSat       = 4;       % Number of satellites

% DATA LECTURE
[coordECEF,time] = readData(epoch_bday,window,rate,nSat);

% 1. GEOCENTRIC SATELLITE COORDINATES
spherCoordECEF = transformToSphericalCoord(coordECEF);
plotSatelliteDistances(spherCoordECEF,time);

% 2. SATELLITE GROUND TRACKS IN THE GEOCENTRIC TERRESTRIAL REFERENCE FRAME (TRF) 
%plotGroundTrack(spherCoordECEF);
%plot3DPathsECEF(coordECEF); % Este gráfico no tiene sentido
%timeTaken = findGroundTrackPeriod(spherCoordECEF,time);


% 3. ASSESSING THE CONSTELLATION COVERING IN THE TRF
[globalGrid,globalGrid_polar] = computeGlobalGrid();
% [result,satellitesInView,Z_last] = computeNumSatsOnSight(coordECEF,spherCoordECEF,globalGrid,globalGrid_polar);
% satESEIAAT = computeNumSatsESEIAAT(coordECEF);
% plotEarthSurfaceWithSeenSatellites3D(globalGrid,Z_last,coordECEF);
% plotEarthSurfaceWithAverageSatellitesInView(globalGrid_polar,result);
% plotNumSatEvolutionESEIAAT(satESEIAAT,time);


% 4. Satellite ground tracks in the geocentric Celestial Reference Frame (CRF)
coordCRF = transformToCRFCoord(date,time,coordECEF);
%spherCoordCRF = transformToSphericalCoord(coordCRF);
%plotCoordCRF(coordCRF,globalGrid);
%plotSpherCoordCRF(spherCoordCRF);
%plotGroundTrack(spherCoordCRF);

% 5. Displaying the tetrahedron and optimizing the constellation
displayTetrahedron(coordCRF,globalGrid);


% CODE TO PRINT THE FIGURES IN PDF FORMAT
%     set(gcf, 'Units', 'Centimeters');
%     pos = get(gcf, 'Position');
%     set(gcf, 'PaperPositionMode', 'Auto', 'PaperUnits', 'Centimeters', ...
%         'PaperSize',[pos(3), pos(4)]);
%     print(gcf, 'McrVSalpha', '-dpdf', '-r0'); % incrementar '-r0' resolución 