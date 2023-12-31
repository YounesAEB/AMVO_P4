function plotCoordCRF(coordCRF,globalGrid)
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

coordCRF = coordCRF/10^7; % [10^4 km]
globalGrid = globalGrid/10^7; %[10^4 km]
figure
hold on
opts1.Color = 'b';
opts2.Color = 'r';
opts3.Color = 'g';
opts4.Color = 'y';
plot3(coordCRF(:,1,1),coordCRF(:,2,1),coordCRF(:,3,1),opts1);
plot3(coordCRF(:,1,2),coordCRF(:,2,2),coordCRF(:,3,2),opts2);
plot3(coordCRF(:,1,3),coordCRF(:,2,3),coordCRF(:,3,3),opts3);
plot3(coordCRF(:,1,4),coordCRF(:,2,4),coordCRF(:,3,4),opts4);
scatter3(coordCRF(end,1,1),coordCRF(end,2,1),coordCRF(end,3,1),'filled',opts1.Color);
scatter3(coordCRF(end,1,2),coordCRF(end,2,2),coordCRF(end,3,2),'filled',opts2.Color);
scatter3(coordCRF(end,1,3),coordCRF(end,2,3),coordCRF(end,3,3),'filled',opts3.Color);
scatter3(coordCRF(end,1,4),coordCRF(end,2,4),coordCRF(end,3,4),'filled',opts4.Color);
globe = surf(globalGrid(:,:,1),globalGrid(:,:,2),globalGrid(:,:,3),'EdgeColor','none');
axis equal
axis padded
hold off
grid on
grid minor
%title('title')
xlabel('$x$~($10^7$ m)')
ylabel('$y$~($10^7$ m)')
zlabel('$z$~($10^7$ m)')
box on

image_file = 'http://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Land_ocean_ice_2048.jpg/1024px-Land_ocean_ice_2048.jpg';
cdata = imread(image_file);
% Set image as color data (cdata) property, and set face color to indicate
% a texturemap, which Matlab expects to be in cdata. Turn off the mesh edges.
set(globe, 'FaceColor', 'texturemap', 'CData', cdata, 'EdgeColor', 'none');
legend('Satellite 1','Satellite 2','Satellite 3','Satellite 4');
view(-160,20)
% % CODE TO PRINT THE FIGURES IN PDF FORMAT
%     set(gcf, 'Units', 'Centimeters');
%     pos = get(gcf, 'Position');
%     set(gcf, 'PaperPositionMode', 'Auto', 'PaperUnits', 'Centimeters', ...
%         'PaperSize',[pos(3), pos(4)]);
%     print(gcf, 'coordCRFXYZ', '-dpdf', '-bestfit'); % incrementar '-r0' resolución 

end