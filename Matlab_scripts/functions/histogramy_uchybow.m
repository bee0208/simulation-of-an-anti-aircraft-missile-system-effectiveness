function histogramy_uchybow(H)
%function which plots error histograms of the missile set

figure
ax1 = subplot(3,1,1);
histfit(ax1,H(:,2),30,'normal')
title(ax1,{'histogramy:'; 'h_\beta'})
xlabel('[m]')
axis tight

ax2 = subplot(3,1,2); 
histfit(ax2,H(:,1),30,'normal')
title(ax2,'h_\epsilon')
xlabel('[m]')
axis tight

subplot(3,1,3);
histfit(H(:,3),30,'normal')
title('h=\surd(h_\beta^2+h_\epsilon^2)')
xlabel('[m]')
axis tight
xlim([0 inf])
end

