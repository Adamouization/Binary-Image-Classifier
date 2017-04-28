% Calculates the covariance of the input data (in the form of a matrix)
% input: data (matrix of size MxN)
% return: covariance
% author: Adam Jaamour (aj645)
function [covariance] = calcCov(data)
    %% FIELDS
    columns = size(data,1);         % retrieve size of input matrix column
    one = ones(columns,columns);    % generates a square matrix of 1's with size of column of input matrix

    %% CALCULATIONS
    % first, calculate the deviation matrix of the input data using the
    % formula d = D - 1*D*(1/n)
    % where:
    %       d = deviation matrix,
    %       D = input data of size MxN,
    %       1 = is a matrix of 1's of size MxM,
    %       n = number of rows in D.
    % then, calculate the covariance matrix by dividing each element in the
    % deviation sum of squares matrix by n.
    deviation = data - (one*data/(columns));                        % calculates deviation matrix
    covariance = (transpose(deviation) * deviation)/(columns-1);    % calculates covariance matrix
end