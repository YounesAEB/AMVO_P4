function plotNumSatEvolutionESEIAAT(satESEIAAT,time)

% Time evolution of the satellites on sight in ESEIAAT
figure
hold on
title("Evolution of the number of satellites on sight from","the ESEIAAT's location for the designated period");
plot(time(:,1)-time(1,1),satESEIAAT);
xlabel('Time (s)');
ylabel('Number of satellites');
ylim([0,4]);
% xlim([0,time(end,1)-time(1,1)]);
grid on;
grid minor;
axis padded
box on;
hold off;

end