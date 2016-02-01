%main.m 
%Main script that imports the image and calls functions to calculate
%histogram and perform histogram equalization

%AUTHOR: SUMANTH SRINIVASAN

a = uint8(imread('lena_low_contrast.jpg'));
a2 = double(a);
disp('Creating grayscale image...');
ycbcr = rgb_to_ycbcr(a2);
bw = uint8(ycbcr(:,:,1));
imwrite(bw,'lena_grayscale.jpg')

dim = size(a);

disp('Creating negative of the grayscale image')
%To create negative grayscale image
for x = 1:dim(1)
    for y = 1:dim(2)
        neg(x,y) = 255 - a(x,y);
    end
end
imwrite(neg,'lena_negative.jpg')
disp('Computing histogram of the grayscale image')
tic
% computeHist(bw);
tot_time = toc
disp('Done.')

histEq(bw);
       