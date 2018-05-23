%% Return indexes of R peacks (only after PanTomp usable)
% sig = input signal (after PanTomp)
% lvl = level to detect R-peacks, can take [0,1]
% rdur = rpeacks duration, rdur=20 by default;
% rrint = RR interval, rrint=100 by default;

function rindexes = RPeacksIndexes(sig, lvl, rdur, rrint)
        
    switch nargin 
        case 2
           rdur=20;
           rrint=100;
       case 3
           rrint = 100;
    end

         s=0;
         r=[];
         k=1;
         for i=1:length(sig)
            s=s-1;
                if(sig(i)>lvl && s<=0)
                span = i:1:i+rdur-1;
                r(k)= IndexOfMax(sig, span);
                k=k+1;
                s=rrint+rdur;
                end
         end
         r(r==0) =[];
         rindexes = r;
end