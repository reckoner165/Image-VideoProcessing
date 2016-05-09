% tic;

f1 = double(mov(100).cdata);
f2d = mov(165).cdata;

f2 = double(image2Upsample(f2d,'bicubic'));
%NOTE that F2 is the Upsampled image.
fpd = zeros(size(f1));
N = 16;
R = 16;
vidH = length(f1);
vidWid = vidH;

%For every block
for i = R+1:N:vidH-R
    for j = R+1:N:vidWid-R
        MAD_min = 256*N*N; 
        mvx = 0; mvy = 0;
        %For the search range either side
        for k = -R:1:R
            for l = -R:1:R
                %Calculate absolute difference with the upsampled image at
                %twice the distance
                MAD = sum(sum(abs(f1(i:i+N-1,j:j+N-1)-f2(2*(i+k):2:2*(i+k+N-1),2*(j+k):2:2*(j+k+N-1)))));
                
                %For minimum difference, note the pixel distances
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
        %Make a note of motion vectors
        mvx(iblk,jblk) = dx; mvy(iblk,jblk) = dy;
    end
end
fpHalf = fpd;
% time = toc
PSNR = 10*log10(255^2/mean2((double(fpd)-double(f1)).^2))
