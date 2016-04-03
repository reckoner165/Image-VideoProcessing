


% Pick 1 in 10 frames as reference frames
% For every reference frame, pick five back and four forwards (except first
% and last)
% 


vidObj = VideoReader('blair3.mp4');
nFrames = vidObj.NumberOfFrames;
vidH = vidObj.Height;
vidW = vidObj.Width;
mov(1:nFrames) = struct('cdata',zeros(vidH,vidW,3,'uint8'),'colormap',[]);
movStab(1:nFrames) = struct('cdata',zeros(vidH,vidW,1,'uint8'),'colormap',[]);

%Write to source struct of frames
disp('Reading...');

for k = 1:nFrames
    mov(k).cdata = read(vidObj,k);
end

Rx = 40; Ry = 40;
[H,W,color] = size(mov(1).cdata);


%Initialize target video file
outVid = VideoWriter('stableBlair2.avi');
outVid.FrameRate = vidObj.FrameRate;
open(outVid);
% dim = size(mov(100).cdata);
% index = 1;

disp('Writing...');


for n = 1:2:nFrames-1

    fRef = mov(n).cdata;
    
    for k = -1:0
        if n+k <= 0
            continue
        end
        fs = uint8(zeros(H,W));
        fBleh = mov(n+k).cdata;
        [dx,dy]=GMVEst2(fRef,fBleh,Rx,Ry);
        mb=max(1,1-dy); me=H-dy;
        nb=max(1,1-dx); ne=W-dx;
        fs(mb:me,nb:ne)=fRef(mb+dy:me+dy,nb+dx:ne+dx);

        movStab(n+k).cdata = fs(1:H,1:W);
%         movStab(n+k).cdata = fs;
        writeVideo(outVid,movStab(n+k).cdata)
    end
end

close(outVid);