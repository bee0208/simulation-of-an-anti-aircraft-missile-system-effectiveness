%% 
% Plot showing function of probability of destroying target for shock wave and 
% warhead fragments

Rpd=10; %Rpd factor
h=linspace(0,100,1000); %altitude vector
Pf=1-exp(Rpd^2*log(0.9)./h.^2); %calculate Pf function
Pf(Rpd*10:end)=Pf(Rpd*10:end).*0; %0 value assignment for the final part of the vector
Pod=1-exp(-(200./h.^2)); %calculate Pod function

%plotting figure
figure 
hold on
plot(h,Pf)
plot(h,Pod)
P=zeros(1,length(h));
for i=1:length(h)
    if Pf(i)+Pod(i)>1 && h(i)<Rpd
        P(i)=1;
    else
        P(i)=Pf(i)+Pod(i);
    end
end
plot(h,P)
hold off
legend('shock wave','warhead fragments','Sum')