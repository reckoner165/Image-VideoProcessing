close all
clear all
clc
%% Problem 1
% Write your own program or programs which can: a) Down sample an image by
% a factor of 2, without using a prefilter, and with using a filter you
% designed using MATLAB; 

%%% read the image
grayImg = imread('barbara_gray.bmp');


%%%% create the filter
h = fir1(4,0.5);
h = h'*h;

%% filter the image
grayImgFt = conv2(double(grayImg), h, 'same');

%%% resize the image into smaller size
grayImg_d = my_imresize_sol(grayImg, 0.5);
grayImgFt_d = my_imresize_sol(grayImgFt, 0.5);

% Display the images



%%
% b) Up-sample the previously down-sampled images by
% a factor of 2, using the bilinear interpolation and cubic interpolation
% methods, respectively. You should have a total of 4 interpolated images,
% with different combination of down-sampling and interpolation methods.

grayImg_d_bi = my_imresize_sol(grayImg_d, 2, 'bilinear');
grayImg_d_cu = my_imresize_sol(grayImg_d, 2, 'cubic');
grayImgFt_d_bi = my_imresize_sol(grayImgFt_d, 2, 'bilinear');
grayImgFt_d_cu = my_imresize_sol(grayImgFt_d, 2, 'cubic');

% Display the upsampled images


%%
% Your program could either directly display on screen the processed images
% during program execution, or save the processed images as computer files
% for display after program execution. Run your program with the image
% Barbara. Comment on the quality of the down/up sampled images obtained
% with different methods. Note: you should not use the "resize" function in
% Matlab to do this assignment. But you are encouraged to compare results
% of your program with "resize".
