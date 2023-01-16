function  charakterystyka_punktow_trafien(H)
%function which plots hit points characteristics of the
%missile set

figure
hold on 
scatter(H(:,2),H(:,1),15,'blue','*')
scatter(0,0,'red','filled')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
title('Charakterystyka punktów trafień')
xlabel('h_\beta [m]')
ylabel('h_\epsilon [m]')
legend('h_\beta^*, h_\epsilon^*','cel')
grid on
axis equal
hold off
end

