% Train a GMM models uses shapes in imagedir using N features
%
% Need one more function if using classes with fewer training data than N shapes: see ensurePSD function
% this is because the covariance matrix will be rank deficient for classes with few training data. 
% By increasing the very small (effectively zero with roundingerrors) eigenvalues, the matrix is no longer rank deficient
function train(imagedir, N)
    %Train a GMM models uses shapes in imagedir using N features
    classes = getClasses(imagedir);
    totalImages = getNumImages(imagedir);
    for idx = 1:length(classes)
        class = classes{idx};
        models(idx).name = class;
        dataMatrix = getDataMatrix(imagedir, class, N);
        models(idx).mean = transpose(calcMean(dataMatrix));
        models(idx).cov = ensurePSD(calcCov(dataMatrix));
        models(idx).prior = (getNumImagesForClass(imagedir, class)) / totalImages;
    end
    save('models');
    disp('Successfully saved models');
end