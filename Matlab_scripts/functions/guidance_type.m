function [r_napr, g]  = rodzaj_naprowadzania(r_naprowadzania)

if strncmpi(r_naprowadzania,'Metoda pokrycia',9)
    r_napr={'Metoda pokrycia'};
    g=0;
elseif strncmpi(r_naprowadzania,'Połowicznego prostowania',15)
    r_napr={'Połowicznego prostowania'};
    g=0.5;
elseif strncmpi(r_naprowadzania,'Całkowitego prostowania',15)
    r_napr={'Całkowitego prostowania'};
    g=1;
else
    error('brak takiego naprowadzania')
end
end

