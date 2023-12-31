function plotEarthSurfaceWithAverageSatellitesInView(globalGrid_polar,Z)

set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');




X = globalGrid_polar(:,:,3);
Y = globalGrid_polar(:,:,2);
figure;

hold on
surf(rad2deg(X), rad2deg(Y), Z,'EdgeColor', 'None', 'facecolor', 'interp');
colormap jet;
colorbar
view(2);
axis equal; 
xlim([-180,180]);
ylim([-90,90]);
% grid on
% grid minor
%title('title')
xlabel('Longitude (deg)')
ylabel('Latitude (deg)')
box on
hold off

end