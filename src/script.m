%%
% Main script to run to train and test classifier
% author: Adam Jaamour (aj645)
clear all;
clc;


%% Image paths
imagedir = '../images';
verifyImageDir(imagedir);
imagedir_train = [imagedir '/train'];
imagedir_test = [imagedir '/test'];
imagedir_extra = [imagedir '/extra'];


%% Train classifier with training set of binary images
N = 10; % = number of lowest frequencies to keep
train(imagedir_train, N);


%% Test classifier with new testing set of binary images
confusion_matrix = getConfusionMatrix(imagedir_test);
disp(confusion_matrix);
disp(' ');


%% Extra testing: testing image not in set of classes
imagepath1 = ([imagedir_extra '/hand001.png']);
c1 = classify(imagepath1);
disp(strjoin(['Test 1. Image not in sets of classes. Class = Hand. Classified as : ' c1])); disp(' ');


%% Extra testing: testing image identical to one of images from training set
imagepath2 = ([imagedir_train '/Arrow001.gif']);
c2 = classify(imagepath2);
disp(strjoin(['Test 2. Image from training set. Image = Arrow001. Classified as : ' c2])); disp(' ');


%% Extra testing: testing image own picture converted to binary
%imagepath3 = ([imagedir_train '/Arrow001.gif']);
%c3 = classify(imagepath3);
%disp(strjoin(['Test 2. Image from training set. Image = Arrow001. Classified as : ' c3])); disp(' ');