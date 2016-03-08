%frameDiff.m
%Subtracts every frame from previous frame and compiles all these
%differential frames into a new video

%Read source video into an object and initialize source and 
%target video structs
vidObj = VideoReader('Radiohead.mp4');
nFrames = vidObj.NumberOfFrames;
vidH = vidObj.Height;
vidW = vidObj.Width;
mov(1:nFrames) = struct('cdata',zeros(vidH,vidW,3,'uint8'),'colormap',[]);
movDiff(1:nFrames) = struct('cdata',zeros(vidH,vidW,3,'uint8'),'colormap',[]);

%Write to source struct of frames
disp('Reading...');

for k = 6300:6500
    mov(k).cdata = read(vidObj,k);
end

%Initialize target video file
outVid = VideoWriter('darkLotus4.avi');
outVid.FrameRate = vidObj.FrameRate;
open(outVid);
dim = size(mov(100).cdata);
index = 1;

disp('Writing...');


for k = 6300:6500
    %Compute absolute difference between itself and subsequent frame
    temp = abs(mov(k+1).cdata - mov(k).cdata);
    
    
    %Thresholding values in each frame
    for i = 1:dim(1)
        for j = 1:dim(2)
            if min(temp(i,j,:)) > 20
                    temp(i,j,:) = [255 255 255];

            end
        end
    end
    
    %Assigning frame to target struct and write to target video file
    movDiff(index).cdata = temp;
    writeVideo(outVid,movDiff(index).cdata);
    index = index + 1;
end

imwrite(mov(1234).cdata,'source.jpg');
imwrite(movDiff(1234).cdata,'source.jpg');
close(outVid);
