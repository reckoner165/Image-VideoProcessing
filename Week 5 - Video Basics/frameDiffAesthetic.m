vidObj = VideoReader('Radiohead.mp4');
nFrames = vidObj.NumberOfFrames;
vidH = vidObj.Height;
vidW = vidObj.Width;
mov(1:nFrames) = struct('cdata',zeros(vidH,vidW,3,'uint8'),'colormap',[]);
movDiff(1:nFrames) = struct('cdata',zeros(vidH,vidW,3,'uint8'),'colormap',[]);
disp('Reading...');
for k = 5000:6500
    mov(k).cdata = read(vidObj,k);
end

outVid = VideoWriter('darkLotus4.avi');
outVid.FrameRate = vidObj.FrameRate;
open(outVid);
dim = size(mov(100).cdata);
index = 1;
disp('Writing...');
for k = 5000:6500
    temp = abs(mov(k+1).cdata - mov(k).cdata);
    
    
    for i = 1:dim(1)
        for j = 1:dim(2)
            
                
%             for l = 1:3
                if temp(i,j,3) > 70
                    temp(i,j,3) = 255;
                elseif temp(i,j,3) < 20
                    temp(i,j,3) = 0;
                end
                
                if temp(i,j,2) > 20
                    temp(i,j,2) = 255;
%                 elseif temp(i,j,2) > 
                end
%             end
        end
    end
    
    movDiff(index).cdata = temp;
    writeVideo(outVid,movDiff(index).cdata);
    index = index + 1;
end

close(outVid);

%     temp = movDiff(k).cdata


% hf = figure;
% set(hf, 'position',[150 150 vidH vidW])
% movie(hf,movDiff,1,vidObj.FrameRate);
%  imshow(movDiff(1300).cdata);