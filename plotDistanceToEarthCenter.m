function plotDistanceToEarthCenter(time,spherCoordECEF)
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

% Distance from the earth center
distance = spherCoordECEF(:,1,:);
time = time/3600;
figure
hold on
%ss = load('time.mat');

plot(time(:,1)-time(1,1),distance(:,1,1)/10^3);
plot(time(:,1)-time(1,1),distance(:,1,2)/10^3);
plot(time(:,1)-time(1,1),distance(:,1,3)/10^3);
plot(time(:,1)-time(1,1),distance(:,1,4)/10^3);
legend('Satellite 1','Satellite 2','Satellite 3','Satellite 4');
axis padded
hold off
grid on
grid minor
xlabel("Time ($s$)")
ylabel("Distance ($km$)")
box on

end