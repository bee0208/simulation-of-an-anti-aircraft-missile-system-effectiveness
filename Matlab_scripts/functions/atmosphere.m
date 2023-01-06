% Earth's atmosphere simulation model (up to 20 km above sea level)
% g : gravitational acceleration [m*s^-2]
% T : temperature [deg. C]
% p : atmospheric pressure [Pa]
% a : speed of sound [m*s^-1]
% rho : air density [kg*m^-3]
% fi : latitude [degrees]
% h : altitude above sea level [m]

function [g,T,p,a,rho] = atmosfera(fi,h)

gamma = 1.4;     % Poissone factor 
R = 287.05287;   % gas constant [m^2*K^-1*s^-2]
L = 0.0065;      % temperature gradient [K*m^-1]
hts = 11000;     % height of the troposphere [m]
htp = 20000;     % tropopause height [m]
g = 9.80665;     % acceleration due to gravity at sea level [m*s^-2]
rho_0 = 1.225;   % air density at sea level [kg*m^-3]
p_0 = 101325;    % air pressure at sea level [Pa]
T_0 = 288.15;    % air temperature at sea level [K]
r = 6356766;     % Earth radius [m]

narginchk(2,2);
if(h>htp)
   error('wb:atmosfera', 'Niepoprawna wartoœæ parametru wejœciowego: h=%d km (>20 km).', h/1000);
end

if(h<0)
   error('wb:atmosfera', 'Niepoprawna wartoœæ parametru wejœciowego: h=%d km (<0 km).', h/1000);
end

if(h>hts)
  T = T_0-L*hts;
  exp_h = exp(g/(R*T)*(hts-h));
else
  T = T_0-L*h;
  exp_h = 1.0;
end

a = sqrt(T*gamma*R);
theta = T/T_0;

p = p_0*theta^(g/(L*R))*exp_h;
rho = rho_0*theta^((g/(L*R))-1.0)*exp_h;
T = T-273.15;

fi_rad = (3.1416*fi)/180;
g_n = 9.80616*(1-0.0026373*cos(2*fi_rad)+0.0000059*(cos(2*fi_rad))^2);
g = g_n*(r/(r+h))^2;
