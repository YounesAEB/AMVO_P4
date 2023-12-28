function plotSatelliteDistances(spherCoordECEF,time)
relativeTime    = time(:)-time(1);
hourlyTime      = relativeTime/3600;
figure
hold on
opts1.Color = 'b';
opts2.Color = 'r';
opts3.Color = 'g';
opts4.Color = 'y';
plot(hourlyTime,spherCoordECEF(:,1,1),opts1);
plot(hourlyTime,spherCoordECEF(:,1,2),opts2);
plot(hourlyTime,spherCoordECEF(:,1,3),opts3);
plot(hourlyTime,spherCoordECEF(:,1,4),opts4);
grid on;
grid minor;
box on;
xlim([0,72])
hold off;
end