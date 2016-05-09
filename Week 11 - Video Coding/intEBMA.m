function [ fp,mvx,mvy ] = intEBMA( f1,f2,N,R )
% Function to perform integer pel EBMA

%Initialize arguments
fp = zeros(size(f1));
% N = 16;
% R = 16;
vidH = length(f1);
vidWid = vidH;

%For every block
for i = R+1:N:vidH-N
    for j = R+1:N:vidWid-N
        MAD_min = 256*N*N; 
        mvx = 0; mvy = 0;
        
        %For every search range either side of a pixel
        for k = -R:1:R
            for l = -R:1:R
                MAD = sum(sum(abs(f1(i:i+N-1,j:j+N-1)-f2(i+k:i+k+N-1,j+k:j+k+N-1))));
                
                %Look for minimum error and substitute it everytime a lower
                %error is found
                if MAD < MAD_min
                    MAD_min = MAD;
                    dy = k;
                    dx = l;
                end
            end
        end
        %Use these MV values to move pixels in the frame
        fp(i:i+N-1,j:j+N-1) = f2(i+dy:i+dy+N-1,j+dx:j+dx+N-1);
        
        iblk = floor((i-1)/N+1);
        jblk = floor((j-1)/N+1);
%         disp([iblk jblk dx dy]);
        mvx(iblk,jblk) = dx;
        mvy(iblk,jblk) = dy;
%         disp(mvx);
%         disp(mvy);
    end
end
% disp(size(mvx));

end

