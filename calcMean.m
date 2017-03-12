% Calculates the mean of the input data (in the form of a matrix)
% input: data
% return: mean
% author: Adam Jaamour (aj645)
function [mean] = calcMean(data)
    %% FIELDS
    columns = size(data, 1);        % # of columns in input data
    rows = size(data, 2);           % # of rows in input data
    mean = zeros(1, columns);       % initialize mean matrix with # of columns in input data

    %% CALCULATIONS
    % loops through each element of a column for each column,
    % and calculates mean for each column.
    for i = 1:rows
        total = 0;                      % store sum of all elements in a column
        for j = 1:columns
            total = total + data(j,i);
        end
        mean(1,i) = total/columns;      % calculate mean for each column
    end
end