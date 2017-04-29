% Returns N features as a row vector
function [ features ] = getFeatures( image_path , N)
    %% Input an image, 
    im = imread(image_path);
    im = logical(im); %Convert the original intensity values into logical 1s and 0s

    %%Find the perimeter pixels and the chain code

    %% Calculate and draw the chain code
    c = chainCode(im);

    % The first and second rows of 'c' contain the x and y co-ordinates; the
    % third row contains the chain code, from 0 meaning vertically right, 1  
    % meaning diagonally down and right, clockwise to 7 meaning diagonally up
    % and right

    %% filter using the FT of the angles of the chaincode
    angles = c(3,:)*(2*pi/8);
    anglesFFT = fft(angles); %fast fourier transform

    % Filter using a 'top hat' filter. The filter conists of the value one for 
    %the lowest Nfrequencies and zero elsewhere.
    %number of lowest frequencies to keep
    filter = zeros(size(angles)); 

    %Both the positive and negative low frequencies must be kept
    %filter(1) is the zero (DC) frequency, so there will be (N*2)-1 ones in
    %total
    filter(1:N+3) = 1; 
    filter(end-N+3:end) = 1;
    %filter(1) = 0;

    filteredFFT = anglesFFT .* filter; % AIpply the filter by scalar multipliacation

    %Reconstructed the angles using the inverse FFT
    %The FFT works with imaginary numbers. Since all the numbers in the chain
    %code are real, the reconstruction should be real too.
    % reconstructedAngles = real(ifft(filteredFFT));
    absFiltered = real(abs(filteredFFT)); 

    % transpose features 
    features = (absFiltered(2:N+1))';

end

