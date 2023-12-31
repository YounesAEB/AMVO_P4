function plotSpherCoordCRF(spherCoordCRF)
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

figure
hold on
opts1.Color = 'b';
opts2.Color = 'r';
opts3.Color = 'g';
opts4.Color = 'y';
plot(spherCoordCRF(:,3,1),spherCoordCRF(:,2,1),".",opts1);
plot(spherCoordCRF(:,3,2),spherCoordCRF(:,2,2),".",opts2);
plot(spherCoordCRF(:,3,3),spherCoordCRF(:,2,3),".",opts3);
plot(spherCoordCRF(:,3,4),spherCoordCRF(:,2,4),".",opts4);
axis padded
hold off
grid on
grid minor
legend('Satellite 1','Satellite 2','Satellite 3','Satellite 4');
xlabel("Longitude $\lambda$ ($^\circ$)")
ylabel("Latitude $\phi$ ($^\circ$)")

xlim([-180,180]);
xticks(-180:30:180);
ylim([-45,45]);
yticks(-90:30:90);

box on

end