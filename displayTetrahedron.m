function displayTetrahedron(coordCRF,globalGrid)
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

coordCRF = coordCRF/10^7; % [10^7 m]
globalGrid = globalGrid/10^7; %[10^7 m]

a=17; %initial instant
b=0.4426666666667;

for theta = 150
disp(theta)
t=round(a+b*theta,0);

figure
hold on
opts1.Color = 'b';
opts2.Color = 'r';
opts3.Color = 'g';
opts4.Color = 'y';
scatter3(coordCRF(t,1,1),coordCRF(t,2,1),coordCRF(t,3,1),'filled',opts1.Color);
scatter3(coordCRF(t,1,2),coordCRF(t,2,2),coordCRF(t,3,2),'filled',opts2.Color);
scatter3(coordCRF(t,1,3),coordCRF(t,2,3),coordCRF(t,3,3),'filled',opts3.Color);
scatter3(coordCRF(t,1,4),coordCRF(t,2,4),coordCRF(t,3,4),'filled',opts4.Color);
globe = surf(globalGrid(:,:,1),globalGrid(:,:,2),globalGrid(:,:,3),'EdgeColor','none');

plot3(coordCRF(:,1,1),coordCRF(:,2,1),coordCRF(:,3,1),opts1,'linewidth',1);
plot3(coordCRF(:,1,2),coordCRF(:,2,2),coordCRF(:,3,2),opts2,'linewidth',1);
plot3(coordCRF(:,1,3),coordCRF(:,2,3),coordCRF(:,3,3),opts3,'linewidth',1);
plot3(coordCRF(:,1,4),coordCRF(:,2,4),coordCRF(:,3,4),opts4,'linewidth',1);

p1=[coordCRF(t,1,1) coordCRF(t,2,1) coordCRF(t,3,1)];
p2=[coordCRF(t,1,2) coordCRF(t,2,2) coordCRF(t,3,2)];
p3=[coordCRF(t,1,3) coordCRF(t,2,3) coordCRF(t,3,3)];
p4=[coordCRF(t,1,4) coordCRF(t,2,4) coordCRF(t,3,4)];

plane1 = [p1', p2', p3'];
f1=fill3(plane1(1,:),plane1(2,:),plane1(3,:),[0.9290 0.6940 0.1250],'LineStyle','-');
f1(1).FaceAlpha = 0.5;

plane2 = [p1', p2', p4'];
f2=fill3(plane2(1,:),plane2(2,:),plane2(3,:),[0.9290 0.6940 0.1250],'LineStyle','-');
f2(1).FaceAlpha = 0.5;

plane3 = [p1', p3', p4'];
f3=fill3(plane3(1,:),plane3(2,:),plane3(3,:),[0.9290 0.6940 0.1250],'LineStyle','-');
f3(1).FaceAlpha = 0.5;

plane4 = [p2', p3', p4'];
f4=fill3(plane4(1,:),plane4(2,:),plane4(3,:),[0.9290 0.6940 0.1250],'LineStyle','-');
f4(1).FaceAlpha = 0.5;

set(gca, 'TickLabelInterpreter', 'latex', 'FontSize',13);
axis equal
axis padded %off to not show neither the grid nor the axis
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
%legend('Satellite 1','Satellite 2','Satellite 3','Satellite 4','Location','northeastoutside');

str = sprintf('$M_1=$ %d', theta);
title(str,Interpreter="latex",FontSize=20)
view(-160,20)


% str2 = sprintf('New3M1=%d', theta);
%     set(gcf, 'Units', 'Centimeters');
%     pos = get(gcf, 'Position');
%     set(gcf, 'PaperPositionMode', 'Auto', 'PaperUnits', 'Centimeters', ...
%         'PaperSize',[pos(3), pos(2)]);
%     print(gcf,str2, '-dpng', '-r0'); % incrementar '-r0' resolución 
end
end