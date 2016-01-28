%AUTHOR: SUMANTH SRINIVASAN

%imagePath = input('Enter the image filename along with path');

a = imread('sample.jpg');
disp('Creating grayscale image...');
bw = rgb2gray(a);
imwrite(bw,'grayscale.jpg')
disp('Done.')
dim = size(a);

disp('Creating negative of the grayscale image')
%To create negative grayscale image
for x = 1:dim(1)
    for y = 1:dim(2)
        neg(x,y) = 255 - a(x,y);
    end
end
disp('Done.')
imwrite(neg,'negative.jpg')
disp('Computing histogram of the grayscale image')
tic
computeHist(bw)
tot_time = toc
disp('Done.')







       