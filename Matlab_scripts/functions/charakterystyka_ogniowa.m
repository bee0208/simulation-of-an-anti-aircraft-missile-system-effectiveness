function  charakterystyka_ogniowa(H,r_celu)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
figure
hold on 
scatter(0,0,'red','filled')
scatter(H(:,2),H(:,1),15,'blue','*')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
title({'Charakterystyka ogniowa'; r_celu{1}})
% title('Charakterystyka ogniowa')
xlabel('h_\beta [m]')
ylabel('h_\epsilon [m]')
legend('cel','h_\beta^*, h_\epsilon^*')
grid on
axis equal
hold off
end

