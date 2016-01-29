%histEq.m
%AUTHOR: SUMANTH SRINIVASAN

function histEq(img)
%Histogram Equalization
%   Equalizes the non-uniform distribution of histogram

dim = size(img);

h = computeHist(img);
h = h/(dim(1)*dim(2));


% Computing Mapping Fn proportional to Cumulative Dist Fn

C = zeros(256,1);
for k = 1:256
    C(k)=uint8(sum(h(1:k))*255);
end;

figure; subplot(2,1,1), plot(C); title('Mapping function'); subplot(2,1,2), bar(h,'g'); title('Histogram');


% Mapping
tic
% for x = 1:dim(1)
%     for y = 1:dim(2)
%         f = double(img(x,y))+1;
%         histEqImg(x,y) = C(f);
%     end;
% end;

histEqImg = C(double(img)+1);
tot_timeMap = toc

figure;
imshow(uint8(histEqImg));
imwrite(uint8(histEqImg),'lena_Hist_Equalized.jpg');

        
end

