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
% epoch_bday = (366-31+2)*24*3600-11*3600;
epoch_bday = dateToSecondsSinceEpoch(date);
window     = 3*24*3600; % Time window in seconds, 3 days
nSat       = 4;       % Number of satellites


%% DATA LECTURE
data  = readmatrix("SATPVT.txt");
start = find(data(:,2)==epoch_bday);
data  = data(start(1):start(1)+(window/rate)*nSat-1,:);

data1 = zeros(size(data,1)/4,size(data,2)-1);
data2 = zeros(size(data,1)/4,size(data,2)-1);
data3 = zeros(size(data,1)/4,size(data,2)-1);
data4 = zeros(size(data,1)/4,size(data,2)-1);

for i=1:size(data,1)/4
    data1(i,:) = data((i-1)*4+1,2:end);
    data2(i,:) = data((i-1)*4+2,2:end);
    data3(i,:) = data((i-1)*4+3,2:end);
    data4(i,:) = data((i-1)*4+4,2:end);
end

cartesian1 = [data1(:,2),data1(:,3),data1(:,4)]; %ECEF position vector SAT1
cartesian2 = [data2(:,2),data2(:,3),data2(:,4)]; %ECEF position vector SAT2
cartesian3 = [data3(:,2),data3(:,3),data3(:,4)]; %ECEF position vector SAT3
cartesian4 = [data4(:,2),data4(:,3),data4(:,4)]; %ECEF position vector SAT4

%% 1. GEOCENTRIC SATELLITE COORDINATES

% Spherical geocentric coordinates in the form [radius,latitude,longitude]
polar1 = zeros(size(cartesian1,1),3);
polar2 = zeros(size(cartesian1,1),3);
polar3 = zeros(size(cartesian1,1),3);
polar4 = zeros(size(cartesian1,1),3);

% Coordinate change from cartesian to polar earth centered
for i=1:size(cartesian1,1)
polar1(i,:) = [norm(cartesian1(i,:)),180/pi*atan2(cartesian1(i,3),...
    sqrt(cartesian1(i,1)^2+cartesian1(i,2)^2)),180/pi*atan2(cartesian1(i,2),cartesian1(i,1))];
polar2(i,:) = [norm(cartesian2(i,:)),180/pi*atan2(cartesian2(i,3),...
    sqrt(cartesian2(i,1)^2+cartesian2(i,2)^2)),180/pi*atan2(cartesian2(i,2),cartesian2(i,1))];
polar3(i,:) = [norm(cartesian3(i,:)),180/pi*atan2(cartesian3(i,3),...
    sqrt(cartesian3(i,1)^2+cartesian3(i,2)^2)),180/pi*atan2(cartesian3(i,2),cartesian3(i,1))];
polar4(i,:) = [norm(cartesian4(i,:)),180/pi*atan2(cartesian4(i,3),...
    sqrt(cartesian4(i,1)^2+cartesian4(i,2)^2)),180/pi*atan2(cartesian4(i,2),cartesian4(i,1))];
end

%% 2. SATELLITE GROUND TRACKS IN THE GEOCENTRIC TERRESTRIAL REFERENCE FRAME (TRF) 
% Ground tracks over the Earth surface
figure
hold on
title("Tracks over the Earth surface for the designated period")
opts1.Color = 'b';
opts2.Color = 'r';
opts3.Color = 'g';
opts4.Color = 'y';
ground_track(polar1(:,2),polar1(:,3),opts1);
ground_track(polar2(:,2),polar2(:,3),opts2);
ground_track(polar3(:,2),polar3(:,3),opts3);
ground_track(polar4(:,2),polar4(:,3),opts4);
grid on;
grid minor;
box on;
set(gca, 'TickLabelInterpreter', 'latex', 'FontSize',13);
hold off;

% Orbital periods for ground track repetition


%% 3. ASSESSING THE CONSTELLATION COVERING IN THE TRF
global_grid_polar = zeros(180/5,360/5,3);
for i=1:180/5
    for j=1:360/5
        global_grid_polar(i,j,1) = 6371*10^3;     % Earth radius
        global_grid_polar(i,j,2) = 87.5 - (i-1)*5;  % Latitude
        global_grid_polar(i,j,3) =-177.5 + (j-1)*5; % Longitude
    end
end


global_grid_polar(:,:,2) = deg2rad(global_grid_polar(:,:,2));
global_grid_polar(:,:,3) = deg2rad(global_grid_polar(:,:,3));

