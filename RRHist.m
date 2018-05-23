function RRHist(RR, step)
global H
switch nargin
    case 1
        step = 0.05;
end

maxRR=max(RR)*1.2;
X = 0:step:maxRR;
H = histc(RR,X);
SH=sum(H);
PH = H/SH * 100;
bar(X,PH, 'histc');

    title('Histogram');
    ylabel('Percentage of R-R(%)');
    xlabel('R-R duration');
end