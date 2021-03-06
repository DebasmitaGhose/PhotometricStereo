function imArray = prepareData(imArray, ambientImage)
% PREPAREDATA prepares the images for photometric stereo
%   OUTPUT = PREPAREDATA(IMARRAY, AMBIENTIMAGE)
%
%   Input:
%       IMARRAY - [h w n] image array
%       AMBIENTIMAGE - [h w] image 
%
%   Output:
%       OUTPUT - [h w n] image, suitably processed
%
% Author: Subhransu Maji
%
ch=size(imArray,3);
% Implement this %
% Step 1. Subtract the ambientImage from each image in imArray
% Step 2. Make sure no pixel is less than zero
% Step 3. Rescale the values in imarray to be between 0 and 1
for i=1:ch
    imArray(:,:,i) = imArray(:,:,i)-ambientImage(:,:);
    imArray(imArray(:,:)<0) = 0;
    %disp(size(output));
    imArray(:,:,i) = imArray(:,:,i)./max(max(imArray(:,:,i)));
    %disp(max(max(imArray(:,:,i))));
end
%disp(imArray);



