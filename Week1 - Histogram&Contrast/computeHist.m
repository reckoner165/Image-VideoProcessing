%computeHist.m
%AUTHOR: SUMANTH SRINIVASAN

function [h] = computeHist(img)
%A function to compute the histogram of an imported image
% WORKS ONLY FOR GRAYSCALE OR MONOCHROME IMAGES AT THE MOMENT
histo = zeros(256,1);
 for x = 0:255
    histo(x+1) = sum(sum(img == x));
 end

% figure
% plot(histo);

h = histo;

end

