%rgb_to_ycbcr.m
%AUTHOR: SUMANTH SRINIVASAN

function [img2] = rgb_to_ycbcr(img)
%UNTITLED Converts RGB image to YCbCr format
%   Uses the conversion formula that converts every RGB pixel into YCbCr
%   pixel and returns the final image.

offset = [16;128;128];
coeffMatrix = [0.257 0.504 0.098;-0.148 -0.291 0.439;0.439 -0368 -0.071];
dim = size(img);
img2 = zeros(dim(1),dim(2),dim(3));

for x = 1:dim(1)
    for y = 1:dim(2)
        pix = coeffMatrix *[img(x,y,1);img(x,y,2);img(x,y,3)] + offset;
        img2(x,y,:) = pix(:);
    end   
end
imshow(uint8(img2(:,:,1))); title('Grayscale');
end

