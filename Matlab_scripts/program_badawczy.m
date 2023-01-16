%% Dane programu symulacyjnego

struktura_danych
H=struktura_danych.macierz_podsumowania;
%% Deklaracja parametrów tabeli

tabela_celow = table('Size',[1 7],'VariableTypes',{'string','double','double','double','double','double','double'}, ...
    'VariableNames',{'Rodzaj celu','Liczba celów','Vśr [m/s]', 'Max pułap celu [m]','Min pułap celu [m]','Max parametr celu [m]', 'Odległość wykrycia [m]'});
tabela_celow.Properties.Description='Tabela podsumowująca cele w serii strzelań';

tabela_strzelania = table('Size',[1 7],'VariableTypes',{'string','double','double','double','double','double','double'}, ...
    'VariableNames',{'Metoda naprowadzania','Wystrzelonych rakiet','Średnie P-stwo porażenia','Trafionych (P=1)','Średni czas lotu rakiety [s]','Vr w końcowym momencie [m/s]','odegłość osiągnięcia celu [m]'});
tabela_strzelania.Properties.Description='Tabela podsumowująca serię strzelań';

tabela_wskazniki_polozenia_uchybow = table('Size',[3 5],'VariableTypes',{'double','double','double','double','double'}, ...
    'VariableNames',{'Wartość maksymalna [m]','Wartość minimalna [m]','Wartość oczekiwana [m]','Mediana [m]','Wartość modalna [m]'}, ...
    'RowNames',{'h';'h_epsilon';'h_beta'});
tabela_uchybow.Properties.Description='Tabela wskaźników położenia uchybów';

tabela_wskazniki_rozproszenia_uchybow = table('Size',[3 5],'VariableTypes',{'double','double','double','double','double'}, ...
    'VariableNames',{'Rozstęp [m]','Wariancja [m]','Odchylenie standardowe [m]','Odchylenie przeciętne [m]','Rozstęp międzykwartylowy [m]'}, ...
    'RowNames',{'h';'h_epsilon';'h_beta'});
tabela_uchybow.Properties.Description='Tabela wskaźników rozproszenia uchybów';

%Tabela podsumowująca cele w serii strzelań
tabela_celow(1,:)=[struktura_danych.warunki_strzelania{2},struktura_danych.warunki_strzelania{3},mean(struktura_danych.predkosc_celu.Data),max(struktura_danych.xyz_c(:,3)),...
    min(struktura_danych.xyz_c(:,3)),max(struktura_danych.xyz_c(:,2)),sqrt(struktura_danych.xyz_c(1,1)^2+struktura_danych.xyz_c(1,2)^2+struktura_danych.xyz_c(1,3)^2)]
%Tabela podsumowująca serię strzelań
tabela_strzelania(1,:)=[struktura_danych.warunki_strzelania{1},struktura_danych.wyniki_strzelan(1),mean(H(:,4)),struktura_danych.wyniki_strzelan(2),mean(H(:,5)),struktura_danych.predkosc_rakiety.Data(end),mean(H(:,6))]

%Tabela podsumowująca wskaźniki położenia uchybów
tabela_wskazniki_polozenia_uchybow(1,:)=array2table([max(H(:,3)),min(H(:,3)),mean(H(:,3)),median(H(:,3)),mode(round(H(:,3),1))]);
tabela_wskazniki_polozenia_uchybow(2,:)=array2table([max(H(:,1)),min(H(:,1)),mean(H(:,1)),median(H(:,1)),mode(round(H(:,1),1))]);
tabela_wskazniki_polozenia_uchybow(3,:)=array2table([max(H(:,2)),min(H(:,2)),mean(H(:,2)),median(H(:,2)),mode(round(H(:,2),1))])
%Tabela podsumowująca wskaźniki rozproszenia uchybów
tabela_wskazniki_rozproszenia_uchybow(1,:)=array2table([max(H(:,3))-min(H(:,3)),var(H(:,3)),std(H(:,3)),mean(abs(H(:,3))),iqr(H(:,3))]);
tabela_wskazniki_rozproszenia_uchybow(2,:)=array2table([max(H(:,1))-min(H(:,1)),var(H(:,1)),std(H(:,1)),mean(abs(H(:,1))),iqr(H(:,1))]);
tabela_wskazniki_rozproszenia_uchybow(3,:)=array2table([max(H(:,2))-min(H(:,2)),var(H(:,2)),std(H(:,2)),mean(abs(H(:,2))),iqr(H(:,2))])
%Wykres ramkowy uchybów
boxplot(H(:,1:3),'Labels',{'h_epsilon','h_beta','h'})
ylabel('[m]')
title('Wykres ramkowy uchybów')
set(gca,'XGrid','off','YGrid','on')
%rysowanie pełnej trajektorii celu
target_plots({struktura_danych.tor_ruchu_celu tabela_celow{1,3}},'polar'); 
%rysowanie trajektorii celu i rakiety
rocket_plots(struktura_danych.xyz_c,struktura_danych.xyz_r,struktura_danych.xyz_c_przy_starcie_rakiety,'3d');
%wykres porównawczy prędkości rakiety oraz celu
figure
hold on
plot(struktura_danych.predkosc_rakiety)
plot(struktura_danych.predkosc_celu)
hold off
xlabel('Czas [s]')
ylabel('prędkość [m/s]')
legend('v_r','v_c','Location',"northeastoutside")
ylim([0 inf])
grid on
title('Prędkość rakiety i celu')
%rysowanie charakterystyki punktów trafień
charakterystyka_punktow_trafien(struktura_danych.macierz_podsumowania)
%rysowanie charakterystyki uchybów pocisków
charakterystyka_rozrzutu(tabela_wskazniki_rozproszenia_uchybow{"h_beta","Odchylenie standardowe [m]"},tabela_wskazniki_rozproszenia_uchybow{"h_epsilon","Odchylenie standardowe [m]"},...
    [tabela_wskazniki_polozenia_uchybow{"h_beta","Wartość oczekiwana [m]"} tabela_wskazniki_polozenia_uchybow{"h_epsilon","Wartość oczekiwana [m]"}])
%rysowanie histogramów uchybów
histogramy_uchybow(struktura_danych.macierz_podsumowania)

subplot(3,1,1)
set(gca,'XGrid','off','YGrid','on')
subplot(3,1,2)
set(gca,'XGrid','off','YGrid','on')
subplot(3,1,3)
set(gca,'XGrid','off','YGrid','on')
%wyznaczanie charakterystyki prawdopodobieństwa porażenia celu na podstawie założen
wykres_pstwa_porazenia_celu(struktura_danych.parametry_glowicy_rakiety,struktura_danych.xyz_r(end,3),50)
%procentowy wykaz przedziałów prawdopodobieństwa porażenia celu w danym strzelaniu
[~]=piechart_pstwo(struktura_danych.macierz_podsumowania); 
clear U Us