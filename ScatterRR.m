function ScatterRR(RR)
NRR=length(RR);				% ����� ����� RR-����������
plot(RR(1:NRR-1),RR(2:NRR),'.');	% ���������� �������������
   
title('Scatter');
    ylabel('R-R(i+1)');
    xlabel('R-R(i)');
end