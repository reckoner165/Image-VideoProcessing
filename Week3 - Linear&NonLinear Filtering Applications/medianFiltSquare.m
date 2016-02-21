%medianFiltSquare.m

function [ outImg ] = medianFiltSquare( img, dim )
%Convolves the image with the median filter matrix of a given
%dimension
%   
filt = ones(dim,dim);
outImg = img;
dimImg = size(img);
dimFilt = size(filt);
imgBoundary = (dimFilt - 1)*0.5;
disp('Beginning Convolution')
for i = imgBoundary(1) + 1:dimImg(1) - imgBoundary(1)
    for j = imgBoundary(2) + 1:dimImg(2) - imgBoundary(2)
        temp = 0;

        outImg(i,j) = median(median(img(i-imgBoundary(1):i+imgBoundary(1),j-imgBoundary(2):j+imgBoundary(2)).*filt,1),2);
%         wait = waitbar((i*j)/(dimImg(1)*dimImg(2)))
    end
end
clear wait;
disp('Convolution complete.')
%fin.
end

