clear;
clc;

%% Generate random data to test MeanMatrix and CovarianceMatrix functions
data = rand(5,5);

%% Run chain code script on a input image
%run chain/chainCodeScript

%% Calculate mean of input data
myMean = MeanMatrix(data);
rMean = mean(data);

%% Calculate covariance of input data
myCov = CovarianceMatrix(data);
rCov = cov(data);