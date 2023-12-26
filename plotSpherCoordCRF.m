function plotSpherCoordCRF(spherCoordCRF)
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

figure
hold on
plot(spherCoordCRF(:,3,1),spherCoordCRF(:,2,1));
plot(spherCoordCRF(:,3,2),spherCoordCRF(:,2,2));
plot(spherCoordCRF(:,3,3),spherCoordCRF(:,2,3));
plot(spherCoordCRF(:,3,4),spherCoordCRF(:,2,4));
axis padded
hold off
grid on
grid minor
xlabel("Longitude $\lambda$ ($^\circ$)")
ylabel("Latitude $\phi$ ($^\circ$)")
box on

end