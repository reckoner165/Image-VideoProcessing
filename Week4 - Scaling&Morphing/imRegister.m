% imRegister.m
% Script to import two images, select common features from both and use
% least square solution

grayImg = imread('lena_gray.bmp');

len = 100;
img1 = grayImg(:,1:end-len); 
img2 = imread('tilt_lena.jpg');

cpselect(img2, img1);

% Organizing the points into matrix to obtain Least Square Solution for the
% affine matrix
A = [[1;1;1;1] fixedPoints];
x = movingPoints(:,1);
y = movingPoints(:,2);
p = transpose(A);
a = inv(p*A)*p*x;
b = inv(p*A)*p*y;

% invA = inverse(A);

% affine transform between the two images;

tForm = [a(2) b(2) 0; a(3) b(3) 0; a(1) b(2) 1];
tA = tForm(1:2,1:2);
tB = [tForm(3,1); tForm(3,2)];

% apply affine transform to obtain mapped co-ordinates.
% (buggy)
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

%Interpolation to realize the image
[X,Y] = meshgrid(1:dim(1),1:dim(2));
outImg = interp2(X,Y,double(img1),UI,VI,'linear');
        
        
