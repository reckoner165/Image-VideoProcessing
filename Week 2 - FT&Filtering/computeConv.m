%computeConv.m

function [ outImg ] = computeConv( img, filt )
%UNTITLED Convolutes the image with the filter matrix
%   
outImg = img;
dimImg = size(img);
dimFilt = size(filt);
imgBoundary = (dimFilt - 1)*0.5
disp('Beginning Convolution')
for i = imgBoundary(1) + 1:dimImg(1) - imgBoundary(1)
    for j = imgBoundary(2) + 1:dimImg(2) - imgBoundary(2)
        temp = 0;
%         for k = -imgBoundary(1):imgBoundary(1)
%             for l = -imgBoundary(2):imgBoundary(2)
%                 temp = temp + img(i-k,j-l)*filt(k+imgBoundary(1)+1,l+imgBoundary(2)+1);
%             end
%         end
        
%         outImg(i,j) = temp;
        outImg(i,j) = sum(sum(img(i-imgBoundary(1):i+imgBoundary(1),j-imgBoundary(2):j+imgBoundary(2)).*filt));
    end
end
disp('Convolution complete.')
%fin.
end

