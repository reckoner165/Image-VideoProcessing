%% Homework 2

%% Problem 1
% Write a Matlab for implementing filtering of a gray scale image. Your
% program should allow you to specify the filter with an arbitrary size
% (but for simplicity, you can assume the filter size is KxL where both K
% and L are odd numbers, and the filter origin is at the center.


inImg = imread('barbara_gray.bmp');
grayImg=single(inImg);

%my_filter=[1 2 1; 2 4 2; 1 2 1];
my_filter = input('Enter the filter as a matrix: ');

%perform convolution

%tmpImg = my_conv2_sol(grayImg, my_filter); %%% here you need to write your own function as my_conv2
tmpImg = computeConv(grayImg, my_filter);

%% scale tmpImg so that it ranges in 0 to 255 and is stored in uint8
% function my_mat2gray(img) returns an image that ranges 0 to 1

filteredImg=uint8(255*my_mat2gray(tmpImg)); 


%% iv) display the original and the filtered images. you can use imshow for displaying an image.
%% make sure to conver all images into uint8 before dispalying them

cf=figure(1);
subplot(1,2,1); 
imshow(inImg);
title('Original Image');
subplot(1,2,2);
imshow(filteredImg);
title('Filtered Image with Filter 3');

print(cf, 'HW2_Q1', '-dtiff');
