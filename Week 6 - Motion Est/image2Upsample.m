function [ outImg ] = image2Upsample(img, order)
%imageUpsample function upsamples the input image by 2 using bilinear and cubic
%interpolation

dim = size(img);
outImg = zeros(2*dim(1),2*dim(2));

%Bilinear Interpolation
if strcmp(order,'bilinear')
    for m = 1:dim(1)-1
        for n = 1:dim(2)-1
        outImg(2*m,2*n) = img(m,n);
        outImg(2*m,2*n+1)= (img(m,n)+img(m,n+1))/2;
        outImg(2*m+1,2*n)= (img(m,n)+img(m+1,n))/2;
        outImg(2*m+1,2*n+1)= (img(m,n)+img(m,n+1)+img(m+1,n)+img(m+1,n+1))/2;
        end
    end            

%Bicubic Interpolation
elseif strcmp(order,'bicubic')
    for m = 2:dim(1)-2
        for n = 2:dim(2)-2
            outImg(2*m,2*n) = img(m,n);
            outImg(2*m,2*n+1)= -(1/8)*img(m,n-1)+(5/8)*img(m,n)+(5/8)*img(m,n+1)-(1/8)*img(m,n+2);
        end
    end   
    for m = 2:dim(1)-2
        for n = 2:dim(2)-2
        outImg(2*m,2*n) = img(m,n);
        outImg(2*m+1,2*n)= -(1/8)*img(m-1,n)+(5/8)*img(m,n)+(5/8)*img(m+1,n)-(1/8)*img(m+2,n);
        end
    end
       
else
    
    disp('Function accepts only bilinear or bicubic for order');
    return;
end

end

