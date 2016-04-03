function [ fmimg ] = AffineMapping(fimg,px,py,pxr,pyr)
%Map fimg to fmimg so that pixel at (pxr,pyr) in fmimg takes the value of fimg
% at (px,py)
%px,py: stores x and y coordinates of points in fimg, each a column vector
%pxr,pyr: stores x and y coordinates of points in frimg, each a column vector
%all vectors should have same size and dimension should be >= 3

[a,b]=pts2affine(px,py,pxr,pyr);

[H, W] = size(fimg);
[X,Y]=meshgrid(1:W,1:H); %coordinate of desired samples in fmimg
X=X-W/2;Y=Y-H/2; %shift origin to center

a0=a(1); a1=a(2); a2=a(3); 
b0=b(1); b1=b(2); b2=b(3);

UI=a0+a1*X+a2*Y;
VI=b0+b1*X+b2*Y;
UI=UI+W/2; VI=VI+H/2; %corresponding sample coordinates in fimg
[U,V]=meshgrid(1:W,1:H); %coordinate of available samples in fimg
fmimg=interp2(U,V,fimg,UI,VI); %get values at UI,VI from available values at
% U,V 