function plotGroundTrack(spherCoordECEF)

% Ground tracks over the Earth surface
figure
hold on
%title("Tracks over the Earth surface for the designated period")
opts1.Color = 'b';
opts2.Color = 'r';
opts3.Color = 'g';
opts4.Color = 'y';
GroundTrack(spherCoordECEF(:,2,1),spherCoordECEF(:,3,1),opts1);
GroundTrack(spherCoordECEF(:,2,2),spherCoordECEF(:,3,2),opts2);
GroundTrack(spherCoordECEF(:,2,3),spherCoordECEF(:,3,3),opts3);
GroundTrack(spherCoordECEF(:,2,4),spherCoordECEF(:,3,4),opts4);
grid on;
grid minor;
box on;
hold off;

% Orbital periods for ground track repetition

end
