img = double(imread('lena_gray.bmp'));
dim = size(img);

Hx = 0.25*[-1 -2 -1;0 0 0;1 2 1];
Hy = 0.25*[-1 0 1;-2 0 2;-1 0 1];

fx = computeConv(img,Hx);
fy = computeConv(img,Hy);

mag = zeros(dim(1),dim(2));


for x=1:dim(1)
    for y=1:dim(2)
        mag(x,y) = sqrt((fx(x,y)^2)+(fy(x,y)^2));
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
% imshow(uint8(mag))
imwrite(uint8(mag),'edge_lena.bmp');

%  thresholding

sortGrad = sort(sort(mag,1,'descend'),2,'descend');
sizeGrad = size(sortGrad);
total = sizeGrad(1)*sizeGrad(2);
T = input('Enter edge threshold value: ');
threshVal = 0;

% for x = 1:sizeGrad(1)
%     for y = sizeGrad(2)
%         k = x*y;
%         if ceil((k/total)*100) ==T
%             threshVal = sortGrad(x,y);
%         else
%             continue
%         end
%     end
% end
breakFlag = 0;
iter = 1;
gradHist = computeHist(mag);
k = dim(1)*dim(2);

gradHist = sort(gradHist,'descend');
transpose(gradHist);
cumHist = cumsum(gradHist);
cumHist = round(ceil(cumHist/cumHist(length(cumHist))*100),-1);

for x = 1:length(gradHist)
    if cumHist(x) == round(T,-1)
        disp('x value');
        disp(x)
        threshVal = x;
        
%         breakFlag = 1;
        break 
    end
end
% x = 1;
% while x <= length(sortGrad) && breakFlag == 0
%     if floor(((x/length(sortGrad))*100)) == T
%         disp(x)
%         threshVal = gradHist(x);
%         breakFlag = 1;  
%         continue;
%     end
%     x = x+1;
% end

 disp(threshVal);
 
 out = zeros(dim(1),dim(2));
 for x=1:dim(1)
    for y=1:dim(2)
        
        if mag(x,y) >= threshVal(1);
            out(x,y) = 255;
        else
            out(x,y) = 0;
        end
        
    end
 end
imshow(uint8(out));