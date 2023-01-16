function wykres_pstwa_porazenia_celu(W,H,hmax)

if hmax < 35
    hmax=35;
end
n=10000; 
m=W(1);
mt=(0.2*m+0.8*1.25*m); %masa ładunku trotylu [kg]
h=linspace(0,hmax,n); %odległość od środka wybuchu
Z=h./(0.2*m+0.8*1.25*m)^(1/3); %zredukowana odległość
P0=101332; %ciśnienie na poziomie morza [Pa]
P0h=101332.*exp(-11.99./101332.*H); %ciśnienie powietrza na wysokości h [Pa]

%wyznaczanie współczynników funkcji kwadratowej c1 c0
for c=1
    k=1000;
    R_0=linspace(0,35,k);
    Z_0=R_0./(0.2*m+0.8*1.25*m)^(1/3);
    Ps_0=zeros(1,k);
    Psh_0=zeros(1,k);
    Pf0=zeros(1,k);
for i=1:k
    if Z_0(i)<0.05
        Ps_0(i)=NaN;
    elseif Z_0(i)>0.05 && Z_0(i)<=0.3
        Ps_0(i)=2034.08/Z_0(i)+297.03/Z_0(i)^2-24.76/Z_0(i)^3+0.564/Z_0(i)^4;
    elseif Z_0(i)>0.3 && Z_0(i)<=1.5
        Ps_0(i)=-389.32/Z_0(i)+1512.32/Z_0(i)^2-175.404/Z_0(i)^3;
    elseif Z_0(i)>1.5 && Z_0(i)<=40
        Ps_0(i)=0.6864+89.78/Z_0(i)+200.56/Z_0(i)^2+778.029/Z_0(i)^3;
    else
        Ps_0(i)=3200*mt^(2/3)/R_0(i)^2;
    end
    
    if Z_0(i)<=1.5
        Fz=1.227+0.756*log10(Z_0(i));
    elseif Z_0(i)>1.5 && Z_0(i)<20
        Fz=0.42*(log10(Z_0(i)))^2-1.22*log10(Z_0(i))+1.561;
    else
        Fz=0.7;
    end
    delta=8.3*10^-5*H*Fz;
    Psh_0(i)=Ps_0(i)*P0h/P0*(1+delta);
    
 end
for i=1:k
    if Psh_0(i)>=300 || isnan(Psh_0(i))
        Pf0(i)=1;
    elseif Psh_0(i)>=100
        Pf0(i)=0.8;
    elseif Psh_0(i)>=50 
        Pf0(i)=0.5;
    elseif Psh_0(i)>=40 
        Pf0(i)=0.3;
    elseif Psh_0(i)>=20 
        Pf0(i)=0.1;
    else
        Pf0(i)=0;
    end
end
    [~,c1]=find(Pf0==1,1,'last');
    [~,c0]=find(Pf0==0,1,'first');
end

Ps=zeros(1,n);
Psh=zeros(1,n);
for i=1:n
    %wyznaczanie nadciśnienia na czole fali Ps na wysokości 0 m n.p.m.
    if Z(i)<0.05
        Ps(i)=NaN;
    elseif Z(i)>0.05 && Z(i)<=0.3
        Ps(i)=2034.08/Z(i)+297.03/Z(i)^2-24.76/Z(i)^3+0.564/Z(i)^4;
    elseif Z(i)>0.3 && Z(i)<=1.5
        Ps(i)=-389.32/Z(i)+1512.32/Z(i)^2-175.404/Z(i)^3;
    elseif Z(i)>1.5 && Z(i)<=40
        Ps(i)=0.6864+89.78/Z(i)+200.56/Z(i)^2+778.029/Z(i)^3;
    else
        Ps(i)=3200*mt^(2/3)/R(i)^2;
    end
    
    %wyznaczanie współczynnika F(z)
    if Z(i)<=1.5
        Fz=1.227+0.756*log10(Z(i));
    elseif Z(i)>1.5 && Z(i)<20
        Fz=0.42*(log10(Z(i)))^2-1.22*log10(Z(i))+1.561;
    else
        Fz=0.7;
    end
    Gh=8.3*10^-5*H; %wyznaczanie współczynnika G(h) 
    delta=Gh*Fz; %wyznaczanie współczynnika delta
    
    Psh(i)=Ps(i)*P0h/P0*(1+delta); %wyznaczanie nadciśnienia na czole fali Ps na wysokości h
end
Pf=zeros(1,n);
for i=1:n
    if Psh(i)>=300 || isnan(Psh(i))
        Pf(i)=1;
    elseif Psh(i)<20
        Pf(i)=0;
    else
        Pf(i)=1/(R_0(c1)-R_0(c0))^2*(h(i)-R_0(c0))^2;
    end
end

Pod=1-exp(-(W(3)*W(4)./(2*pi*W(2).*h.^2)));

P=zeros(1,length(h));
for i=1:length(h)
    P(i)=1-(1-Pod(i))*(1-Pf(i));
end
figure
hold on
plot(h,P,'LineWidth',2)
plot(h,Pod,'r--')
plot(h,Pf,'k--')
grid on
title({'Prawdopodobieństwo porażenia celu w zależności od h'; ['dla H = ' num2str(H) ' m']})
xlabel('h [m]')
ylabel('G(h)')
ylim([0 1.1])
hold off
legend('G(h)','P_o_d_ł_a_m_k_ó_w','P_f_a_l_i _u_d_e_r_z_e_n_i_o_w_e_j')
end
