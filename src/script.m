clear;
clc;


%% Load 1 image for testing purposes
imagedir = '../images';
verifyImageDir(imagedir);
imagepath = [imagedir '/train/Butterfly042.gif'];


%% Get number of images in directory
imagedir_train = [imagedir '/train'];
imagedir_test = [imagedir '/test'];
numImages_train = getNumImages(imagedir_train);
disp(['Number of images in total: ' num2str(numImages_train)]); disp(' ');


%% Get all classes
classes = getClasses(imagedir_test);
numClasses = size(classes,2);
disp(['Total number of classes: ' num2str(numClasses)]);
disp(['Classes detected: ' strjoin(classes)]); disp(' ');


%% Get number of images for each specific classes
disp(['Number of images for class:']);
for i = 1:numClasses
    numimclasses = getNumImagesForClass(imagedir_test, char(classes(i)));
    disp([char(classes(i)) ' = ' int2str(numimclasses)]);
end
disp(' ');


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
