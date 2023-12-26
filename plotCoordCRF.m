function plotCoordCRF(coordCRF,globalGrid)
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

figure
hold on
surf(globalGrid(:,:,1),globalGrid(:,:,2),globalGrid(:,:,3),'EdgeColor','none')
plot3(coordCRF(:,1,1),coordCRF(:,2,1),coordCRF(:,3,1));
plot3(coordCRF(:,1,2),coordCRF(:,2,2),coordCRF(:,3,2));
plot3(coordCRF(:,1,3),coordCRF(:,2,3),coordCRF(:,3,3));
plot3(coordCRF(:,1,4),coordCRF(:,2,4),coordCRF(:,3,4));
axis equal
axis padded
hold off
grid on
grid minor
%title('title')
xlabel('$x$~(m)')
ylabel('$y$~(m)')
zlabel('$z$~(m)')
box on
view(25,25)
end