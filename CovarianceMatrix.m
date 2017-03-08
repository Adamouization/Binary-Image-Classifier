function [ covariance ] = CovarianceMatrix( data )
    %% FIELDS
    columns = size(data,1);
    one = ones(columns,columns);

    %% CALCULATIONS
    deviation = data - (one*data/(columns));
    covariance = (transpose(deviation) * deviation)/(columns-1);
end