% Coordinate change from polar to cartesian earth centered
global_grid(:,:,1) = global_grid_polar(:,:,1).*cos(global_grid_polar(:,:,2)).*cos(global_grid_polar(:,:,3));
global_grid(:,:,2) = global_grid_polar(:,:,1).*cos(global_grid_polar(:,:,2)).*sin(global_grid_polar(:,:,3));
global_grid(:,:,3) = global_grid_polar(:,:,1).*sin(global_grid_polar(:,:,2));

satellitesOnSight = zeros(size(cartesian1,1),1); % Array for ESEIAAT location
satellitesInView  = zeros(size(cartesian1,1),4); % Matrix for the whole planet
v = VideoWriter("onSightSat1.avi");
open(v)
for t=1:size(cartesian1,1)
number_grid = zeros(180/5,360/5);
for i=1:180/5
    for j=1:360/5
        radius    = global_grid_polar(i,j,1);
        latitude  = global_grid_polar(i,j,2);
        longitude = global_grid_polar(i,j,3);
        [total] = computeSatellitesOnSight...
            (t,radius,latitude,longitude,global_grid(i,j,1),global_grid(i,j,2),global_grid(i,j,3),cartesian1,cartesian2,cartesian3,cartesian4);
        number_grid(i,j) = total;
    end
end
% Observer located in the ESEIAAT
    radiusEseiaat    = 6371*10^3;    
    latitudeEseiaat  = 41.564394;
    longitudeEseiaat = 2.023238;
% Coordinate change from polar to cartesian earth centered
    xEseiaat = radiusEseiaat*cos(latitudeEseiaat)*cos(longitudeEseiaat);
    yEseiaat = radiusEseiaat*cos(latitudeEseiaat)*sin(longitudeEseiaat);
    zEseiaat = radiusEseiaat*sin(latitudeEseiaat);

    satellitesOnSight(t,:) = computeSatellitesOnSight...
            (t,radiusEseiaat,latitudeEseiaat,longitudeEseiaat,...
            xEseiaat,yEseiaat,zEseiaat,cartesian1,cartesian2,cartesian3,cartesian4);

% Video generator
X = global_grid_polar(:,:,3);
Y = global_grid_polar(:,:,2);
Z = number_grid;

figure;
surf(global_grid(:,:,1),global_grid(:,:,2),global_grid(:,:,3),Z)
hold on
scatter3(cartesian1(t,1),cartesian1(t,2),cartesian1(t,3),'filled','o','MarkerFaceColor','r');
axis equal
% hold on
% surf(X, Y, Z,'EdgeColor', 'None', 'facecolor', 'interp');
% colormap jet;
% colorbar
% scatter3(deg2rad(polar1(t,3)),deg2rad(polar1(t,2)),5,'filled','o','MarkerFaceColor','r');
% % scatter3(deg2rad(polar2(t,3)),deg2rad(polar2(t,2)),5,'filled','o','MarkerFaceColor','b');
% % scatter3(deg2rad(polar3(t,3)),deg2rad(polar3(t,2)),5,'filled','o','MarkerFaceColor','g');
% % scatter3(deg2rad(polar4(t,3)),deg2rad(polar4(t,2)),5,'filled','o','MarkerFaceColor','y');
% view(2);
% axis equal; 
% axis off;
% set(gca,"NextPlot","replacechildren")
% frame = getframe(gcf);
% writeVideo(v,frame)
% hold off
% close all

oneSatellite   = sum(sum(number_grid==1));
twoSatellite   = sum(sum(number_grid==2));
threeSatellite = sum(sum(number_grid==3));
fourSatellite  = sum(sum(number_grid==4));
satellitesInView(t,:) = [oneSatellite,twoSatellite,threeSatellite,fourSatellite];
end   
close(v) 
%% FIGURES AND GRAPHS
%%{
% Distance from the earth center
figure
hold on
plot(data1(:,1)-data1(1,1),polar1(:,1));
plot(data2(:,1)-data2(1,1),polar2(:,1));
plot(data3(:,1)-data3(1,1),polar3(:,1));
plot(data4(:,1)-data4(1,1),polar4(:,1));
legend('dist 1','dist 2','dist 3','dist 4');
hold off

% Evolution of the number of satellites on sight from eseiaat
figure
hold on
plot(data1(:,1)-data1(1,1),satellitesOnSight);
hold off

% 3D Plot of the flight paths
figure
hold on
plot3(cartesian1(:,1),cartesian1(:,2),cartesian1(:,3));
plot3(cartesian2(:,1),cartesian2(:,2),cartesian2(:,3));
plot3(cartesian3(:,1),cartesian3(:,2),cartesian3(:,3));
plot3(cartesian4(:,1),cartesian4(:,2),cartesian4(:,3));
hold off
%}