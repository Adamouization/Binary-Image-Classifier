clear;
close all;

% Directory where images can be found---ensure this is correct
imagedir = '../images';

if exist(imagedir, 'dir') == 0
    disp('Error: Image directory set incorrectly');
    return;
end

%% Input an image, 
im = imread([imagedir '/train/Butterfly042.gif']);
im = logical(im); %Convert the original intensity values into logical 1s and 0s

%%Find the perimeter pixels and the chain code

%Show the binary image
figure;
imshow(im);
title('Raw binary image');

%% Calculate and draw the chain code
figure;
imshow(im);
title('Binary image with boundary overlayed');
hold on;
c = chainCode(im);

% The first and second rows of 'c' contain the x and y co-ordinates; the
% third row contains the chain code, from 0 meaning vertically right, 1  
% meaning diagonally down and right, clockwise to 7 meaning diagonally up
% and right

%Plot the chain code
plot( c(1,:), c(2,:), 'r.' );

%Reconstruct the shape from the the chain code itself, ie c(3,:)
coordinates = reconstructChainCode(c(3,:));
figure;
title('Image reconstructed from chain code');
hold on;
plot( coordinates(1,:), coordinates(2,:),'LineWidth',3 );
axis equal;


%% filter using the FT of the angles of the chaincode
angles = c(3,:)*(2*pi/8);
anglesFFT = fft(angles); %fast fourier transform

% Filter using a 'top hat' filter. The filter conists of the value one for 
%the lowest Nfrequencies and zero elsewhere.
N = 30; %number of lowest frequencies to keep
filter = zeros(size(angles)); 

%Both the positive and negative low frequencies must be kept
%filter(1) is the zero (DC) frequency, so there will be (N*2)-1 ones in
%total
filter(1:N) = 1; 
filter(end-N+2:end) = 1;

filteredFFT = anglesFFT .* filter; % Apply the filter by scalar multiplication

%Reconstructed the angles using the inverse FFT
%The FFT works with imaginary numbers. Since all the numbers in the chain
%code are real, the reconstruction should be real too.
%reconstructedAngles = real(ifft(filteredFFT));
reconstructedAngles = real(ifft(abs(filteredFFT))); 

i = 1:length(angles);

%Plot the angles and reconstructed angles.
%Note the effect of filtering
figure;
plot( [i' i'], [angles' reconstructedAngles']);
title('Original chain code angles and reconstructed angles');
xlabel('Position in chain code');
ylabel('Angle');
legend('Original', 'Transformed, filtered and reconstructed') ;


%Now show the filter and its effects in the fourier domain
%%fft shift results in zero-frequences being in the centre
figure;
frequencies = i-floor(length(angles)/2)-1;
plotData = [fftshift(abs(anglesFFT));
            fftshift(abs(filteredFFT)); 
            fftshift(filter)*max(abs(filteredFFT))]; %Scale the filter line
plot(frequencies, plotData);
title('The magnitude of the fourier transform components')
legend('Unfiltered', 'Filtered', 'Filter')
xlabel('Frequency');
ylabel('Magniture');

%% reconstruct from the filtered signal
%Divide by the angles and round to produce the chain code
reconstructedAngles = round(reconstructedAngles/(2*pi/8));
reconstructedCoordinates = reconstructChainCode(reconstructedAngles);

% j = (b <= pi/4) | (b >= 7*pi/4) | (b >= 3*pi/4 & b <= 5*pi/4);
% rho(j) = sqrt(1+ tan(b(j)).^2);
% rho(~j) = sqrt(1+cot(b(~j)).^2);
% v = [cos(b);sin(b)] .* [rho;-rho];
% y = [0;0];
% for i = 2:size(c,2);
%     y(:,i) = y(:,i-1) + v(:,i);
% end

% figure;
% hold on;
% plot( y(1,:), y(2,:),'g' );
% axis equal;
figure;
title(['Image reconstructed from the transformed, filtered and ' ...
      'reconstructred chain code']);
hold on;
plot( reconstructedCoordinates(1,:), reconstructedCoordinates(2,:),'LineWidth',3 );
axis equal;
