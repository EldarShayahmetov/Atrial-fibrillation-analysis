function DrawRR(RR)
cla
hold on
for i=1:length(RR)
    x(1)=i;		% Абсцисса начала линии
    x(2)=i; 		% Абсцисса конца линии
    R(1)=0;		% Ордината начала линии
    R(2)=RR(i);	% Ордината конца линии
    plot(x,R);		% Построение очередной линии
end

    title('Rythmogram');
    ylabel('R-R(sec)');
    xlabel('R-R num');
end