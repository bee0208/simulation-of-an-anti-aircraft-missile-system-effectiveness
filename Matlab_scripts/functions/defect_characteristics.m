function charakterystyka_uchybow(sigma_B,sigma_E,M)
t=linspace(0,2*pi,100);
x = sigma_B*cos(t);
y = sigma_E*sin(t);
x = x + M(1,1);
y = y + M(1,2);

x2 = 2*sigma_B*cos(t);
y2 = 2*sigma_E*sin(t);
x2 = x2 + M(1,1);
y2 = y2 + M(1,2);

x3 = 3*sigma_B*cos(t);
y3 = 3*sigma_E*sin(t);
x3 = x3 + M(1,1);
y3 = y3 + M(1,2);

figure
hold on
plot(0,0,'ro',"LineWidth",2)
plot(M(1,1),M(1,2),'b+',"LineWidth",1.5,"MarkerSize",10)
plot(x,y,'y',"LineWidth",1.5)
plot(x2,y2,"Color",[0.9290 0.6940 0.1250],"LineWidth",1.5)
plot(x3,y3,"Color",[0.4660 0.6740 0.1880],"LineWidth",1.5)
grid on
xlabel('h_\beta')
ylabel('h_\epsilon')
legend('Cel','Środek rozrzutu [m_\beta, m_\epsilon]','Rozrzut [\sigma_\beta, \sigma_\epsilon]',...
'Rozrzut [2\sigma_\beta, 2\sigma_\epsilon]','Rozrzut [3\sigma_\beta, 3\sigma_\epsilon]','Location','northeastoutside')
title('Charakterystyka rozrzutu pocisków')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
axis equal
end