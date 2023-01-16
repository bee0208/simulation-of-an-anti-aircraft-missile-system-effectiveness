function [Kz] = wspolczynnik_Kz(H,c)
%function which calculate Kz factor

rho=c(1).*H.^3+c(2).*H.^2+c(3).*H+c(4);
Kz=5.2248.*rho.^2+1.5595;
if Kz>9.4
    Kz=9.4;
elseif Kz<0.5769
    Kz=0.5769;
end
end

