%% 
% $R_{pd}$ in function of warhead  weight
% 
% $$R_{pd} =\sqrt[3]{G\frac{K^3 }{\frac{4}{3}\pi g_w }}\ \$$

gw=1000;
G=linspace(0,1000,1000);
K=[10 25 50 100];

figure
hold on
grid on
xlabel('G [N]')
ylabel('R_p_d [m]')
title({'R_p_d=(3GK^3/4πg_w)^{1/3}','g_w=1000 N/m^3'})
for i=1:length(K)
    R=(G.*K(i).^3/(4/3*pi*gw)).^(1/3);
    plot(G,R,'LineWidth',1.5)
end
legend('K=10','K=25','K=50','K=100')