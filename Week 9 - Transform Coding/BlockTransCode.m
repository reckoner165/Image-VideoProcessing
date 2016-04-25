% DCT


img = double(imread('barbara.bmp'));

% Parameterizing scaling Factor
fact = [0.5 1 2 4 8];

% JPEG standard quantization table
quantM = [16 11 10 16 24 40 51 61;... 
         12 12 14 19 26 58 60 55;... 
         14 13 16 24 40 57 69 56;...
         14 17 22 29 51 87 80 62;...
         18 22 37 56 68 109 103 77;...
         24 35 55 64 81 104 113 92;...
         49 64 78 87 103 121 120 101;...
         72 92 95 98 112 100 103 99];
     
PSNR = cell(1,length(fact));
dctImg = cell(1,length(fact));
DCTfn = @(block) dct2(block.data);

% Block Processing
dctBlock = blockproc(img,[8 8], DCTfn);

for i = 1:length(fact)
    Q = quantM.*fact(i);
    
    
    DCTfn = @(block) floor((block.data + Q/2)./Q);
    dctI = blockproc(dctBlock,[8 8],DCTfn);
    dctImg{i} = dctI;
    
    PSNR{i} = psnr(dctI, img);
  
    inDCTfn = @(block) floor(block.data.*Q);
    
    iqDCTImg = blockproc(dctI,[8 8],inDCTfn);
    
%     Generating Quantized Image Block

dctBlockFn = @(block) floor(idct2(block.data));
qblock = blockproc(iqDCTImg,[8 8], dctBlockFn);

% Reconstructions
figure(1)
subplot(3,2,i); imshow(qblock,[]); 
str = sprintf('Scaling Factor: %g',fact(i)); 
title(str); 

end

% Count Zero Coefficients

count = cell(1,length(fact));
npix = cumprod(size(img));

for k = 1:size(dctImg,2)
    t = 0;
    for i = 1:size(img,1)
        for j = 1:size(img,2)
            if dctImg{k}(i,j) ~= 0
                t = t+1;
            end
        end
    end
    count{k} = t;
end

avgCount = cell(1,length(fact));

K = npix(2)/64;

for i = 1:length(fact)
    avgCount{i} = count{i}/K;
end

% Plotting error/distortion

PSNR = cell2mat(PSNR);
avgCount = cell2mat(avgCount);
count = cell2mat(count);

figure(2);

subplot(1,3,1); plot(fact,PSNR); 
xlabel('Scaling Factor'); ylabel('PSNR'); 

subplot(1,3,2); plot(fact,avgCount); 
xlabel('Scaling Factor'); ylabel('Coeffs per block'); 

subplot(1,3,3); plot(avgCount,PSNR); 
xlabel('Coeffs per block'); ylabel('PSNR');
    
           
    
    
