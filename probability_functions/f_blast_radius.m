 
%% Plot showing function of blast radius of the rocket depending from altitude

%add path to folder with matlab functions
addpath("../Matlab_scripts/functions/") 

G=700; %the weight of the rocket's explosive [N]
T0=288.15; %nominal temperature [K]
p0=1.2255; %nominal air density [kg/m^3]

%create vector of altitude range and rho
H=linspace(0,20000,1000);
rho=zeros(1,length(H));

%calculate air denisty
for i=1:length(H)
    [~,~,~,~,rho(i)] = atmosfera(49,H(i));
end

%calculate plyfit based on the determined vector rho
c = polyfit(H,rho,3);

%calculate Kz factor 
K=zeros(1,length(H));
for i=1:length(H)
    K(i) = wspolczynnik_Kz(H(i),c);
end

%calculate Rpd factor
Rpd=G^(1/3)*K;

%plotting figure with 2 y axes
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
