clear all;
clc;


%% Load 1 image for testing purposes
imagedir = '../images';
verifyImageDir(imagedir);
imagepath = [imagedir '/train/Butterfly042.gif'];


%% Get number of images in directory
imagedir_train = [imagedir '/train'];
imagedir_test = [imagedir '/test'];
numImages_train = getNumImages(imagedir_train);
disp(['Number of total training images: ' num2str(numImages_train)]); disp(' ');


%% Get all classes
classes = getClasses(imagedir_test);
numClasses = size(classes,2);
disp(['Total number of classes: ' num2str(numClasses)]);
disp(['Classes detected: ' strjoin(classes)]); disp(' ');


%% Get number of images for each specific classes
disp(['Number of images for class:']);
total_check = 0;
for i = 1:numClasses
    numimclasses = getNumImagesForClass(imagedir_train, char(classes(i)));
    disp([char(classes(i)) ' = ' int2str(numimclasses)]);
    total_check = total_check + numimclasses;
end
disp(' ');


%% Check all images are correctly retrieved and classed
if(total_check ~= numImages_train)
    disp('Training images imported/classification failed'); disp(' ');
else
    disp('Training images correctly imported/classed'); disp(' ');
end


%% Get data matrix for each class
%


%% Get feature vectors
N = 30; % = number of lowest frequencies to keep
features = getFeatures(imagepath,N);
%disp(features);


%% Produce a data matrix for each class
%


%% Train classifier
%train(imagedir,N);


%% Test classifier
%
