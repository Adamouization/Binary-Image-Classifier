% Returns N features as a row vector
function [features] = getFeatures(imagePath,N)
    %% Read input image
    im = imread(imagePath);
    im = logical(im); %Convert the original intensity values into logical 1s and 0s

    %% Calculate chain code
    c = chainCode(im);

    %% Filtering
    % Filter using the FT of the angles of the chaincode
    angles = c(3,:)*(2*pi/8);
    anglesFFT = fft(angles);

    % Filter using a 'top hat' filter. The filter consists of:
    %       _the value one for the lowest N frequencies
    %       _zero elsewhere.
    filter = zeros(size(angles)); 

    %Both the positive and negative low frequencies must be kept
    %filter(1) is the zero (DC) frequency, so there will be (N*2)-1 ones in total
    filter(1:N) = 1; 
    filter(end-N+2:end) = 1;

    filteredFFT = fftshift(abs(anglesFFT .* filter)); % Apply the filter by scalar multiplication 
    
    %% Reformatting
    % Create a new row vector with only needed elements (of size N)
    length = size(filteredFFT,2);
    middle = length/2;
    if(filteredFFT(middle) < filteredFFT(middle+1))
        middle = middle + 1;
    end
    
    %% Return
    features = filteredFFT(middle:middle+N-1);
end