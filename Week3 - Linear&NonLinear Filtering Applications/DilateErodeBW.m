% DilateErode.m
%  Problem 4
%  Script takes a grayscale image and exports eroded and dilated versions of it.
img = rgb2gray(imread('nyc.jpg'));
se = strel('square',3);
dilate = imdilate(img,se);
erode = imerode(img,se);
subplot(2,1,1),imshow(dilate);subplot(2,1,2),imshow(erode);
imwrite(dilate,'dilateNYC2.jpg');
imwrite(erode,'erodeNYC2.jpg');

