function plot3DPathsECEF(coordECEF)
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

% 3D Plot of the flight paths in ECEF
figure
hold on
plot3(coordECEF(:,1,1),coordECEF(:,2,1),coordECEF(:,3,1));
plot3(coordECEF(:,1,2),coordECEF(:,2,2),coordECEF(:,3,2));
plot3(coordECEF(:,1,3),coordECEF(:,2,3),coordECEF(:,3,3));
plot3(coordECEF(:,1,4),coordECEF(:,2,4),coordECEF(:,3,4));
hold off
legend('Satellite 1','Satellite 2','Satellite 3','Satellite 4');
axis padded
hold off
grid on
grid minor
xlabel("$x$ ($m$)")
ylabel("$y$ ($m$)")
zlabel("$z$ ($m$)")
box on

end