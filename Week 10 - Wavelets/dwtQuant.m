function [ nonZero, PSNR, outImg] = dwtQuant( x,wname, stepsize )
%dwtQuant A function that quantizes wavelet coefficients
   
% A holds the approximation coefficients of the topmost level of the
% multiresolution pyramid
% D,H and V are each an array of coefficients, each for level.
% NOTE - Level 1 corresponds to the bottom level i.e., image in origional
% resolution

% Perform 3 level DWT
[A1, V1, H1, D1] = dwt2(x,wname);
[A2, V2, H2, D2] = dwt2(A1,wname);
[A3, V3, H3, D3] = dwt2(A2,wname);


% Quantize all coefficients with a uniform quantizer for given step size
% REFERNCE - https://cs.stanford.edu/people/eroberts/courses/soco/projects/data-compression/lossy/jpeg/coeff.htm

% Using floor() Function instead of round() in order to push towards using
% fewer bits


% Level 1
dim1 = size(V1);
for i = 1:dim1(1)
    for j = 1:dim1(2)
        if i == 1 && j == 1
            mean = 128;
        else
            mean = 0;
        end
% quantA1 = floor(A1(:,:)/stepsize)*stepsize;
    quantV1(i,j) = floor((V1(i,j)-mean+0.5*stepsize)/stepsize)*stepsize+mean;
    quantH1(i,j) = floor((H1(i,j)-mean+0.5*stepsize)/stepsize)*stepsize+mean;
    quantD1(i,j) = floor((D1(i,j)-mean+0.5*stepsize)/stepsize)*stepsize+mean;
    end
end
% Level 2
dim2 = size(V2);
for i = 1:dim2(1)
    for j = 1:dim2(2)
        if i == 1 && j == 1
            mean = 128;
        else
            mean = 0;
        end
% quantA2 = floor(A2(:,:)/stepsize)*stepsize;
    quantV2(i,j) = floor((V2(i,j)-mean+0.5*stepsize)/stepsize)*stepsize+mean;
    quantH2(i,j) = floor((H2(i,j)-mean+0.5*stepsize)/stepsize)*stepsize+mean;
    quantD2(i,j) = floor((D2(i,j)-mean+0.5*stepsize)/stepsize)*stepsize+mean;
    end
end

% Level 3
dim3 = size(V3);
for i = 1:dim3(1)
    for j = 1:dim3(2)
        if i == 1 && j == 1
            mean = 128;
        else
            mean = 0;
        end
% quantA1 = floor(A1(:,:)/stepsize)*stepsize;
    quantA3(i,j) = floor((A3(i,j)-mean+0.5*stepsize)/stepsize)*stepsize+mean;
    quantV3(i,j) = floor((V3(i,j)-mean+0.5*stepsize)/stepsize)*stepsize+mean;
    quantH3(i,j) = floor((H3(i,j)-mean+0.5*stepsize)/stepsize)*stepsize+mean;
    quantD3(i,j) = floor((D3(i,j)-mean+0.5*stepsize)/stepsize)*stepsize+mean;
    end
end


% Reconstruct image from quantized coefficients

quantA2 = idwt2(quantA3,quantV3,quantH3,quantD3,wname);
quantA2 = floor(quantA2);
quantA1 = idwt2(quantA2,quantV2,quantH2,quantD2,wname);
quantA1 = floor(quantA1);
outImg = idwt2(quantA1,quantV1,quantH1,quantD1,wname);


% Count number of non-zero coefficients after quantization, compute PSNR

% Counting number of nonZero approximation coefficients after quantization in the bottom level
dim = size(quantA1);
nonZero = 0;
for i = 1:dim(1)
    for j = 1:dim(2)
        if quantA1(i,j) ~= 0
            nonZero = nonZero+1;
        else
            continue;
        end
    end
end
disp('Number of Non-Zero Coefficients: ');
disp(nonZero);

% Computing PSNR
PSNR = psnr(outImg,double(x));
disp('PSNR: ');
disp(PSNR);
% Show original and quantized image

subplot(1,2,1), imshow(uint8(x)); title('Original');
subplot(1,2,2), imshow(uint8(outImg)); title('Quantized');
end

