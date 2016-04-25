% Comparison Script

% Read an image
x = imread('hands.jpg');
% Extract grayscale version
ycbcr = rgb2ycbcr(x);

gray = ycbcr(:,:,1);

% Initializing 
stepsize = [1 4 16 32];

nonZeroH = zeros(1,length(stepsize));
PSNRH = zeros(1,length(stepsize));

nonZeroDB = zeros(1,length(stepsize));
PSNRDB = zeros(1,length(stepsize));

% Computing Non-Zero and PSNR values
for i = 1:length(stepsize)
[nonZeroH(i), PSNRH(i), outH] = dwtQuant2(gray,'haar',stepsize(i));
[nonZeroDB(i), PSNRDB(i), outDB] = dwtQuant2(gray,'db25',stepsize(i));
end

figure;
hold on;
plot(stepsize,nonZeroH/(10^4));
plot(stepsize,nonZeroDB/(10^4));
plot(stepsize,PSNRH);
plot(stepsize,PSNRDB);
xlabel('Stepsize')

legend('Non-Zero Count (Haar) x10^4','Non-Zero Count (db25) x10^4','PSNR (Haar)','PSNR (db25)');


