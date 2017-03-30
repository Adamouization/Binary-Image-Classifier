clear;
clc;

%% Load image
imagedir = 'images';
verifyImageDir(imagedir);
imagepath = [imagedir '/train/Butterfly042.gif'];

%% Get feature vectors
N = 30; % = number of lowest frequencies to keep

features = getFeatures(imagepath,N);
disp(features);