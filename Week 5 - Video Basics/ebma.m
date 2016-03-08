vidObj = VideoReader('Radiohead.mp4');
nFrames = vidObj.NumberOfFrames;
vidH = vidObj.Height;
vidW = vidObj.Width;
mov(1:nFrames) = struct('cdata',zeros(vidH,vidW,3,'uint8'),'colormap',[]);
movDiff(1:nFrames) = struct('cdata',zeros(vidH,vidW,3,'uint8'),'colormap',[]);
disp('Reading...');

for k = 2000:2500
    mov(k).cdata = read(vidObj,k);
%     drawnow;
%     imshow(mov(k).cdata);
end

