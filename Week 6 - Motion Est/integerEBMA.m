f1 = mov(100).cdata;
f2 = mov(165).cdata;
fp = zeros(size(f1));
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
                MAD = sum(sum(abs(f1(i:i+N-1,j:j+N-1)-f2(i+k:i+k+N-1,j+k:j+k+N-1))));
                
                if MAD < MAD_min
                    MAD_min = MAD;
                    dy = k;
                    dx = l;
                end
            end
        end
        fp(i:i+N-1,j:j+N-1) = f2(i+dy:i+dy+N-1,j+dx:j+dx+N-1);
        
        iblk = floor((i-1)/N+1);
        jblk = floor((j-1)/N+1);
        
        mvx(iblk,jblk) = dx; mvy(iblk,jblk) = dy;
    end
end
fpInt = fp;