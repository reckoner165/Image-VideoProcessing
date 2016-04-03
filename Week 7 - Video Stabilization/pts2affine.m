function [a,b]=pts2affine(px,py,pxr,pyr)

%Determine the affine map parameters a, b based on corresponding features
%px,py: stores x and y coordinates of points in the image to be aligned, each a
% column vector
%pxr,pyr: stores x and y coordinates of points in the reference image, each a
% column vector
%all vectors should have same size and dimension should be >= 3

[N,M]=size(px);
%If (N<3) error(?Need 3 or more feature points!?);
%needs to make sure all p vectors have the same dimension!
T=[ones(N,1), pxr(1:N), pyr(1:N)];
a=inv(T'*T)*T'*px; %a=[a0;a1;a2]
b=inv(T'*T)*T'*py; %b=[b0;b1;b2] 

end