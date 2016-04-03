%Affine Motion Estimation

% Select feature points in frame2 (reference frame): pxr,pyr

frame = single(mov(200).cdata);
frimg = 0.333*(frame(:,:,1)+frame(:,:,2)+frame(:,:,3));
figure(1); imshow(uint8(frimg),[])
[pxr,pyr] = getpts;

% Select corresponding feature points in frame1: px1,py1

frame = single(mov(192).cdata);
f1=0.333*(frame(:,:,1)+frame(:,:,2)+frame(:,:,3));
figure(2);imshow(uint8(f1),[]);
[px,py]=getpts;

% Map frame1 to align with frame2 based on px1,py1, pxr,pyr

f1s = AffineMapping(f1,px,py,pxr,pyr);

% Select feature points in frame3: px3,py3

frame = single(mov(208).cdata);
f3=0.333*(frame(:,:,1)+frame(:,:,2)+frame(:,:,3));
figure(3);imshow(uint8(f3),[]);
[px,py]=getpts;

% Map frame3 to align with frame2 based on px3,py3,pxrpyr 

f3s = AffineMapping(f3,px,py,pxr,pyr);