close all
clear all
clc
%% Problem 2
% Computer assignment: Write a matlab program that implements the following
% steps:i) Read in two images that are taken of the same scene but at
% slightly different angles;  

grayImg = imread('lena_gray.bmp');

%%
% Generate testing images

% Add translation
len = 100;
img1 = grayImg(:,1:end-len); 
img2 = grayImg(:,1+len:end); 

%%%% display original and translated images


% Add rotation
theta = pi/6;
T = [cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1];
G = maketform('affine', T);

%{
expect affine fForm: [a1 b1 0; a2 b2 0; a0 b0 1]
tForm = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 100 0 1];
%}

img2 = my_imtransform_sol(img2, T);
% img2 = imtransform(img2, G);

%%%% display original and rotated images 


%%
% ii) select corresponding feature points (more than 3) in these two images
% (You can use cpselect() function;

% cpselect(img2, img1);


%%
% iii) determine the affine transform between the two images;

% tForm = my_cp2tform_sol(input_points, base_points);


%%
% iV) apply affine transform to one image so that it is aligned with the
% other image. Please note that you should not use the "cp2tform" or
% "imtransform()" function in MATLAB. You should write your own program,
% which can call "interp2()". 

[nRow nCol] = size(img1);
img1_recover = uint8(zeros(size(grayImg)));
img1_recover(1:nRow,1:nCol) = img1;

% img2_recover = uint8(zeros(size(grayImg)));
% img2_recover(1:nRow,1:nCol) = img2;
% img2_recover = my_imtransform_sol(img2_recover, tForm);

% display the final results



%%
% Compare your results with that obtained using the "cp2tform" and
% "imtransform()".


%% Problem 3 (optional) 
% Implement a program for image morphing.
