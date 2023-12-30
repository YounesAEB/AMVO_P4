function Z = computeNumSatsOnSight(coordECEF,spherCoordECEF,globalGrid,globalGrid_polar)
satellitesInView  = zeros(size(coordECEF,1),4); % Matrix for the whole planet
% v = VideoWriter("onSight.avi");
% open(v)

for t=1:size(coordECEF,1)
number_grid = zeros(180+1,360+1);
for i=1:180+1
    for j=1:360+1
        X0 = globalGrid(i,j,1);
        Y0 = globalGrid(i,j,2);
        Z0 = globalGrid(i,j,3);
        [numSatsOnSight] = computeSatellitesOnSight(t,X0,Y0,Z0,coordECEF);
        number_grid(i,j) = numSatsOnSight;
    end
end
    
% Video generator
Z = number_grid;
% X = globalGrid_polar(:,:,3);
% Y = globalGrid_polar(:,:,2);
% figure;
% % surf(globalGrid(:,:,1),globalGrid(:,:,2),globalGrid(:,:,3),Z)
% % hold on
% % scatter3(coordECEF(t,1),coordECEF(t,2),coordECEF(t,3),'filled','o','MarkerFaceColor','r');
% % axis equal
% hold on
% surf(X, Y, Z,'EdgeColor', 'None', 'facecolor', 'interp');
% colormap jet;
% colorbar
% scatter3(deg2rad(spherCoordECEF(t,3,1)),deg2rad(spherCoordECEF(t,2,1)),5,'filled','o','MarkerFaceColor','k');
% scatter3(deg2rad(spherCoordECEF(t,3,2)),deg2rad(spherCoordECEF(t,2,2)),5,'filled','o','MarkerFaceColor','k');
% scatter3(deg2rad(spherCoordECEF(t,3,3)),deg2rad(spherCoordECEF(t,2,3)),5,'filled','o','MarkerFaceColor','k');
% scatter3(deg2rad(spherCoordECEF(t,3,4)),deg2rad(spherCoordECEF(t,2,4)),5,'filled','o','MarkerFaceColor','k');
% view(2);
% axis equal; 
% axis off;
% set(gca,"NextPlot","replacechildren")
% frame = getframe(gcf);
% writeVideo(v,frame)
% hold off
% close all

oneSatellite   = sum(sum(number_grid==1));
twoSatellite   = sum(sum(number_grid==2));
threeSatellite = sum(sum(number_grid==3));
fourSatellite  = sum(sum(number_grid==4));
satellitesInView(t,:) = [oneSatellite,twoSatellite,threeSatellite,fourSatellite];
end   
% close(v) 

end