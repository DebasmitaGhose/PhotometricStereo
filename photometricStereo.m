function [albedoImage, surfaceNormals] = photometricStereo(imArray, lightDirs)
height=size(imArray,1);
width=size(imArray,2);
channel=size(imArray,3);
g=zeros(height,width,3);
p=reshape(imArray,height*width,channel);
p=p';
g=lightDirs\p;
g=g';
albedoImage=zeros(height,width);
g=reshape(g,height,width,3);
surfaceNormals=zeros(height,width,3);
for i=1:height
    for j=1:width  
              vectors=g(i,j,:).*g(i,j,:);
              dot_p=sum(vectors);
              albedoImage(i,j) = sqrt(dot_p); 
              surfaceNormals(i,j,:)=g(i,j,:)./albedoImage(i,j);
    end    
end
% PHOTOMETRICSTEREO compute intrinsic image decomposition from images
%   [ALBEDOIMAGE, SURFACENORMALS] = PHOTOMETRICSTEREO(IMARRAY, LIGHTDIRS)
%   comptutes the ALBEDOIMAGE and SURFACENORMALS from an array of images
%   with their lighting directions. The surface is assumed to be perfectly
%   lambertian so that the measured intensity is proportional to the albedo
%   times the dot product between the surface normal and lighting
%   direction. The lights are assumed to be of unit intensity.
%-
%   Input:
%       IMARRAY - [h w n] array of images, i.e., n images of size [h w]
%       LIGHTDIRS - [n 3] array of unit normals for the light directions
%
%   Output:
%        ALBEDOIMAGE - [h w] image specifying albedos
%        SURFACENORMALS - [h w 3] array of unit normals for each pixel
%
% Author: Subhransu Maji
%
% Acknowledgement: Based on a similar homework by Lana Lazebnik


%%% implement this %% 

            
            