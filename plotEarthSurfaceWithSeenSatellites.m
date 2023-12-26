function plotEarthSurfaceWithSeenSatellites(globalGrid,Z,coordECEF)

set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

figure;
surf(globalGrid(:,:,1),globalGrid(:,:,2),globalGrid(:,:,3),Z)
hold on
t=432; % último instante
scatter3(coordECEF(t,1,1),coordECEF(t,2,1),coordECEF(t,3,1),'filled','o'); %,'MarkerFaceColor','r'
%scatter3(coordECEF(t,1,2),coordECEF(t,2,3),coordECEF(t,3,2),'filled','o');
%scatter3(coordECEF(t,1,3),coordECEF(t,2,3),coordECEF(t,3,3),'filled','o');
%scatter3(coordECEF(t,1,4),coordECEF(t,2,4),coordECEF(t,3,4),'filled','o');
axis equal
hold on
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