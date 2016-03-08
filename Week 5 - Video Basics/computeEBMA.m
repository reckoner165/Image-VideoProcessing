function [ xm, ym, matchblock] = computeEBMA(template,img,x0,y0,Rx,Ry)

% A function that jumps in increments of Rx and Ry across a given image and
% superimposes the template to find out best match.

%Compute dimensions
    [H, W] = size(img);    
    [bH, bW] = size(template);
   
%Initialize values
    maxError = bH*bW*255;
    xm = x0; ym = y0;
    matchblock = 0;
    for k = (max(1,x0-Rx):min(W-bW,x0+Rx))
        for l = (max(1,y0-Ry):min(H-bH,y0+Ry))
            %Initialize a candidate block with the same size as the template
            candidate = img(l:l+bH-1,k:k+bW-1);
            error = sum(sum(abs(template-candidate)));%Absolute Difference
            
            %Minimize error with every iteration
            if error < maxError
                xm = k; 
                ym = l;
                matchblock = candidate;
                maxError = error;

            end
        end
    end

end

