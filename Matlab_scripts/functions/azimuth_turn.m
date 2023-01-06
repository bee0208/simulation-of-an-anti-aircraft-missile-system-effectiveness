function A = azimuth_turn(theta,thetadot,tp,A)
%funkcja skrętu samolotu w azymucie (wsp. samolotu)

%A - wektor predkosci kątowej w azymucie
%theta - przyrost kątu w azymucie [stopnie]
%thetadot - wartość predkości kątowej w azymucie [stopnie]
%tp - moment skretu liczony od poczatku symulacji [s]

if nargin~=4
    error('Not enough input arguments')
end

if isempty(theta) || isempty(thetadot) || isempty(tp) || isempty(A)
    error('Empty argunent')
end

thetadot=abs(thetadot/theta)*theta; %przypisanie prędkości kątowej odpowiedniego znaku +/-
B=zeros(length(A),1);               %wektor pomocniczy B
t_s=abs(theta/thetadot);            %czas trwania manewru;

for i=1:t_s/0.001                     %do wektora B przez dany przedział czasu przypisujemy wartość prędkości
    B(i+tp/0.001)=deg2rad(thetadot);
end

A=A+B;                              %dodawanie nowego sygnału prędkości do istniejącego wektora prędkości
end