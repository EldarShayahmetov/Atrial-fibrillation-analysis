%% Return signal after Pan-Tompkins Algoritm 
% sig = signal to handle
% Fd = sampling freaquency (Fd = 250 by default)

function out = PanTomp(sig, Fd)

        switch nargin
            case 1
        Fd=250;
        end

            df = diff(sig);
            df = df/max(df);
            df2 = df.*df;
            L = length(df2);
            i=1;
            p=1/25;
            M = Fd*p;
            while i<=L-(M-1)
             a(i)=0;
                for j=0:M-1
                a(i)=a(i)+df2(i+j);
                end
                a(i)=a(i)/M;
             i=i+1;
            end
            a = cat(2, a, a(end-10:end-1));
            out = a;
end