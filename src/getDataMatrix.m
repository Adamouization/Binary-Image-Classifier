% Produces a data matrix for a given class
% note: features are stored in the columns of the matrix, while each row is a separate shape instance.
function [D] = getDataMatrix(imagedir,class,N)

    verifyImageDir(imagedir);
    
    imagelist = dir(sprintf('%s/%s*.gif', imagedir, class));
    
    if length(imagelist) == 0
        error('No images for class');
    end
    
    D = zeros(length(imagelist), N);

    for idx = 1:length(imagelist)
        imagepath = sprintf('%s/%s', imagedir, imagelist(idx).name);
        D(idx, :) = getFeatures(imagepath, N)';
    end
end