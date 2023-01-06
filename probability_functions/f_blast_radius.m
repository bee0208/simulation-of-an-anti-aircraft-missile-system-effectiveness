%% 
% Plot showing function of blast radius of the rocket depending from altitude

G=700; %the weight of the rocket's explosive [N]
T0=288.15;
p0=1.2255;

H=linspace(0,20000,1000);
rho=zeros(1,length(H));
for i=1:length(H)
[~,~,~,~,rho(i)] = atmosfera(49,H(i));
end

p_h=p0.*(1-H./44300).^4.256;

c = polyfit(H,rho,3);
yfit=polyval(c,H);
figure
hold on
plot(H,yfit)
plot(H,p_h)
hold off
legend('poly','wzor')

K=zeros(1,length(H));
for i=1:length(H)
K(i) = wspolczynnik_Kz(H(i),c);
end

Rpd=G^(1/3)*K;

figure
yyaxis left
plot(H,Rpd)
ylabel('Blast radius [m]')
yyaxis right 
plot(H,K)
ylabel('factor K_z')
legend('R_p_d(H)','K_z(H)')
xlabel('altitude H [m]')
title({'R_p_d=K_zG^{1/3}','g_w=1000 N/m^3;   G=700 N'})

H=10000;
K = wspolczynnik_Kz(H,c);
Rpd=G^(1/3)*K