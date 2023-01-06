% Model symulacyjny atmosfery ziemskiej (do 20 km n.p.m.)
%    g   : przyspieszenie ziemskie [m*s^-2]
%    T   : temperatura [st. C]
%    p   : ciœnienie atmosferyczne [Pa]
%    a   : prêdkoœæ dŸwiêku [m*s^-1]
%    rho : gêstoœæ powietrza [kg*m^-3]
%    fi  : szerokoœæ geograficzna [st.]
%    h   : wysokoœæ n.p.m. [m]
%

function [g,T,p,a,rho] = atmosfera(fi,h)

gamma = 1.4;     % wyk³adnik adiabaty Poissone'a 
R = 287.05287;   % sta³a gazowa [m^2*K^-1*s^-2]
L = 0.0065;      % gradient temperatury [K*m^-1]
hts = 11000;     % wysokoœæ troposfery [m]
htp = 20000;     % wysokoœæ tropopauzy [m]
g = 9.80665;     % przyspieszenie ziemskie na poziomie morza [m*s^-2]
rho_0 = 1.225;   % gêstoœæ powietrza na poziomie morza [kg*m^-3]
p_0 = 101325;    % ciœnienie powietrza na poziomie morza [Pa]
T_0 = 288.15;    % temperatura powietrza na poziomie morza [K]
r = 6356766;     % promieñ Ziemi [m]

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
