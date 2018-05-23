%% Return normalized ECG with assigned duration
% sig = ECG to initialize 

function out = InitECG(sig)
        Emax = max(sig);
        sig = sig/Emax;
        out = sig;
end
