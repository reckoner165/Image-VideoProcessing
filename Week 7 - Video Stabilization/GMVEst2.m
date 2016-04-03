%Global Motion Estimation

function [dx,dy]=GMVEst2(f2, f1,Rx, Ry)
%finding global MV of f2 with respect to f1
%Rx and Ry are search range (maximum possible absolute shift)

[H,W]=size(f2);
[Hr,Wr]=size(f1);
maxerror=255; 
dx=0;dy=0;

for k=-Ry:Ry
    for l=-Rx:Rx %try all possible shifts
        error = 0;
        count = 0; 
        mb=max(1,1-k); me=min(k,Hr-k);
        nb=max(1,1-l); ne=min(l,Wr-l);
        count=(me-mb+1)*(nb-ne+1);
    %     mb,me,nb,ne should be determined so that mb>=1 & mb+k>=1, similarly me<=Hr & me
    %     +k<=H. Similarly for nb,ne
         error=sum(sum(abs(f1(mb:me,nb:ne)-f2(mb+k:me+k,nb+l:ne+l))))/count;

        if (error<maxerror)
            dy=k;dx=l;
            maxerror=error;
        end
    end
end 