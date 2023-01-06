function V = acceleration(v,as,tp,V)
%funkcja przyrostu prędkości samolotu

%A_s - wektor przyspieszenia stycznego samolotu
%v - przyrost prędkości samolotu [m/s]
%as - wartość przyspieszenia samolotu [m/s^2]
%tp - moment przyspieszenia liczony od poczatku symulacji [s]

if nargin~=4
    error('Not enough input arguments')
end

if isempty(v) || isempty(as) || isempty(tp) || isempty(V)
    error('Empty argunent')
end
    
as=abs(as/v)*v;                     %przypisanie wartości przyspieszenia odpowiedniego znaku +/-
B=zeros(length(V),1);               %wektor pomocniczy B
t_s=abs(v/as);                      %czas trwania przyspieszenia [s]
    
for i=1:t_s/0.001                     %do wektora B przez dany przedział czasu przypisujemy wartość przyspieszenia
    B(i+tp/0.001)=as;
end
    
V=V+B;                              %dodawanie nowego sygnału przyspieszenia do istniejącego wektora przyspieszneia
end