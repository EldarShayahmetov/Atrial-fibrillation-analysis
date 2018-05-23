function ScatterRR(RR)
NRR=length(RR);				% Общее число RR-интервалов
plot(RR(1:NRR-1),RR(2:NRR),'.');	% Построение скаттерграммы
   
title('Scatter');
    ylabel('R-R(i+1)');
    xlabel('R-R(i)');
end