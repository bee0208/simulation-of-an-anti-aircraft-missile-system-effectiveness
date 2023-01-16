%% 
% Probability of destroying the target depending on the distance of the rocket 
% explosion from the target

x=linspace(0,50,1000); %create x vector
y=1-exp(-(200./x.^2)); %calculate y function

% create 3 vectors representing Gr function
x1=linspace(0,11.5,100);
x2=linspace(13,15,100);
x3=linspace(15,50,700);
y1=ones(1,length(x1));
y2=-(1/260).*x2.^2+(381/260);
y3=1-exp(-(200./x3.^2))+0.005;

%merging vectors into one
x12=[x1 x2 x3];
y12=[y1 y2 y3];

%plotting figure
figure
hold on
plot(x,y,'r','LineWidth',2)
plot(x12,y12,'b--','LineWidth',2)
grid on
title('Probability of destroying the target function')
ylim([0 1.1])
xlabel('r [m]')
ylabel('G(r)')
ax = gca;
ax.XTickLabel = {};
legend('G(r) not including the shock wave', 'G(r) including the shock wave')