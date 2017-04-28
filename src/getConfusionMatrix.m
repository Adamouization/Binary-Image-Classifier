function [ confusion_matrix ] = getConfusionMatrix(imagedir)
    verifyImageDir(imagedir);
    classes = getClasses(imagedir);
    numClasses = size(classes,2);
    totalImages = getNumImages(imagedir);
    confusion_matrix = zeros(numClasses,numClasses);
    acc = 0;

    for i = 1:numClasses
        imagelist = dir(sprintf('%s/%s*.gif', imagedir, classes{i}));

        if (isempty(imagelist))
            error('No images for class');
        end

        length_list = size(imagelist,1); % num of imgs in created list
        
        for j = 1:length_list
            imagepath = sprintf('%s/%s', imagedir, imagelist(j).name);
            classification = classify(imagepath);
                        
            for k = 1:numClasses
                if(strcmp(char(classification),classes{k}))
                    confusion_matrix(k,i) = confusion_matrix(k,i) + 1;
                    break;
                end
            end
            
        end 
    end
    
    for l = 1:numClasses
        acc = acc + confusion_matrix(l,l);
    end
    
    score = (acc / totalImages)*100;
    disp(['Confusion matrix score = ' int2str(score) '%']); disp(' ');
end

