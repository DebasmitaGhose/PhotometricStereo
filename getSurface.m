function  heightMap = getSurface(surfaceNormals, method)

h=size(surfaceNormals,1);
w=size(surfaceNormals,2);
n=size(surfaceNormals,3);
fx=zeros(h,w);
fy=zeros(h,w);

for i=1:h
    for j=1:w
        fx(i,j)=surfaceNormals(i,j,1)./surfaceNormals(i,j,3);
        fy(i,j)=surfaceNormals(i,j,2)./surfaceNormals(i,j,3);   
    end
end

switch method
    case 'column'
        for k=1:h
            for m=1:w
                heightMap(k,m) = sum(fy(1:k,1))+sum(fx(k,1:m));
            end
        end
          
        %%% implement this %%%
    case 'row'
        %%% implement this %%%
        for k=1:h
            for m=1:w
                heightMap(k,m) = sum(fx(1,1:m))+sum(fy(1:k,m));
            end
        end
    case 'average'
        %%% implement this %%%
        for k1=1:h
            for m1=1:w
                heightMap_row(k1,m1) = sum(fy(1:k1,1))+sum(fx(k1,1:m1));
            end
        end
        for k2=1:h
            for m2=1:w
                heightMap_column(k2,m2) = sum(fx(1,1:m2))+sum(fy(1:k2,m2));
            end
        end
        heightMap=(heightMap_row+heightMap_column)/2;
           case 'random'
                r=randi(1,2,3);
        
                switch r
                    %row
                    case 1
                        for k=1:h
                            for m=1:w
                                heightMap(k,m) = sum(fx(1,1:m))+sum(fy(1:k,m));
                            end
                        end
        
                   % column
                    case 2
                         for k=1:h
                             for m=1:w
                                heightMap(k,m) = sum(fy(1:k,1))+sum(fx(k,1:m));
                             end
                          end
                     %average
                    case 3
                        for k1=1:h
                            for m1=1:w
                                heightMap1(k1,m1) = sum(fy(1:k1,1))+sum(fx(k1,1:m1));
                            end
                        end
                        for k2=1:h
                            for m2=1:w
                                heightMap2(k2,m2) = sum(fx(1,1:m2))+sum(fy(1:k2,m2));
                            end
                        end
                        heightMap=(heightMap1+heightMap2)/2;
                end
end
                
     
        
        
        
        
        
        %%% implement this %%%
        
                
% GETSURFACE computes the surface depth from normals
%   HEIGHTMAP = GETSURFACE(SURFACENORMALS, IMAGESIZE, METHOD) computes
%   HEIGHTMAP from the SURFACENORMALS using various METHODs. 
%  
% Input:
%   SURFACENORMALS: height x width x 3 array of unit surface normals
%   METHOD: the intergration method to be used
%
% Output:
%   HEIGHTMAP: height map of object
