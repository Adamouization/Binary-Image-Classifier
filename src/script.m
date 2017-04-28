clear all;
clc;

%% Image paths
imagedir = '../images';
verifyImageDir(imagedir);
imagedir_train = [imagedir '/train'];
imagedir_test = [imagedir '/test'];

%% Train classifier with training set of binary images
N = 10; % = number of lowest frequencies to keep
train(imagedir_train, N);

%% Test classifier with new testing set of binary images
confusion_matrix = getConfusionMatrix(imagedir_test);
disp(confusion_matrix);