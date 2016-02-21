% Problem 2
% Script to add noise and filter using median filtering. 
noiseLevel=0.01;
inImg = imread('nyc.jpg');
inImg = rgb2gray(inImg);
noisy_img = imnoise(inImg, 'gaussian', 0, noiseLevel);
subplot(3,1,1),imshow(noisy_img);subplot(3,1,2),imshow(uint8(medianFiltSquare(double(noisy_img),3)));subplot(3,1,3),imshow(uint8(medianFiltSquare(double(noisy_img),5)));
imwrite(noisy_img,'prog2/noisy.jpg')
imwrite(uint8(medianFiltSquare(double(noisy_img),3)),'prog2/filter3.jpg')
imwrite(uint8(medianFiltSquare(double(noisy_img),5)),'prog2/filter5.jpg')
