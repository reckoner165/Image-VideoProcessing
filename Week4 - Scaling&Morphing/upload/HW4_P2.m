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
img2 = imread('tilt_lena.jpg');

% mPoints = zeros(4,2);
% fPoints = zeros(4,2);
%%
% ii) select corresponding feature points (more than 3) in these two images
% (You can use cpselect() function;

cpselect(img2, img1);

% disp(fPoints);
% disp(mPoints);

A = [[1;1;1;1] fPoints];
x = mPoints(:,1);
y = mPoints(:,2);
p = transpose(A);
a = inv(p*A)*p*x;
b = inv(p*A)*p*y;

invA = inverse(A);
%%
% iii) determine the affine transform between the two images;

tForm = [a(2) b(2) 0; a(3) b(3) 0; a(1) b(2) 1];
tA = tForm(1:2,1:2);
tB = [tForm(3,1); tForm(3,2)];
% tForm = my_cp2tform_sol(input_points, base_points);

% Do the least square equations here with fixed and moving points to get
% the a matrix -- get the affine matrix


%%
% iV) apply affine transform to one image so that it is aligned with the
% other image. Please note that you should not use the "cp2tform" or
% "imtransform()" function in MATLAB. You should write your own program,
% which can call "interp2()". 
index = 1;
for x = 1:dim(1)
    for y = 1:dim(2)
        X = [x;y];
        U = inv(tA)*(X-tB);
        UI(index) = U(1);
        VI(index) = U(2);
        index = index+1;
    end
end
[X,Y] = meshgrid(1:dim(1),1:dim(2));
outImg = interp2(X,Y,double(img1),UI,VI,'linear');
        
        

[nRow, nCol] = size(img1);
img1_recover = uint8(zeros(size(grayImg)));
img1_recover(1:nRow,1:nCol) = img1;

img2_recover = uint8(zeros(size(grayImg)));
img2_recover(1:nRow,1:nCol) = img2;
img2_recover = my_imtransform_sol(img2_recover, tForm);
% Above line, use a substitute for imtransform.

% display the final results

imshow(img2_recover);

%%
% Compare your results with that obtained using the "cp2tform" and
% "imtransform()".


%% Problem 3 (optional) 
% Implement a program for image morphing.
