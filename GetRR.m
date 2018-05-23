%% Return R-R intervals in seconds
% rrpeacks = RR peacks detected points (in counts)
% Fd = sampling freaquency (Fd=250 by deafault)


function out = GetRR(rrpeacks, Fd)

switch nargin
    case 1
        Fd=250;
end

T=1/Fd;
rr=[];
for i=2:length(rrpeacks)
rrint = rrpeacks(i)-rrpeacks(i-1);
rr(i-1) = rrint*T;
end
out = rr;
end