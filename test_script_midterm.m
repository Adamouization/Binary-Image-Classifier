% This script tests to see if the supplied functions meet the mid point
% assessment. 

% There are two test for the covariance matrix - one assumes (1/n) is used, 
% the other assumes (1/n-1) is used. For this midterm, we do not mind which
% one you use.

clear all;
clc;

D = rand(11,6);

tolerance = 0.01; 

%%Mean vector test
if exist('calcMean')
  diff = calcMean(D) - mean(D, 1);
  sumDiff = sum(abs(diff(:)));
  if sumDiff < tolerance
    disp('calcMean appears to be correct.');
  else
    disp('calcMean does not appear to be correct.');
  end
else
  disp('Missing function calcMean');
end

%%Covariance matrix test (1/n)
if exist('calcCov')
  diff = calcCov(D) - cov(D, 1);
  sumDiff = sum(abs(diff(:)));
  if sumDiff < tolerance
    disp('calcCov (1/n) appears to be correct.');
  else
    disp('calcCov (1/n) does not appear to be correct.');
  end
else
  disp('Missing function calcCov');
end

%%Covariance matrix test (1/n-1)
if exist('calcCov')
  diff = calcCov(D) - cov(D);
  sumDiff = sum(abs(diff(:)));
  if sumDiff < tolerance
    disp('calcCov (1/n-1) appears to be correct.');
  else
    disp('calcCov (1/n-1) does not appear to be correct.');
  end
else
  disp('Missing function calcCov');
end