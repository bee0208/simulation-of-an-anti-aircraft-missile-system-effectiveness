function E = elevation_turn(epsilon,epsilondot,tp,E)
%funkcja skrętu samolotu w elewacji (wsp. samolotu)

%E - wektor predkosci kątowej w elewacji
%epsilon - przyrost kątu w elewacji [stopnie]
%epsilondot - wartość predkości kątowej w elewacji [stopnie/s]
%tp - moment skretu liczony od poczatku symulacji [s]

if nargin~=4
    error('Not enough input arguments')
end

if isempty(epsilon) || isempty(epsilondot) || isempty(tp) || isempty(E)
    error('Empty argunent')
end

epsilondot=abs(epsilondot/epsilon)*epsilon; %przypisanie prędkości kątowej odpowiedniego znaku +/-
B=zeros(length(E),1);                       %wektor pomocniczy B
t_s=abs(epsilon/epsilondot);                %czas trwania manewru [s]
    
for i=1:t_s/0.001                             %do wektora B przez dany przedział czasu przypisujemy wartość prędkości
    B(i+tp/0.001)=deg2rad(epsilondot);
end
    
E=E+B;                                      %dodawanie nowego sygnału prędkości do istniejącego wektora prędkości
end