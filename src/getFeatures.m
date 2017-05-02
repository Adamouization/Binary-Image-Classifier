% Returns N features as a row vector
function [features] = getFeatures(image_path ,N)

    %% Input an image, 
    im = imread(image_path);
    im = logical(im); %Convert the original intensity values into logical 1s and 0s


    %% Calculate and draw the chain code
    % The 1st and 2nd rows of 'c' contain the x and y co-ordinates,
    % the 3rd row contains the chain code:
    %       from 0 meaning vertically right, 
    %       1 meaning diagonally down and right, 
    %       clockwise to 7 meaning diagonally up and right.
    c = chainCode(im);
    

    %% Filter using the FT of the angles of the chaincode
    angles = c(3,:)*(2*pi/8);
    anglesFFT = fft(angles); %fast fourier transform

    % Filter using a 'top hat' filter. 
    % The filter conists of the value:
    %       1 for  the lowest N frequencies,
    %       0 elsewhere.
    % number of lowest frequencies to keep:
    filter = zeros(size(angles)); 

    % Both the positive and negative low frequencies must be kept
    % filter(1) is the zero (DC) frequency, so there will be (N*2)-1 ones in total
    filter(3:N+2) = 1;

    filteredFFT = anglesFFT .* filter; % Apply the filter by scalar multipliacation

    % The FFT works with imaginary numbers but since all the numbers in the chain
    % code are real, the reconstruction should be real too.
    absFiltered = real(abs(filteredFFT)); 

    features = (absFiltered(3:N+2))'; % transpose features 

end

