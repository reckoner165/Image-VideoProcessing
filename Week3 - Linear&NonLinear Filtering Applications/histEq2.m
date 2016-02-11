%histEq.m
%AUTHOR: SUMANTH SRINIVASAN

function [EqImg] = histEq2(img)
%Histogram Equalization
%   Equalizes the non-uniform distribution of histogram

dim = size(img);

h = computeHist(img);
h = h/(dim(1)*dim(2));


% Computing Mapping Fn proportional to Cumulative Dist Fn

map = zeros(256,1);
for k = 1:256
    map(k)=uint8(sum(h(1:k))*255);
end;

% figure; subplot(2,1,1), plot(map); title('Mapping function'); subplot(2,1,2), bar(h,'g'); title('Histogram');


% Mapping
% tic
% for x = 1:dim(1)
%     for y = 1:dim(2)
%         f = double(img(x,y))+1;
%         histEqImg(x,y) = C(f);
%     end;
% end;

EqImg = map((img)+1);
% tot_timeMap = toc

% figure;
% imshow(uint8(EqImg));
% imwrite(uint8(EqImg),'lena_Hist_Equalized.jpg')
        
end

