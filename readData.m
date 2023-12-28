function [coordECEF,time] = readData(epoch_bday,window,rate,nSat)

data  = readmatrix("SATPVT.txt");
start = find(data(:,2)==epoch_bday);
% data  = data(start(1):start(1)+(window/rate)*nSat-1,:);
data  = data(start(1):start(1)+(window/rate)*nSat+3,:);

data1 = zeros(size(data,1)/4,size(data,2)-1);
data2 = zeros(size(data,1)/4,size(data,2)-1);
data3 = zeros(size(data,1)/4,size(data,2)-1);
data4 = zeros(size(data,1)/4,size(data,2)-1);

for i=1:size(data,1)/4
    data1(i,:) = data((i-1)*4+1,2:end);
    data2(i,:) = data((i-1)*4+2,2:end);
    data3(i,:) = data((i-1)*4+3,2:end);
    data4(i,:) = data((i-1)*4+4,2:end);
end

coordECEF(:,:,1) = [data1(:,2),data1(:,3),data1(:,4)]; %ECEF position vector SAT1
coordECEF(:,:,2) = [data2(:,2),data2(:,3),data2(:,4)]; %ECEF position vector SAT2
coordECEF(:,:,3) = [data3(:,2),data3(:,3),data3(:,4)]; %ECEF position vector SAT3
coordECEF(:,:,4) = [data4(:,2),data4(:,3),data4(:,4)]; %ECEF position vector SAT4

time = data1(:,1);
end