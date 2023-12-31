function plotEarthSurfaceWithSeenSatellites3D(globalGrid,Z,coordECEF)

set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

figure;
h = surf(globalGrid(:,:,1),globalGrid(:,:,2),globalGrid(:,:,3),Z);
set(h,'edgecolor','none');
hold on
scatter3(coordECEF(end,1,1),coordECEF(end,2,1),coordECEF(end,3,1),'filled','o'); %,'MarkerFaceColor','r'
scatter3(coordECEF(end,1,2),coordECEF(end,2,3),coordECEF(end,3,2),'filled','o');
scatter3(coordECEF(end,1,3),coordECEF(end,2,3),coordECEF(end,3,3),'filled','o');
scatter3(coordECEF(end,1,4),coordECEF(end,2,4),coordECEF(end,3,4),'filled','o');
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