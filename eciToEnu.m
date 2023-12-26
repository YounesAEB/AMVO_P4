function enuCoordinates = eciToEnu(eciCoordinates, observerLatitude, observerLongitude)
    % Convert ECI coordinates to ENU coordinates

    % Rotation about the Earth's axis to align the East direction
    R1 = [cos(observerLongitude), sin(observerLongitude), 0;
         -sin(observerLongitude), cos(observerLongitude), 0;
          0, 0, 1];

    % Rotation about the resulting axis to align the North direction
    R2 = [cos(observerLatitude), 0, -sin(observerLatitude);
          0, 1, 0;
          sin(observerLatitude), 0, cos(observerLatitude)];

    % Combine the rotation matrices
    R = R2 * R1;

    % Apply the rotation to convert from ECI to ENU
    %enuCoordinates = R * eciCoordinates';

    ECEFtoENUmatrix= [
        -sin(observerLongitude), cos(observerLongitude), 0;
        -cos(observerLongitude)*sin(observerLatitude), -sin(observerLongitude)*sin(observerLatitude), cos(observerLatitude);
        cos(observerLongitude)*cos(observerLatitude), sin(observerLongitude)*cos(observerLatitude), sin(observerLatitude)
        ];
    enuCoordinates = ECEFtoENUmatrix * eciCoordinates';
end
