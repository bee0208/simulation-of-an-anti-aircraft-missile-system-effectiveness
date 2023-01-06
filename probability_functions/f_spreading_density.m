%% 
% Spreading density function
% 
% $$f{\left(h_{\varepsilon } ,h_{\beta } \right)}=\frac{1}{2\pi \sigma_{\varepsilon 
% } \sigma_{\beta } }e^{-{\left[\frac{{{\left(h_{\varepsilon } -m_{\varepsilon 
% } \right)}}^2 }{2\sigma_{\varepsilon }^2 }\ +\ \frac{{{\left(h_{\beta } -m_{\beta 
% } \right)}}^2 }{2\sigma_{\beta }^2 }\right]}} \ \$$

s_e=25;
s_b=23;
m_e=2;
m_b=4;

[h_e,h_b] = meshgrid(-20:1:20,-20:1:20);

wsp1=((h_e-m_e).^2/(2*s_e.^2));
wsp2=((h_b-m_b).^2/(2*s_b.^2));

f = 1/(2.*pi.*s_e.*s_b).*exp(-(wsp1+wsp2));

figure
surf(h_b,h_e,f)
% shading flat
% colormap default
title('f(h_\epsilon^*,h_\beta^*)',"FontSize",15)
ylabel('h_\epsilon',"FontSize",20)
xlabel('h_\beta',"FontSize",20)
% text(m_e+3,m_b+3,3.2e-4,'m_\epsilon,m_\beta',"FontSize",13)


figure
[M,c]=contour(h_b,h_e,f);
c.LineWidth = 2;
grid on
% shading flat
% colormap default
title('f(h_\epsilon^*,h_\beta^*)',"FontSize",13)
ylabel('h_\epsilon',"FontSize",13)
xlabel('h_\beta',"FontSize",13)
text(m_e+2,m_b,3.2e-4,'m_\epsilon,m_\beta',"FontSize",13)
hold on
plot(m_b,m_e,'k+','markersize',10,'LineWidth',2)
hold off