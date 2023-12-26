function coordCRF = transformToCRFCoord(date,time,coordECEF)
offset = 0;
DD     = date(1,1);
MM     = date(1,2);        
UT1         = zeros(size(coordECEF,1),1);
coordCRF    = zeros(size(coordECEF,1),3,4);
GMST        = zeros(size(coordECEF,1),1);
for i=1:size(coordECEF,1)
    UT1(i,1) = time(i,1)-time(1,1)+offset;
    if UT1(i,1)==24*3600
        UT1(i,1) = 0;
        DD       = DD + 1;
        offset   = offset - 86400;        
    end
JD       = fix(365.25 * 2000) + fix(30.6001 * (MM+1)) + DD + (UT1(i,1)/3600)/24 + 1720981.5;
TJC      = (JD - 2451545.0)/36525;
GMST0    = 24110.54841 + 8640184.812866*TJC + 0.093104*TJC^2 - 6.2e-6*TJC^3;
GMSTsec  = (1.002737909350795*UT1(i,1) + GMST0);
GMST(i,1)= mod(GMSTsec,86400)*360/86400;

R3       = [cosd(GMST(i,1)), -sind(GMST(i,1)), 0;
                sind(GMST(i,1)),  cosd(GMST(i,1)), 0;
                0, 0, 1];
% R3       = [cosd(-GMST(i,1)), -sind(-GMST(i,1)), 0;
%             sind(-GMST(i,1)),  cosd(-GMST(i,1)), 0;
%             0, 0, 1];

coordCRF(i,:,1) = R3*coordECEF(i,:,1)';
coordCRF(i,:,2) = R3*coordECEF(i,:,2)';
coordCRF(i,:,3) = R3*coordECEF(i,:,3)';
coordCRF(i,:,4) = R3*coordECEF(i,:,4)';
end

% este plot es para asegurarse que va de 0 a 360
% figure
% hold on
% plot(time-time(1,1), GMST)
% hold off

end