function P = pstwo(h,n,Sw,alfa,H,m)
Z=h/(0.2*m+0.8*1.25*m)^(1/3); % reduced distance
P0=101332; %sea level pressure [Pa]
P0h=101332.*exp(-11.99./101332.*H); % air pressure at height h [Pa]
mt=(0.2*m+0.8*1.25*m); % mass of TNT load [kg]


%determination of overpressure on the Ps wave front at 0 m above sea level
if Z<0.05
        Ps=2034.08/0.05+297.03/0.05^2-24.76/0.05^3+0.564/0.05^4;
    elseif Z>0.05 && Z<=0.3
        Ps=2034.08/Z+297.03/Z^2-24.76/Z^3+0.564/Z^4;
    elseif Z>0.3 && Z<=1.5
        Ps=-389.32/Z+1512.32/Z^2-175.404/Z^3;
    elseif Z>1.5 && Z<=40
        Ps=0.6864+89.78/Z+200.56/Z^2+778.029/Z^3;
    else
        Ps=3200*mt^(2/3)/h^2;
end

%determining F(z)
if Z<=1.5
        Fz=1.227+0.756*log10(Z);
    elseif Z>1.5 && Z<20
        Fz=0.42*(log10(Z))^2-1.22*log10(Z)+1.561;
    else
        Fz=0.7;
end

delta=8.3*10^-5*H*Fz; %determination of the delta coefficient
Psh=Ps*P0h/P0*(1+delta); %determination of overpressure on the Ps wave front at height h

if Psh>=300 || isnan(Psh)
    Pf=1;
elseif Psh<20
    Pf=0;
else
    %determining the coefficients of the quadratic function c1 c0
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
    %probability Pf
Pf=1/(R_0(c1)-R_0(c0))^2*(h-R_0(c0))^2;
end


%determination of the function of the probability of hitting the target with shrapnel
Pod=1-exp(-(n*Sw/(2*pi*alfa*h^2)));

%determine the probability of destroying the target 
P=1-(1-Pod)*(1-Pf);
end
