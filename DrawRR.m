function DrawRR(RR)
cla
hold on
for i=1:length(RR)
    x(1)=i;		% �������� ������ �����
    x(2)=i; 		% �������� ����� �����
    R(1)=0;		% �������� ������ �����
    R(2)=RR(i);	% �������� ����� �����
    plot(x,R);		% ���������� ��������� �����
end

    title('Rythmogram');
    ylabel('R-R(sec)');
    xlabel('R-R num');
end