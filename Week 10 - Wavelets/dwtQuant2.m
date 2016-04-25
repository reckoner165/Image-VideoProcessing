function [ nonZero, PSNR, outImg] = dwtQuant2( x,wname, stepsize )
% Function to quantize wavelet coefficients and get PSNR and non-zero
% count for various quantization step sizes.

% Get a 3 level wavelet decomposition
[C S] = wavedec2(x,3,wname);

% Uniform quantization
for i = 1:length(C)
%     Check if first coefficient, in which case use mean = 128
    if i == 1 
        mean = 128;
    else
        mean = 0;
    end
    quantC(i) = floor((C(i)-mean+0.5*stepsize)/stepsize)*stepsize+mean;

end

% Reconstruct using quantized coefficients
outImg = waverec2(quantC,S,wname);

% Counting number of nonZero approximation coefficients after quantization in the bottom level
nonZero = 0;
for i = 1:length(quantC)

        if quantC(i) ~= 0
            nonZero = nonZero+1;
        else
            continue;
        end
end

disp('Number of Non-Zero Coefficients: ');
disp(nonZero);

% Computing PSNR
PSNR = psnr(outImg,double(x));
disp('PSNR: ');
disp(PSNR);

subplot(1,2,1), imshow(uint8(x)); title('Original');
subplot(1,2,2), imshow(uint8(outImg)); title('Quantized');

end