img = double(imread('lena_gray.bmp'));
dim = size(img);

Hx = 0.25*[-1 -2 -1;0 0 0;1 2 1];
Hy = 0.25*[-1 0 1;-2 0 2;-1 0 1];

fx = computeConv(img,Hx);
fy = computeConv(img,Hy);

edge = zeros(dim(1),dim(2));
for x=1:dim(1)
    for y=1:dim(2)
        edge(x,y) = sqrt((fx(x,y)^2)+(fy(x,y)^2));
%         if fx(x,y) >= 15
%             fx(x,y) = 255;
%         else
%             fx(x,y) = 15;
%         end
%         
%         if fy(x,y) >= 15
%             fy(x,y) = 255;
%         else
%             fy(x,y) = 15;
%         end
    end
end
% fx = histEq2(fx);
% fy = histEq2(fy);
% imshow(uint8(fx)); 
% figure; imshow(uint8(fy));figure;
% imshow(uint8(fx+fy));
imshow(uint8(edge))
imwrite(uint8(edge),'edge_lena.bmp');