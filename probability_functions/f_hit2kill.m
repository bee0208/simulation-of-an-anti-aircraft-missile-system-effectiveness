%% 
% The function of the probability of hitting an object of radius R depending 
% on the spread
% 
% $$P{\left(r<R\right)}=1-e^{-{\left(\frac{R^2 }{2\sigma^2 }\right)}}$$

sigma=linspace(0,10,500);
R=1:5;

figure
hold on
grid on
xlabel('\sigma [m]')
ylabel('P(r<R)')
title('P(r<R)=1-e^{-(R^2/2σ^2)}')
for i=1:5
p=1-exp(-(R(i).^2./(2.*sigma.^2)));
plot(sigma,p,'LineWidth',1.5)
end
legend('R=1','R=2','R=3','R=4','R=5')
ylim([0 1.05])