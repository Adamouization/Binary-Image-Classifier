% Returns all classes in directory provided.
function [classes] = getClasses(imagedir)

    verifyImageDir(imagedir);
    
    imagelist = dir(sprintf('%s/*.gif', imagedir));
    classes = {}; % initialize cells to store classes
    
    for idx = 1:length(imagelist)
        name = imagelist(idx).name;
        class = name(1:end-7);
        if (isempty(strmatch(class, classes)))
            classes{length(classes)+1} = class;
        end
    end
    
end