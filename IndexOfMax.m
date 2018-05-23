%% Return Indexes of max point in QRS span (use only after PanTomp)
% sig = input signal
% span = QRS span to detect max point

function out = IndexOfMax(sig, span)
        ind=0;
        maxi=0;
        if(span(end)<length(sig))
        maxi = sig(span(2));
        end
            for i=span(2):span(end)
                if(i<length(sig))
                    if(sig(i)>maxi)
                     maxi = sig(i);
                    ind = i;
                    end
                end
            end
            out = ind;
end