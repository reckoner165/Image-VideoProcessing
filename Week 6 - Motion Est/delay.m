vidObj = VideoReader('trump.mp4');
nFrames = vidObj.NumberOfFrames;
vidH = vidObj.Height;
vidW = vidObj.Width;
mov(1:nFrames) = struct('cdata',zeros(720,720,3,'uint8'),'colormap',[]);
movDiff(1:nFrames) = struct('cdata',zeros(720,720,3,'uint8'),'colormap',[]);
disp('Reading...');
for k = 1:nFrames
    fr = read(vidObj,k);
    mov(k).cdata = fr(:,101:820);
    
end

f1 = mov(100).cdata;
f2 = mov(105).cdata;
N = 20;
R = 355;
vidWid = vidH;

for i = 1:N:vidH-N
    for j = 1:N:vidWid-N
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

% outVid = VideoWriter('trumpedtrump.avi');
% outVid.FrameRate = vidObj.FrameRate;
% open(outVid);
% index = 1;
% for k = 1:nFrames-10
%     temp = mov(k).cdata + (mov(k+10).cdata-mov(k).cdata)+(mov(k+5).cdata-mov(k).cdata);
%     movDiff(index).cdata = temp;
%     writeVideo(outVid,movDiff(index).cdata);
%     index = index + 1;
% end
% close(outVid);
