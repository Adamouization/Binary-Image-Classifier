clear;
clc;

imagedir = 'images';
verifyImageDir(imagedir);
imagepath = [imagedir '/train/Butterfly042.gif'];

N = 20; % = number of lowest frequencies to keep

features = getFeatures(imagepath,N);
disp(features);