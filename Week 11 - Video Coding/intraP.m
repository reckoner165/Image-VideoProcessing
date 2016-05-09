function [ eIntra, varIntra, fIntra ] = intraP(f)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% Intra Prediction

dim = size(f);

%Downsampling
for m = 1:dim(1)/2-1
    for n = 1:dim(2)/2-1
        % Downsampling with an averaging filter
        fd1(m,n)=(f(2*m,2*n) + f(2*m,2*n +1) + f(2*m+1,2*n) + f(2*m+1,2*n+1))/4;
    end
end

dim = size(fd1);
fd1 = [fd1 zeros(dim(2),1)];
fd1 = [fd1; zeros(1,dim(1)+1)];

fIntra = image2Upsample(fd1, 'bicubic');

eIntra = f - fIntra;

varIntra = var(var(eIntra));
end

