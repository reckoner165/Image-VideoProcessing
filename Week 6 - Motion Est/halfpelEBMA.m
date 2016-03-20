f1 = double(mov(100).cdata);
f2d = mov(165).cdata;

f2 = double(image2Upsample(f2d,'bicubic'));
%NOTE that F2 is the Upsampled image.
fpd = zeros(size(f1));
N = 16;
R = 16;
vidH = length(f1);
vidWid = vidH;

for i = R+1:N:vidH-R
    for j = R+1:N:vidWid-R
        MAD_min = 256*N*N; 
        mvx = 0; mvy = 0;
        
        for k = -R:1:R
            for l = -R:1:R
                MAD = sum(sum(abs(f1(i:i+N-1,j:j+N-1)-f2(2*(i+k):2:2*(i+k+N-1),2*(j+k):2:2*(j+k+N-1)))));
                
                if MAD < MAD_min
                    MAD_min = MAD;
                    dy = k;
                    dx = l;
                end
            end
        end
        fpd(i:i+N-1,j:j+N-1) = f2(2*(i+dy):2:2*(i+dy+N-1),2*(j+dx):2:2*(j+dx+N-1));
        
        iblk = floor((i-1)/N+1);
        jblk = floor((j-1)/N+1);
        
        mvx(iblk,jblk) = dx; mvy(iblk,jblk) = dy;
    end
end
fpHalf = fpd;
