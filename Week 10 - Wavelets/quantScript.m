% quantScript.m

% Read an image
x = imread('hands.jpg');
% Extract grayscale version
ycbcr = rgb2ycbcr(x);

gray = ycbcr(:,:,1);
% imshow(gray);
% APply function
[nonZ, PSNR, out] = dwtQuant(gray,'db45',71);