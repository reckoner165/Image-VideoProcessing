%ReSample.m

%Script to downsample and then upsample the image by factors of 2

f = double(imread('barbara.bmp'));
dim = size(f);

%Downsampling
for m = 1:dim(1)/2-1
    for n = 1:dim(2)/2-1
        % Downsamping without pre-filtering
        fd1(m,n)=f(2*m,2*n);
        % Downsampling with an averaging filter
        fd2(m,n)=(f(2*m,2*n) + f(2*m,2*n +1) + f(2*m+1,2*n) + f(2*m+1,2*n+1))/4;
    end
end
subplot(1,2,1), imshow(uint8(fd1)); subplot(1,2,2), imshow(uint8(fd2));
imwrite(uint8(fd1),'Down1.jpg');
imwrite(uint8(fd2),'Down2.jpg');


%Upsampling

outImg1 = image2Upsample(fd1,'bilinear');
outImg2 = image2Upsample(fd1,'bicubic');
outImg3 = image2Upsample(fd2,'bilinear');
outImg4 = image2Upsample(fd2,'bicubic');

imwrite(uint8(outImg1),'hw1.2.1.jpg');
imwrite(uint8(outImg2),'hw1.2.2.jpg');
imwrite(uint8(outImg3),'hw1.2.3.jpg');
imwrite(uint8(outImg4),'hw1.2.4.jpg');