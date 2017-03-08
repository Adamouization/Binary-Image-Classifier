function [ result ] = MeanMatrix( data )

    %% FIELDS
    sizeMatrix = size(data);
    columns = sizeMatrix(1);
    rows = sizeMatrix(2);
    result = zeros(1, columns);

    %% LOOP
    for i = 1:rows
        counter = 0;
        total = 0;
        for j = 1:columns
            counter = counter + 1;
            total = total + data(j,i);
        end
        result(1,i) = total/counter;
    end
    
end

