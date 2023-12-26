function coordESEIAAT = getESEIAATCoordinates()
% Observer located in the ESEIAAT
radiusEseiaat    = 6371*10^3;    
latitudeEseiaat  = 41.564394;
longitudeEseiaat = 2.023238;
% Coordinate change from polar to cartesian earth centered
xEseiaat = radiusEseiaat*cos(latitudeEseiaat)*cos(longitudeEseiaat);
yEseiaat = radiusEseiaat*cos(latitudeEseiaat)*sin(longitudeEseiaat);
zEseiaat = radiusEseiaat*sin(latitudeEseiaat);

coordESEIAAT = [xEseiaat,yEseiaat,zEseiaat];
end