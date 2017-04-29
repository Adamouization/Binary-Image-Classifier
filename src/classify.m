% Classify the image specified for the given image path
% Note: should first call the train function, which will save the models to be loaded in this function.
function [classname] = classify(imagepath)

    load('models'); % file generated after training classifier
    
    %Assume all models use the same number of features
    N = length(models(1).mean);  
    
    features = getFeatures(imagepath, N);
    
    maxscore = -inf;
    
    %Find out which class has the highest score
    for idx = 1:length(models)
        model = models(idx);
        
        score = (log(model.prior))-(0.5*(log(det(model.cov)))) - (0.5*(transpose(features-model.mean))*(inv(model.cov))*(features-model.mean));
        
        if score > maxscore
            maxscore = score;
            bestidx = idx;
        end
    end
    
    classname = classes(bestidx);
end