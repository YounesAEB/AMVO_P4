function secondsSinceEpoch = dateToSecondsSinceEpoch(dateVector)
    % Convert a date in the format of a vector [day, month] to seconds since January 1, 2000 11:00:00, in UT1

    % Ensure dateVector has two elements (day and month)
    assert(numel(dateVector) == 2, 'Input dateVector must have two elements.');

    % Assuming year 2000, set the time to 00:00:00 of the specified day
    referenceDateTime = datetime(2000, dateVector(2), dateVector(1), 0, 0, 0);

    % Calculate the duration since January 1, 2000, 11:00:00
    durationSinceEpoch = referenceDateTime - datetime(2000, 1, 1, 11, 0, 0);

    % Convert the duration to seconds using the seconds function
    secondsSinceEpoch = seconds(durationSinceEpoch);
end
