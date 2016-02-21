img = imread('bwNYC.jpg');
se = strel('square',3);
dilate = imdilate(img,se);
erode = imerode(img,se);
subplot(2,1,1),imshow(dilate);subplot(2,1,2),imshow(erode);
