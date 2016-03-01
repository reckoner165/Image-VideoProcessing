in = imread('58th2.jpg');
dim = size(in);
brushsize = input('Enter Brush Size (from 20 to 100): ');
for x = 1:brushsize:ceil(dim(1)-brushsize)
    for y = 1:(2*brushsize):ceil(dim(1)-(2*brushsize))
%         out1(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:) = sort(in(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:),1);
%         out2(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:) = sort(in(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:),1,'descend');
         out3(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:) = sort(in(x:x+brushsize,y:min(y+(2*brushsize),dim(2)),:),3,'ascend');
        
    end
end
% out = out1/2+out2/3;
out = out3;
imwrite(out,'58th4.jpg');

    