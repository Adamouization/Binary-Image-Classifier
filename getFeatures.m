% returns N features as a row vector
function [features] = getFeatures(imagePath,N)
    %% Image
    im = imread(imagePath);
    im = logical(im); %Convert the original intensity values into logical 1s and 0s

    %% Calculate chain code
    c = chainCode(im);

    %% filter using the FT of the angles of the chaincode
    angles = c(3,:)*(2*pi/8);
    anglesFFT = fft(angles); %fast fourier transform

    % Filter using a 'top hat' filter. The filter consists of the value one for 
    %the lowest Nfrequencies and zero elsewhere.
    filter = zeros(size(angles)); 

    %Both the positive and negative low frequencies must be kept
    %filter(1) is the zero (DC) frequency, so there will be (N*2)-1 ones in
    %total
    filter(1:N) = 1; 
    filter(end-N+2:end) = 1;

    filteredFFT = fftshift(abs(anglesFFT .* filter)); % Apply the filter by scalar multiplication 
    
    length = size(filteredFFT,2);
    middle = length/2;
    if(filteredFFT(middle) < filteredFFT(middle+1))
        middle = middle + 1;
    end
    
    features = filteredFFT(middle:middle+N-1);
end