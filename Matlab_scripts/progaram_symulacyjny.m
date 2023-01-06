% delete(gcp('nocreate')) %delete parallel pool
% parpool('local') %starting parallel pool
tic
addpath("functions\")
%% Deklaracja zmiennych strzelania

t_sim = 60; %Czas symulacji [s]
l_strzelan=500; % liczba strzelań
[r_napr, g]=rodzaj_naprowadzania('Metoda pokrycia'); % 'Metoda pokrycia', 'Połowicznego prostowania', 'Całkowitego prostowania'
sigma_R=0; %odchylenie standardowe błędu UOW R w odległości [m]
sigma_B=0.025; %odchylenie standardowe błędu UOW R w azymucie [stopnie]
sigma_E=0.025; %odchylenie standardowe błędu UOW R w elewacji [stopnie]
sigma_RC=10; %odchylenie standardowe błędu UOW C w odległości [m]
sigma_BC=0.1; %odchylenie standardowe błędu UOW C w azymucie [stopnie]
sigma_EC=0.1; %odchylenie standardowe błędu UOW C w elewacji [stopnie]
R1=random('Normal',0,sigma_B,1,l_strzelan); %generowanie losowych błędów UOW rakiety
R2=random('Normal',0,sigma_E,1,l_strzelan);
R3=random('Normal',0,sigma_R,1,l_strzelan);
R1C=random('Normal',0,sigma_BC,1,l_strzelan); %generowanie losowych błędów UOW celu
R2C=random('Normal',0,sigma_EC,1,l_strzelan);
R3C=random('Normal',0,sigma_RC,1,l_strzelan);
% Deklaracja własności charakterystyki skuteczności głowicy

m=70; %masa materiału wybuchowego rakiety [kg]
n=2000; %ilość odłamków głowicy 
alfa=deg2rad(37); %kąt sektora rozlotu odłamków [stopnie]
Sw=0.68; %powierzchnia wrażliwa celu [m^2]
% Deklaracja zmiennych dla modelu celu

T=0:0.001:t_sim; T=T';            %czas
B_cel_dot=zeros(length(T),1);   %prędkość kątowa w azymucie celu
E_cel_dot=zeros(length(T),1);   %prędkość kątowa w elewacji celu
Ac=zeros(length(T),1);          %przyspieszenie samolotu celu

v0=300;                            %Prędkość początkowa celu [m/s]
B_cel0 = deg2rad(-180);            %Kąt początkowy w azymucie celu [stopnie]
E_cel0 = deg2rad(0);               %Kąt początkowy w elewacji celu [stopnie]

x0 = 10000;   %Położenie początkowe celu [m]
y0 = 0;
z0 = 7000;
%warunek znalezienia się celu w strefie startu
if x0 > sqrt(23500^2-y0^2-z0^2)+v0*40
    x0=sqrt(23500^2-y0^2-z0^2)+v0*40;
end
% Kombinacje manewrów celu

B_cel_dot = azimuth_turn(75,45,0,B_cel_dot);    %skręt w prawo o 75 stopni z prędkością 45stopni/s licząc od 0 sekundy symulacji
B_cel_dot = azimuth_turn(-75,45,10,B_cel_dot);  %skręt w lewo o 75 stopni z prędkością 45stopni/s licząc od 10 sekundy symulacji

E_cel_dot = elevation_turn(-15,10,5,E_cel_dot);  %skręt w dół o 15 stopni z prędkością 10stopni/s licząc od 5 sekundy symulacji
E_cel_dot = elevation_turn(15,10,15,E_cel_dot);  %skręt w górę o 15 stopni z prędkością 10stopni/s licząc od 15 sekundy symulacji

Ac = acceleration(100,20,15,Ac);   %przyrost prędkości samolotu o 100m/s z przyspieszeniem 20m/s^2 licząc od 20 sekundy symulacji
Ac = acceleration(-40,40,25,Ac);   %spadek prędkości samolotu o 40m/s z przyspieszeniem -40m/s^2 licząc od 25 sekundy symulacji
%% Pętla symulacyjna

%symulacja wstępna obwodu naprowadzania oraz celu
in = Simulink.SimulationInput('obwod_naprowadzania_JW');
in = in.setVariable('t_sim',t_sim);
in = in.setVariable('g',g);
in = in.setVariable('v0',v0);
in = in.setVariable('x0',x0);
in = in.setVariable('y0',y0);
in = in.setVariable('z0',z0);
in = in.setVariable('T',T);
in = in.setVariable('E_cel0',E_cel0);
in = in.setVariable('E_cel_dot',E_cel_dot);
in = in.setVariable('B_cel0',B_cel0);
in = in.setVariable('B_cel_dot',B_cel_dot);
in = in.setVariable('Ac',Ac);

in = in.setVariable('Fs',190000); % Ciag silnika startowego (250000-270000) [N]
in = in.setVariable('Fm',7800); % Ciag silnika marszowego [N]
in = in.setVariable('g',9.81); % Przyspieszenie ziemskie [m/s^2]
in = in.setVariable('S',0.114); % Powierzchnia charakterystyczna rakiety [m^2]
in = in.setVariable('caL',4.132); % Srednia cieciwa aerodynamiczna [m]
in = in.setVariable('Is0',1826.05); % Moment bezwladnosci  [kg*m^2]
in = in.setVariable('Is1',1190.26); % Moment bezwladnosci  [kg*m^2]
in = in.setVariable('Im0',311.75); % Moment bezwladnosci  [kg*m^2]
in = in.setVariable('Im1',182.1); % Moment bezwladnosci  [kg*m^2]
in = in.setVariable('ts',3); % Czas pracy silnika startowego (2.6-4.1) [s]
in = in.setVariable('tm',20); % Czas pracy silnika marszowego (16-22) [s]
in = in.setVariable('tster',3.7); % Czas włączenia sterowania [s]
in = in.setVariable('fi',0*pi/180); % Kat plaszczyzn sterowania
in = in.setVariable('licznik_z',1); % dane UWK
in = in.setVariable('h_uwk',0.005);
in = in.setVariable('epsilon_0_prim_srcp',-0.0007625); % prędkość kątowa linii obserwacji celu w elewacji [rad/s]
in = in.setVariable('beta_0_prim_srcp',0); % prędkość kątowa linii obserwacji celu w azymucie [rad/s]

in = in.setVariable('RB',0);
in = in.setVariable('RE',0);
in = in.setVariable('R',0);
in = in.setVariable('RBC',0);
in = in.setVariable('REC',0);
in = in.setVariable('RC',0);
out = sim(in,'UseFastRestart','on');

outc=sim("cel_sim.slx",'FastRestart','on');

% %sprawdzenie czy cel znajduje się w zasięgu zestawu 
% if any(out.flag_r_start) || any(out.flag_r_cel)    
    
    %deklaracja parametrów symulacji
    for i=l_strzelan:-1:1
        in(i) = Simulink.SimulationInput('obwod_naprowadzania_JW');
        in(i) = in(i).setVariable('t_sim',t_sim);
        in(i) = in(i).setVariable('g',g);
        in(i) = in(i).setVariable('v0',v0);
        in(i) = in(i).setVariable('x0',x0);
        in(i) = in(i).setVariable('y0',y0);
        in(i) = in(i).setVariable('z0',z0);
        in(i) = in(i).setVariable('T',T);
        in(i) = in(i).setVariable('E_cel0',E_cel0);
        in(i) = in(i).setVariable('E_cel_dot',E_cel_dot);
        in(i) = in(i).setVariable('B_cel0',B_cel0);
        in(i) = in(i).setVariable('B_cel_dot',B_cel_dot);
        in(i) = in(i).setVariable('Ac',Ac);
        
        in(i) = in(i).setVariable('Fs',190000); % Ciag silnika startowego (250000-270000) [N]
        in(i) = in(i).setVariable('Fm',7800); % Ciag silnika marszowego [N]
        in(i) = in(i).setVariable('g',9.81); % Przyspieszenie ziemskie [m/s^2]
        in(i) = in(i).setVariable('S',0.114); % Powierzchnia charakterystyczna rakiety [m^2]
        in(i) = in(i).setVariable('caL',4.132); % Srednia cieciwa aerodynamiczna [m]
        in(i) = in(i).setVariable('Is0',1826.05); % Moment bezwladnosci  [kg*m^2]
        in(i) = in(i).setVariable('Is1',1190.26); % Moment bezwladnosci  [kg*m^2]
        in(i) = in(i).setVariable('Im0',311.75); % Moment bezwladnosci  [kg*m^2]
        in(i) = in(i).setVariable('Im1',182.1); % Moment bezwladnosci  [kg*m^2]
        in(i) = in(i).setVariable('ts',3); % Czas pracy silnika startowego (2.6-4.1) [s]
        in(i) = in(i).setVariable('tm',20); % Czas pracy silnika marszowego (16-22) [s]
        in(i) = in(i).setVariable('tster',3.7); % Czas włączenia sterowania [s]
        in(i) = in(i).setVariable('fi',0*pi/180); % Kat plaszczyzn sterowania
        in(i) = in(i).setVariable('licznik_z',1); % dane UWK
        in(i) = in(i).setVariable('h_uwk',0.005);
        in(i) = in(i).setVariable('epsilon_0_prim_srcp',-0.0007625); % prędkość kątowa linii obserwacji celu w elewacji [rad/s]
        in(i) = in(i).setVariable('beta_0_prim_srcp',0); % prędkość kątowa linii obserwacji celu w azymucie [rad/s]
        
        in(i) = in(i).setVariable('RB',R1(i));
        in(i) = in(i).setVariable('RE',R2(i));
        in(i) = in(i).setVariable('R',R3(i));
        in(i) = in(i).setVariable('RBC',R1C(i));
        in(i) = in(i).setVariable('REC',R2C(i));
        in(i) = in(i).setVariable('RC',R3C(i));
    end
    %wykonanie serii strzelań
    outsim = parsim(in,'UseFastRestart','on');
%     outsim = sim(in,'UseFastRestart','on');
% else
%     error('Cel poza zasięgiem PZR')
% end
%% Obróbka danych

%Wykrycie rodzaju celu
if v0==0
    r_celu={'Cel nieruchomy'};
elseif any(B_cel_dot) && any(E_cel_dot) 
    r_celu={'Cel manewrujący'};
elseif any(E_cel_dot)
    r_celu={'Cel manewrujący w E'};
elseif any(B_cel_dot)
    r_celu={'Cel manewrujący w B'};
else
    r_celu={'Cel niemanewrujący'};
end

%Macierze i zmienne wykorzystywane do podsumowania strzelania
H=zeros(l_strzelan,6); 
Z=zeros(l_strzelan,2,"logical");
l_t=0;

%pętla przypisująca dane do zmiennych oraz macierzy podsumowania
for i=1:l_strzelan
    Z(i,1)=any(outsim(i).flag_r_start);
    Z(i,2)=any(outsim(i).flag_r_cel);
    
    if Z(i,1)==1 && Z(i,2)==1
        %funkcja wyznaczająca punkty trafień
        [H(i,1),H(i,2),H(i,3)]=punkty_strzelan(outsim(i).xyz_r,outsim(i).xyz_c);
        %wyznaczanie prawdopodobieństwa porażenia celu
        [H(i,4)]=pstwo(H(i,3),n,Sw,alfa,outsim(i).xyz_r(end,3),m);
        if H(i,4)==1
            l_t=l_t+1;
        end
        %wyznaczanie czasu lotu rakiety
        H(i,5)=outsim(i).r_time;
        %wyznacznie odległości osiągnięcia celu przez rakietę
        H(i,6)=sqrt(outsim(i).xyz_c(end,1)^2+outsim(i).xyz_c(end,2)^2+outsim(i).xyz_c(end,3)^2);
    else
        H(i,:)=[NaN NaN NaN NaN NaN NaN];
    end
end

%wyznaczanie położenia celu w momencie startu rakiety
if any(out.flag_r_start)  %Warunek wystrzelenia rakiety
    [r,~]=find(out.flag_r_start,1,'first');
    xyz_sc=out.xyz_c(r,:); 
else
    xyz_sc=[NaN NaN NaN];
end
% Tworzenie struktury danych podsumowujących serię strzelań

struktura_danych.macierz_podsumowania=H;
struktura_danych.xyz_r=out.xyz_r;
struktura_danych.xyz_c=out.xyz_c;
struktura_danych.tor_ruchu_celu=outc.xyz_c.Data;
struktura_danych.xyz_c_przy_starcie_rakiety=xyz_sc;
struktura_danych.predkosc_celu=out.Vc;
struktura_danych.predkosc_rakiety=out.Vr;
struktura_danych.wyniki_strzelan=[sum(Z(:,1)) l_t];
struktura_danych.parametry_glowicy_rakiety=[m alfa n Sw];
struktura_danych.warunki_strzelania={r_napr r_celu l_strzelan}

%oczyszczanie przestrzeni roboczej
clear H i l_strzelan l_t out outc r_celu r_napr Z Ac B_cel0 B_cel_dot E_cel0 E_cel_dot g T t_sim ...
    v0 x0 y0 z0 r xyz_sc alfa n Sw in R1 R2 sigma_B sigma_E m R1C R2C R3 R3C sigma_BC sigma_EC ...
    sigma_R sigma_RC outsim
toc %czas pracy programu