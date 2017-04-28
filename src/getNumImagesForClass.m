% Counts the number of images for a specified class and return the total
% for that specified class
function [ numImages ] = getNumImagesForClass(imagedir, class)

    verifyImageDir(imagedir);
    
    imagelist = dir(sprintf('%s/%s*.gif', imagedir, class));
    
    numImages = length(imagelist);
    
end