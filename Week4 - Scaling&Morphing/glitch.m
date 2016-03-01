
grayImg = imread('lena_gray.bmp');

%%
% Generate testing images

% Add translation
len = 100;

img2 = grayImg(:,1+len:end); 

%%%% display original and translated images


% Add rotation
theta = pi/6;
T = [ 0 0; 0 0.753 0; 0 0 1];
G = maketform('custom', T);


img2 = imtransform(img2, G);

subplot(1,2,1), imshow(uint8(grayImg)); subplot(1,2,2), imshow(uint8(img2));