% Creates the confusion matrix after testing each image in the directory
% with the trained classifier.
% input: imagedir (image directory of images to test with the classifier)
% return: confusion_matrix (to determine accuracy of classifier)
% author: Adam Jaamour (aj645)
function [ confusion_matrix ] = getConfusionMatrix(imagedir)

    verifyImageDir(imagedir);
    
    % classes data
    classes = getClasses(imagedir);
    numClasses = size(classes,2);
    
    % images in directory (to determine final accuracy)
    totalImages = getNumImages(imagedir);
    
    % used to determine accuracy when divided with total # of tested images
    accumulator = 0;
    
    % initialize confusion matrix with correct size
    confusion_matrix = zeros(numClasses,numClasses);

    % loop through each class
    for i = 1:numClasses
        imagelist = dir(sprintf('%s/%s*.gif', imagedir, classes{i}));

        if (isempty(imagelist))
            error('No images for class');
        end

        length_list = size(imagelist,1); % num of images in created list
        
        % loop through each image in specific class
        for j = 1:length_list
            
            imagepath = sprintf('%s/%s', imagedir, imagelist(j).name);
            classification = classify(imagepath); %classify images individually
                        
            % loop through each class for each image to determine if it was
            % correctly classified. If it was, increment corresponding
            % element of confusion matrix
            for k = 1:numClasses
                if(strcmp(char(classification),classes{k}))
                    confusion_matrix(k,i) = confusion_matrix(k,i) + 1;
                    break;
                end
            end
            
        end 
    end
    
    % calculate total images which were correctly classified
    for l = 1:numClasses
        accumulator = accumulator + confusion_matrix(l,l);
    end
    
    % calculate final classifier accuracy with this testing set
    score = (accumulator / totalImages)*100;
    disp(['Confusion matrix score = ' int2str(score) '%']); disp(' ');
    
end

