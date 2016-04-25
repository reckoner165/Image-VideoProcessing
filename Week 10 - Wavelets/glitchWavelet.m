img1 = imread('dali1.jpg');
img2 = imread('dali2.jpg');


[a,v,h,d] = dwt2(img1,'db45');
[A,V,H,D] = dwt2(img2,'db45');

out1 = idwt2(a,3*V,3*H-A,A,'db45');
out2 = idwt2(A,a,2*h,2*d,'db45');

subplot(1,2,1), imshow(uint8(out1)); subplot(1,2,2), imshow(uint8(out2));

imwrite(uint8(out1),'3.jpg');
imwrite(uint8(out2),'4.jpg');