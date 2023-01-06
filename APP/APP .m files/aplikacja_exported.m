classdef aplikacja_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        GridLayout                      matlab.ui.container.GridLayout
        LeftPanel                       matlab.ui.container.Panel
        ParametrystrzelaniaPanel        matlab.ui.container.Panel
        SymulacjerwnolegeSwitchLabel    matlab.ui.control.Label
        SymulacjerwnolegeSwitch         matlab.ui.control.Switch
        czassymulacjisEditFieldLabel    matlab.ui.control.Label
        czassymulacjisEditField         matlab.ui.control.NumericEditField
        liczbastrzelaEditFieldLabel     matlab.ui.control.Label
        liczbastrzelaEditField          matlab.ui.control.NumericEditField
        metodanaprowadzaniaDropDownLabel  matlab.ui.control.Label
        metodanaprowadzaniaDropDown     matlab.ui.control.DropDown
        ParametrygowicybojowejrakietyPanel  matlab.ui.container.Panel
        masamateriauwybuchowegoEditFieldLabel  matlab.ui.control.Label
        masamateriauwybuchowegoEditField  matlab.ui.control.NumericEditField
        iloodamkwEditFieldLabel         matlab.ui.control.Label
        iloodamkwEditField              matlab.ui.control.NumericEditField
        ktrozlotuodamkwstopnieEditFieldLabel  matlab.ui.control.Label
        ktrozlotuodamkwstopnieEditField  matlab.ui.control.NumericEditField
        ParametryruchuceluPanel         matlab.ui.container.Panel
        pooeniex0mEditFieldLabel        matlab.ui.control.Label
        pooeniex0mEditField             matlab.ui.control.NumericEditField
        pooeniez0mEditField             matlab.ui.control.NumericEditField
        pooeniez0mEditFieldLabel        matlab.ui.control.Label
        powierzchniawraliwacelum2EditField  matlab.ui.control.NumericEditField
        powierzchniawraliwacelum2EditFieldLabel  matlab.ui.control.Label
        prdkopocztkowamsEditFieldLabel  matlab.ui.control.Label
        prdkopocztkowamsEditField       matlab.ui.control.NumericEditField
        pooeniey0mEditField             matlab.ui.control.NumericEditField
        pooeniey0mEditFieldLabel        matlab.ui.control.Label
        SymulujtorruchuceluButton       matlab.ui.control.Button
        DodajmanewryButton              matlab.ui.control.StateButton
        WyczymanewryButton              matlab.ui.control.StateButton
        manewryceluLabel                matlab.ui.control.Label
        BdynaprowadzaniaPanel           matlab.ui.container.Panel
        TabGroup                        matlab.ui.container.TabGroup
        UOWrakietyTab                   matlab.ui.container.Tab
        welewacjistopnieEditFieldLabel  matlab.ui.control.Label
        welewacjistopnieEditField       matlab.ui.control.NumericEditField
        wazymuciestopnieEditFieldLabel  matlab.ui.control.Label
        wazymuciestopnieEditField       matlab.ui.control.NumericEditField
        wodlegocimEditField_2Label      matlab.ui.control.Label
        wodlegocimEditField_2           matlab.ui.control.NumericEditField
        UOWceluTab                      matlab.ui.container.Tab
        welewacjistopnieEditField_2Label  matlab.ui.control.Label
        welewacjistopnieEditField_2     matlab.ui.control.NumericEditField
        wazymuciestopnieEditField_2Label  matlab.ui.control.Label
        wazymuciestopnieEditField_2     matlab.ui.control.NumericEditField
        wodlegocimEditFieldLabel        matlab.ui.control.Label
        wodlegocimEditField             matlab.ui.control.NumericEditField
        SYMULACJAButton                 matlab.ui.control.Button
        Lamp                            matlab.ui.control.Lamp
        PojedynczystrzaButton           matlab.ui.control.Button
        DANEWEJCIOWELabel               matlab.ui.control.Label
        RightPanel                      matlab.ui.container.Panel
        PODSUMOWANIESYMULACJISTRZELALabel  matlab.ui.control.Label
        TabGroup2                       matlab.ui.container.TabGroup
        DANECELUTab                     matlab.ui.container.Tab
        TabGroup3                       matlab.ui.container.TabGroup
        DTab                            matlab.ui.container.Tab
        UIAxes                          matlab.ui.control.UIAxes
        DTab_2                          matlab.ui.container.Tab
        UIAxes2                         matlab.ui.control.UIAxes
        UIAxes3                         matlab.ui.control.UIAxes
        PolarTab                        matlab.ui.container.Tab
        Panel                           matlab.ui.container.Panel
        UITable                         matlab.ui.control.Table
        DANESTRZELANIATab               matlab.ui.container.Tab
        TabGroup3_2                     matlab.ui.container.TabGroup
        DTab_3                          matlab.ui.container.Tab
        UIAxes_2                        matlab.ui.control.UIAxes
        DTab_4                          matlab.ui.container.Tab
        UIAxes2_2                       matlab.ui.control.UIAxes
        UIAxes3_2                       matlab.ui.control.UIAxes
        PolarTab_2                      matlab.ui.container.Tab
        Panel_2                         matlab.ui.container.Panel
        VrVcTab                         matlab.ui.container.Tab
        UIAxes_3                        matlab.ui.control.UIAxes
        UITable_2                       matlab.ui.control.Table
        ROZRZUTPOCISKWTab               matlab.ui.container.Tab
        TabGroup3_3                     matlab.ui.container.TabGroup
        WykresramkowyTab                matlab.ui.container.Tab
        UIAxes4                         matlab.ui.control.UIAxes
        HistogramyTab                   matlab.ui.container.Tab
        UIAxes5                         matlab.ui.control.UIAxes
        UIAxes5_2                       matlab.ui.control.UIAxes
        UIAxes5_3                       matlab.ui.control.UIAxes
        PunktytrafieTab                 matlab.ui.container.Tab
        UIAxes6                         matlab.ui.control.UIAxes
        CharrozrzutuTab                 matlab.ui.container.Tab
        UIAxes7                         matlab.ui.control.UIAxes
        UITable2                        matlab.ui.control.Table
        PRAWDOPODOBIESTWOPORAENIACELUTab  matlab.ui.container.Tab
        OXhmSliderLabel                 matlab.ui.control.Label
        OXhmSlider                      matlab.ui.control.Slider
        WysokoHkmLabel                  matlab.ui.control.Label
        WysokoHkmKnob                   matlab.ui.control.Knob
        UstawwysokodetonacjiButton      matlab.ui.control.StateButton
        UIAxes8                         matlab.ui.control.UIAxes
        UIAxes9                         matlab.ui.control.UIAxes
        UIAxes10                        matlab.ui.control.UIAxes
        WykonajsymulacjeabywywietlipodsumowanieLabel  matlab.ui.control.Label
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end

    
    properties (Access = private)
        DialogApp % Dialog box app
        
        Para = 1                            %rodzaj symulacji; 1-Para , 0-Normalny
        t_sim = 30                          %Czas symulacji [s]
        l_strzelan = 100                    % liczba strzelań w symulacji
        r_napr = 'Metoda pokrycia'      % rodzaj naprowadzania
        sigma_R = 0                         %odchylenie standardowe błędu UOW R w odległości [m]
        sigma_B = 0.01                      %odchylenie standardowe błędu UOW R w azymucie [stopnie]
        sigma_E = 0.01                      %odchylenie standardowe błędu UOW R w elewacji [stopnie]
        sigma_RC = 10                       %odchylenie standardowe błędu UOW C w odległości [m]
        sigma_BC = 0.05                     %odchylenie standardowe błędu UOW C w azymucie [stopnie]
        sigma_EC = 0.05                     %odchylenie standardowe błędu UOW C w elewacji [stopnie]
        m = 70                              %masa materiału wybuchowego rakiety [kg]
        n = 2000                            %ilość odłamków głowicy 
        alfa = deg2rad(37)                  %kąt sektora rozlotu odłamków [stopnie]
        Sw = 0.68                           %powierzchnia wrażliwa celu [m^2]
        
        wys_koncowa
        Parametry_glowicy
    end
    
    properties (Access = public)
        x0 = 13982                          %Położenie początkowe celu [m]
        y0 = 13982
        z0 = 4000
        v0 = 300                            %prędkość początkowa celu [m/s]
        
        B_cel0 = deg2rad(-180)              %Kąt początkowy w azymucie celu [stopnie]
        E_cel0 = 0                          %Kąt początkowy w elewacji celu [stopnie]
        
        T
        B_cel_dot                           %prędkość kątowa w azymucie celu
        E_cel_dot                           %prędkość kątowa w elewacji celu
        Ac
        r_celu
    end
    
    methods (Access = private)
        
        function [hE,hB,h] = Punkty_Strzelan(~,xyz_r,xyz_c)
            %wyznaczanie odległości rakiety i celu od SNR oraz odległości między rakietą a celem
            R=sqrt((xyz_c(end,1)-xyz_r(end,1))^2+(xyz_c(end,2)-xyz_r(end,2))^2+(xyz_c(end,3)-xyz_r(end,3))^2);
            Rc=sqrt(xyz_c(end,1)^2+xyz_c(end,2)^2+xyz_c(end,3));
            Rr=sqrt(xyz_r(end,1)^2+xyz_r(end,2)^2+xyz_r(end,3));
            
            %wyznaczenie wektora przemieszczenia rakiety w końcowym momencie
            delta_r=[xyz_r(end,1)-xyz_r(end-1,1)
                xyz_r(end,2)-xyz_r(end-1,2)
                xyz_r(end,3)-xyz_r(end-1,3)];
            
            %wyznaczenie wektora przemieszczenia celu w końcowym momencie
            delta_rc=[xyz_c(end,1)-xyz_c(end-1,1)
                xyz_c(end,2)-xyz_c(end-1,2)
                xyz_c(end,3)-xyz_c(end-1,3)];
            
            %wyznaczenie wekora zbliżania rakiety do celu
            delta_rz=[delta_r(1,1)-delta_rc(1,1)
                delta_r(2,1)-delta_rc(2,1)
                delta_r(3,1)-delta_rc(3,1)];
            
            %wyznaczenie wektora linii obserwacji celu przez rakietę
            wektor_rc=[xyz_c(end,1)-xyz_r(end,1)
                    xyz_c(end,2)-xyz_r(end,2)
                    xyz_c(end,3)-xyz_r(end,3)];
            
            %wyznaczenie kątu azymutu i elewacji wektora linii obserwacji celu
            B_rc=azymut(wektor_rc(1,1),wektor_rc(2,1));
            if Rc>Rr
                E_rc=atan(wektor_rc(3,1)/sqrt(wektor_rc(1,1)^2+wektor_rc(2,1)^2));
            else
                E_rc=atan((-1)*wektor_rc(3,1)/sqrt(wektor_rc(1,1)^2+wektor_rc(2,1)^2));
            end
            
            %wyznaczenie kątu azymutu i elewacji wektora zbliżania
            B_delta_rz=azymut(delta_rz(1,1),delta_rz(2,1));
            E_delta_rz=atan(delta_rz(3,1)/sqrt(delta_rz(1,1)^2+delta_rz(2,1)^2));
            
            %wyznaczenie uchybów
            hE=R*sin(E_delta_rz-E_rc);
            hB=R*sin(B_delta_rz-B_rc);
            h=sqrt(hE^2+hB^2);
            
            function y = azymut(x, y)

                if x>0 && y>0
                    u=abs(atan(y/x));
                elseif x<0 && y>0
                    u=pi-abs(atan(y/x));
                elseif x<0 && y<0
                    u=pi+abs(atan(y/x));
                else
                    u=2*pi-abs(atan(y/x));
                end
                y = u;
            end
        end
        
        function P = Pstwo(~,h,n,Sw,alfa,H,m)
            Z=h/(0.2*m+0.8*1.25*m)^(1/3); %zredukowana odległość
            P0=101332; %ciśnienie na poziomie morza [Pa]
            P0h=101332.*exp(-11.99./101332.*H); %ciśnienie powietrza na wysokości h [Pa]
            mt=(0.2*m+0.8*1.25*m); %masa ładunku trotylu [kg]
            
            %wyznaczanie nadciśnienia na czole fali Ps na wysokości 0 m n.p.m
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
            
            %wyznaczanie funkcji F(z)
            if Z<=1.5
                    Fz=1.227+0.756*log10(Z);
                elseif Z>1.5 && Z<20
                    Fz=0.42*(log10(Z))^2-1.22*log10(Z)+1.561;
                else
                    Fz=0.7;
            end
            
            delta=8.3*10^-5*H*Fz; %wyznaczanie współczynnika delta
            Psh=Ps*P0h/P0*(1+delta); %wyznaczanie nadciśnienia na czole fali Ps na wysokości h
            
            if Psh>=300 || isnan(Psh)
                Pf=1;
            elseif Psh<20
                Pf=0;
            else
                %wyznaczanie współczynników funkcji kwadratowej c1 c0
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
                %prawdopodobieństwo Pf
            Pf=1/(R_0(c1)-R_0(c0))^2*(h-R_0(c0))^2;
            end
            
            %wyznaczenie funkcji prawdopodobieństwa porażenia celu odłamkami
            Pod=1-exp(-(n*Sw/(2*pi*alfa*h^2)));
            
            %wyznaczenie prawdopodobieństwa porażenia celu
            P=1-(1-Pod)*(1-Pf);
        end
        
        function Target_Plots(app,xyz)
            %wykres 3D
            plot3(app.UIAxes,0,0,0,'go','LineWidth',3)
            hold(app.UIAxes,'on');
            plot3(app.UIAxes,xyz(1,1),xyz(1,2),xyz(1,3),'r*','MarkerSize',7)
            plot3(app.UIAxes,xyz(:,1),xyz(:,2),xyz(:,3),'r-',"LineWidth",2)
            legend(app.UIAxes, 'SNR', 'Moment wykrycia', 'Tor ruchu celu')
            title(app.UIAxes, 'Wykres toru ruchu celu (3D)')
            axis(app.UIAxes, 'equal');
            ax = app.UIAxes;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.ZGrid = 'on';
            ax.XLabel.String = 'x [m]';
            ax.YLabel.String = 'y [m]';
            ax.ZLabel.String = 'z [m]';
            hold(app.UIAxes,'off');
            
            %wykres 2D XY
            plot(app.UIAxes2,0,0, 'go','LineWidth',3)
            hold(app.UIAxes2,"on");
            plot(app.UIAxes2,xyz(1,1),xyz(1,2),'r*','MarkerSize',7)
            plot(app.UIAxes2,xyz(:,1),xyz(:,2),'r-',"LineWidth",2)
            title(app.UIAxes2, 'Wykres toru ruchu celu (2D)')
%             axis(app.UIAxes2, 'equal');
            ylim(app.UIAxes2,[0 inf])
            xlim(app.UIAxes2,[0 inf])
            ax = app.UIAxes2;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.XLabel.String = 'x [m]';
            ax.YLabel.String = 'y [m]';
            hold(app.UIAxes2,"off");

            %wykres 2D XZ
            plot(app.UIAxes3,0,0, 'go','LineWidth',3)
            hold(app.UIAxes3,"on");
            plot(app.UIAxes3,xyz(1,1),xyz(1,3),'r*','MarkerSize',7)
            plot(app.UIAxes3,xyz(:,1),xyz(:,3),'r-',"LineWidth",2)
            legend(app.UIAxes3, 'SNR', 'Moment wykrycia', 'Tor ruchu celu',"Location","southeast") 
%             axis(app.UIAxes3, 'equal');
            ylim(app.UIAxes3,[0 inf])
            xlim(app.UIAxes3,[0 inf])
            ax = app.UIAxes3;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.XLabel.String = 'x [m]';
            ax.YLabel.String = 'z [m]';
            hold(app.UIAxes3,"off");
            
            %wykres polar
            [theta,rho] = cart2pol(xyz(:,1),xyz(:,2));
            
            Pax = polaraxes(app.Panel);
            hold(Pax);
            polarplot(Pax,0+0i,'go','MarkerSize',7,"LineWidth",2)
            polarplot(Pax,theta(1).*-1,rho(1)./1000,'r*','MarkerSize',7)
            polarplot(Pax,theta.*-1,rho./1000,'r-','linewidth',2)
            legend(Pax,'SNR','wykrycie celu','tor lotu celu')
            title(Pax,'Wykres toru ruchu celu (Polar)')

            Pax.Units = 'pixels';
            Pax.ThetaZeroLocation = 'top';
            Pax.ThetaDir = 'clockwise';
            Pax.FontSize = 12;
            Pax.RAxisLocation = 0;
            
        end
        
        function Rocket_Plots(app,xyz_c,xyz_r,xyz_sc)
            %wykres 3D
            plot3(app.UIAxes_2,0,0,0,'go','LineWidth',3)
            hold(app.UIAxes_2,'on');
            plot3(app.UIAxes_2,xyz_c(:,1),xyz_c(:,2),xyz_c(:,3),'r-',"LineWidth",2)
            plot3(app.UIAxes_2,xyz_r(:,1),xyz_r(:,2),xyz_r(:,3),'b:',"LineWidth",2)
            plot3(app.UIAxes_2,xyz_r(end,1),xyz_r(end,2),xyz_r(end,3),'b*','MarkerSize',7)
            plot3(app.UIAxes_2,xyz_sc(1,1),xyz_sc(1,2),xyz_sc(1,3),'kx','MarkerSize',7,'Linewidth',2)
%             view(-45,45)
            
            legend(app.UIAxes_2, 'SNR','tor ruchu celu','tor ruchu rakiety','wybuch rakiety','moment wystrzelenia rakiety')
            title(app.UIAxes_2, 'Wykres trajektorii celu i rakiety (3D)')
            axis(app.UIAxes_2, 'equal');
            ax = app.UIAxes_2;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.ZGrid = 'on';
            ax.XLabel.String = 'x [m]';
            ax.YLabel.String = 'y [m]';
            ax.ZLabel.String = 'z [m]';
            hold(app.UIAxes_2,'off');
            
            %wykres 2D XY
            plot(app.UIAxes2_2,0,0,'go','LineWidth',3)
            hold(app.UIAxes2_2,'on');
            plot(app.UIAxes2_2,xyz_c(:,1),xyz_c(:,2),'r-',"LineWidth",2)
            plot(app.UIAxes2_2,xyz_r(:,1),xyz_r(:,2),'b:',"LineWidth",2)
            plot(app.UIAxes2_2,xyz_r(end,1),xyz_r(end,2),'b*','MarkerSize',7)
            plot(app.UIAxes2_2,xyz_sc(1,1),xyz_sc(1,2),'kx','MarkerSize',7,'Linewidth',2)
            
            title(app.UIAxes2_2, 'Wykres trajektorii celu i rakiety (2D)')
            ylim(app.UIAxes2_2,[0 inf])
            xlim(app.UIAxes2_2,[0 inf])
            ax = app.UIAxes2_2;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.XLabel.String = 'x [m]';
            ax.YLabel.String = 'y [m]';
            hold(app.UIAxes2_2,'off');

            %wykres 2D XZ
            plot(app.UIAxes3_2,0,0,'go','LineWidth',3)
            hold(app.UIAxes3_2,'on');
            plot(app.UIAxes3_2,xyz_c(:,1),xyz_c(:,3),'r-',"LineWidth",2)
            plot(app.UIAxes3_2,xyz_r(:,1),xyz_r(:,3),'b:',"LineWidth",2)
            plot(app.UIAxes3_2,xyz_r(end,1),xyz_r(end,3),'b*','MarkerSize',7)
            plot(app.UIAxes3_2,xyz_sc(1,1),xyz_sc(1,3),'kx','MarkerSize',7,'Linewidth',2)
            
            legend(app.UIAxes3_2, 'SNR','tor ruchu celu','tor ruchu rakiety','wybuch rakiety','moment wystrzelenia rakiety',"Location","southeast")
            ylim(app.UIAxes3_2,[0 inf])
            xlim(app.UIAxes3_2,[0 inf])
            ax = app.UIAxes3_2;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.XLabel.String = 'x [m]';
            ax.YLabel.String = 'z [m]';
            hold(app.UIAxes3_2,'off');
            
            %wykres polar
            [theta,rho] = cart2pol(xyz_c(:,1),xyz_c(:,2));
            [theta_r,rho_r] = cart2pol(xyz_r(:,1),xyz_r(:,2));
            [theta_sc,rho_sc] = cart2pol(xyz_sc(1,1),xyz_sc(1,2));
            
            Pax = polaraxes(app.Panel_2);
            hold(Pax);
            polarplot(Pax,0+0i,'go','MarkerSize',7,"LineWidth",2)
            polarplot(Pax,theta.*-1,rho./1000,'r-','linewidth',2)
            polarplot(Pax,theta_r.*-1,rho_r./1000,'b:','linewidth',2)
            polarplot(Pax,theta_r(end).*-1,rho_r(end)./1000,'b*','MarkerSize',7)
            polarplot(Pax,theta_sc*-1,rho_sc/1000,'kx','MarkerSize',7,'Linewidth',2)
 
            legend(Pax,'SNR','tor ruchu celu','tor ruchu rakiety','wybuch rakiety','moment wystrzelenia rakiety')
            title(Pax,'Wykres trajektorii celu i rakiety (Polar)')
            Pax.Units = 'pixels';
            Pax.ThetaZeroLocation = 'top';
            Pax.ThetaDir = 'clockwise';
            Pax.FontSize = 12;
            Pax.RAxisLocation = 0;
        end
        
        function Charakterystyka_Rozrzutu(app,sigma_B,sigma_E,M)
            t=linspace(0,2*pi,100);
            x = sigma_B.*cos(t);
            y = sigma_E.*sin(t);
            x = x + M(1,1);
            y = y + M(1,2);
            
            x2 = 2*sigma_B.*cos(t);
            y2 = 2*sigma_E.*sin(t);
            x2 = x2 + M(1,1);
            y2 = y2 + M(1,2);
            
            x3 = 3*sigma_B.*cos(t);
            y3 = 3*sigma_E.*sin(t);
            x3 = x3 + M(1,1);
            y3 = y3 + M(1,2);
            
            plot(app.UIAxes7,0,0,'ro',"LineWidth",2)
            hold(app.UIAxes7,'on')
            plot(app.UIAxes7,M(1,1),M(1,2),'b+',"LineWidth",1.5,"MarkerSize",10)
            plot(app.UIAxes7,x,y,'y',"LineWidth",1.5)
            plot(app.UIAxes7,x2,y2,"Color",[0.9290 0.6940 0.1250],"LineWidth",1.5)
            plot(app.UIAxes7,x3,y3,"Color",[0.4660 0.6740 0.1880],"LineWidth",1.5)
            xlabel(app.UIAxes7,'h_\beta')
            ylabel(app.UIAxes7,'h_\epsilon')
            legend(app.UIAxes7,'Cel','Środek rozrzutu [m_\beta, m_\epsilon]','Elipsa_1 [\sigma_\beta, \sigma_\epsilon]',...
            'Elipsa_2 [2\sigma_\beta, 2\sigma_\epsilon]','Elipsa_3 [3\sigma_\beta, 3\sigma_\epsilon]','Location','northeastoutside')
            title(app.UIAxes7,'Charakterystyka rozrzutu')
            ax = app.UIAxes7;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.XAxisLocation = 'origin';
            ax.YAxisLocation = 'origin';
            axis(app.UIAxes7,'equal') 
            hold(app.UIAxes7,'off')
        end
        
        function Wyk_Pstwa_Porazenia(app,W,H,hmax)
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
            
            
            plot(app.UIAxes8,h,P,'LineWidth',2)
            hold(app.UIAxes8,'on')
            plot(app.UIAxes8,h,Pod,'r--')
            plot(app.UIAxes8,h,Pf,'k--')
            title(app.UIAxes8,{'Prawdopodobieństwo porażenia celu w zależności od h'; ['dla H = ' num2str(H) ' m']})
            xlabel(app.UIAxes8,'h [m]')
            ylabel(app.UIAxes8,'G(h)')
            ylim(app.UIAxes8,[0 1.1])
            legend(app.UIAxes8,'G(h)','P odłamków','P fali uderzeniowej')
            hold(app.UIAxes8,'off')
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.T=0:0.001:app.t_sim; app.T=app.T';
            app.B_cel_dot=zeros(length(app.T),1);   %prędkość kątowa w azymucie celu
            app.E_cel_dot=zeros(length(app.T),1);   %prędkość kątowa w elewacji celu
            app.Ac=zeros(length(app.T),1); 
            app.OXhmSlider.Enable = 'off';
            app.WysokoHkmKnob.Enable = 'off';
            app.UstawwysokodetonacjiButton.Enable = 'off';
            
            app.TabGroup2.Visible = 'off';
        end

        % Value changed function: SymulacjerwnolegeSwitch
        function SymulacjerwnolegeSwitchValueChanged(app, event)
            value = app.SymulacjerwnolegeSwitch.Value;
            
            if strcmp(value,'On')
                app.Para = 1;
            else
                app.Para = 0;
            end
            
        end

        % Value changed function: czassymulacjisEditField
        function czassymulacjisEditFieldValueChanged(app, event)
            app.t_sim = app.czassymulacjisEditField.Value;
            
        end

        % Value changed function: liczbastrzelaEditField
        function liczbastrzelaEditFieldValueChanged(app, event)
            app.l_strzelan = app.liczbastrzelaEditField.Value;
            
        end

        % Value changed function: metodanaprowadzaniaDropDown
        function metodanaprowadzaniaDropDownValueChanged(app, event)
            app.r_napr = app.metodanaprowadzaniaDropDown.Value;
            
        end

        % Value changed function: welewacjistopnieEditField
        function welewacjistopnieEditFieldValueChanged(app, event)
            app.sigma_E = app.welewacjistopnieEditField.Value;
            
        end

        % Value changed function: wazymuciestopnieEditField
        function wazymuciestopnieEditFieldValueChanged(app, event)
            app.sigma_B = app.wazymuciestopnieEditField.Value;
            
        end

        % Value changed function: wodlegocimEditField_2
        function wodlegocimEditField_2ValueChanged(app, event)
            app.sigma_R = app.wodlegocimEditField_2.Value;
            
        end

        % Value changed function: welewacjistopnieEditField_2
        function welewacjistopnieEditField_2ValueChanged(app, event)
            app.sigma_EC = app.welewacjistopnieEditField_2.Value;
            
        end

        % Value changed function: wazymuciestopnieEditField_2
        function wazymuciestopnieEditField_2ValueChanged(app, event)
            app.sigma_BC = app.wazymuciestopnieEditField_2.Value;
            
        end

        % Value changed function: wodlegocimEditField
        function wodlegocimEditFieldValueChanged(app, event)
            app.sigma_RC = app.wodlegocimEditField.Value;
            
        end

        % Value changed function: masamateriauwybuchowegoEditField
        function masamateriauwybuchowegoEditFieldValueChanged(app, event)
            app.m = app.masamateriauwybuchowegoEditField.Value;
            
        end

        % Value changed function: iloodamkwEditField
        function iloodamkwEditFieldValueChanged(app, event)
            app.n = app.iloodamkwEditField.Value;
            
        end

        % Value changed function: ktrozlotuodamkwstopnieEditField
        function ktrozlotuodamkwstopnieEditFieldValueChanged(app, event)
            value = app.ktrozlotuodamkwstopnieEditField.Value;
            app.alfa = deg2rad(value);
            
        end

        % Value changed function: pooeniex0mEditField
        function pooeniex0mEditFieldValueChanged(app, event)
            app.x0 = app.pooeniex0mEditField.Value;
            
            if app.x0 > sqrt(23500^2-app.y0^2-app.z0^2)+app.v0*40 %warunek znalezienia się celu w strafie startu
                app.x0 = sqrt(23500^2-app.y0^2-app.z0^2)+app.v0*40;
                if isreal(app.x0)  
                else
                   app.x0 = 0;
                end
                app.pooeniex0mEditField.Value = app.x0;
            end
            
        end

        % Value changed function: pooeniez0mEditField
        function pooeniez0mEditFieldValueChanged(app, event)
            app.z0 = app.pooeniez0mEditField.Value;
            
            if app.x0 > sqrt(23500^2-app.y0^2-app.z0^2)+app.v0*40 %warunek znalezienia się celu w strafie startu
                app.x0 = sqrt(23500^2-app.y0^2-app.z0^2)+app.v0*40;
                if isreal(app.x0)
                else
                   app.x0 = 0;
                end
                app.pooeniex0mEditField.Value = app.x0;
            end
            
        end

        % Value changed function: powierzchniawraliwacelum2EditField
        function powierzchniawraliwacelum2EditFieldValueChanged(app, event)
            app.Sw = app.powierzchniawraliwacelum2EditField.Value;
            
        end

        % Value changed function: prdkopocztkowamsEditField
        function prdkopocztkowamsEditFieldValueChanged(app, event)
            app.v0 = app.prdkopocztkowamsEditField.Value;
            
        end

        % Value changed function: pooeniey0mEditField
        function pooeniey0mEditFieldValueChanged(app, event)
            app.y0 = app.pooeniey0mEditField.Value;
            
            if app.x0 > sqrt(23500^2-app.y0^2-app.z0^2)+app.v0*40 %warunek znalezienia się celu w strafie startu
                app.x0 = sqrt(23500^2-app.y0^2-app.z0^2)+app.v0*40;
                if isreal(app.x0)  
                else
                   app.x0 = 0;
                end
                app.pooeniex0mEditField.Value = app.x0;
            end
            
        end

        % Button pushed function: SYMULACJAButton
        function SYMULACJAButtonPushed(app, event)
            app.SymulujtorruchuceluButton.Enable = 'off';
            app.SYMULACJAButton.Enable = 'off';
            app.PojedynczystrzaButton.Enable = 'off';
            app.OXhmSlider.Enable = 'off';
            app.WysokoHkmKnob.Enable = 'off';
            app.UstawwysokodetonacjiButton.Enable = 'off';
            app.DodajmanewryButton.Enable = 'off';
            app.WyczymanewryButton.Enable = 'off';
            
            fig = uifigure;
            d = uiprogressdlg(fig,'Title',['Symulacja ' num2str(app.l_strzelan) ' strzelań'],'Message','Trwa wczytywanie danych...','Indeterminate','on');
            app.Lamp.Color = 'r';
            
            R1=random('Normal',0,app.sigma_B,1,app.l_strzelan); %generowanie losowych błędów UOW rakiety
            R2=random('Normal',0,app.sigma_E,1,app.l_strzelan);
            R3=random('Normal',0,app.sigma_R,1,app.l_strzelan);
            R1C=random('Normal',0,app.sigma_BC,1,app.l_strzelan); %generowanie losowych błędów UOW celu
            R2C=random('Normal',0,app.sigma_EC,1,app.l_strzelan);
            R3C=random('Normal',0,app.sigma_RC,1,app.l_strzelan);

            %symulacja wstępna obwodu naprowadzania oraz celu
            in = Simulink.SimulationInput('obwod_naprowadzania_JW');
            in = in.setVariable('t_sim',app.t_sim);
            in = in.setVariable('v0',app.v0);
            in = in.setVariable('x0',app.x0);
            in = in.setVariable('y0',app.y0);
            in = in.setVariable('z0',app.z0);
            in = in.setVariable('T',app.T);
            in = in.setVariable('E_cel0',app.E_cel0);
            in = in.setVariable('E_cel_dot',app.E_cel_dot);
            in = in.setVariable('B_cel0',app.B_cel0);
            in = in.setVariable('B_cel_dot',app.B_cel_dot);
            in = in.setVariable('Ac',app.Ac);
            
            in = in.setVariable('Fs',190000); % Ciag silnika startowego (250000-270000) [N]
            in = in.setVariable('Fm',7800); % Ciag silnika marszowego [N]
            in = in.setVariable('g',9.81); % Przyspieszenie ziemskie [m/s^2]
            in = in.setVariable('S',0.114); % Powierzchnia charakterystyczna rakiety [m^2]
            in = in.setVariable('caL',4.132); % Srednia cieciwa aerodynamiczna [m]
            in = in.setVariable('Is0',1826.05); % Moment bezwladnosci  [kg*m^2]
            in = in.setVariable('Is1',1190.26); % Moment bezwladnosci  [kg*m^2]
            in = in.setVariable('Im0',311.75); % Moment bezwladnosci  [kg*m^2]
            in = in.setVariable('Im1',182.1); % Moment bezwladnosci  [kg*m^2]
            in = in.setVariable('ts',3); % Czas pracy silnika startowego (2.6-4.1) [s]
            in = in.setVariable('tm',20); % Czas pracy silnika marszowego (16-22) [s]
            in = in.setVariable('tster',3.7); % Czas włączenia sterowania [s]
            in = in.setVariable('fi',0*pi/180); % Kat plaszczyzn sterowania
            in = in.setVariable('licznik_z',1); % dane UWK
            in = in.setVariable('h_uwk',0.005);
            in = in.setVariable('epsilon_0_prim_srcp',-0.0007625); % prędkość kątowa linii obserwacji celu w elewacji [rad/s]
            in = in.setVariable('beta_0_prim_srcp',0); % prędkość kątowa linii obserwacji celu w azymucie [rad/s]
            
            in = in.setVariable('RB',0);
            in = in.setVariable('RE',0);
            in = in.setVariable('R',0);
            in = in.setVariable('RBC',0);
            in = in.setVariable('REC',0);
            in = in.setVariable('RC',0);
            out = sim(in,'UseFastRestart','on');
            
            inc = Simulink.SimulationInput('cel_sim');
            inc = inc.setVariable('t_sim',app.t_sim);
            inc = inc.setVariable('v0',app.v0);
            inc = inc.setVariable('x0',app.x0);
            inc = inc.setVariable('y0',app.y0);
            inc = inc.setVariable('z0',app.z0);
            inc = inc.setVariable('T',app.T);
            inc = inc.setVariable('E_cel0',app.E_cel0);
            inc = inc.setVariable('E_cel_dot',app.E_cel_dot);
            inc = inc.setVariable('B_cel0',app.B_cel0);
            inc = inc.setVariable('B_cel_dot',app.B_cel_dot);
            inc = inc.setVariable('Ac',app.Ac);
            outc=sim(inc,'UseFastRestart','on');
            
            %sprawdzenie czy cel znajduje się w zasięgu zestawu 
            if any(out.flag_r_start) || any(out.flag_r_cel)    
                
                %deklaracja parametrów symulacji
                for i=app.l_strzelan:-1:1
                    in(i) = Simulink.SimulationInput('obwod_naprowadzania_JW');
                    in(i) = in(i).setVariable('t_sim',app.t_sim);
                    in(i) = in(i).setVariable('v0',app.v0);
                    in(i) = in(i).setVariable('x0',app.x0);
                    in(i) = in(i).setVariable('y0',app.y0);
                    in(i) = in(i).setVariable('z0',app.z0);
                    in(i) = in(i).setVariable('T',app.T);
                    in(i) = in(i).setVariable('E_cel0',app.E_cel0);
                    in(i) = in(i).setVariable('E_cel_dot',app.E_cel_dot);
                    in(i) = in(i).setVariable('B_cel0',app.B_cel0);
                    in(i) = in(i).setVariable('B_cel_dot',app.B_cel_dot);
                    in(i) = in(i).setVariable('Ac',app.Ac);
                    
                    in(i) = in(i).setVariable('Fs',190000); % Ciag silnika startowego (250000-270000) [N]
                    in(i) = in(i).setVariable('Fm',7800); % Ciag silnika marszowego [N]
                    in(i) = in(i).setVariable('g',9.81); % Przyspieszenie ziemskie [m/s^2]
                    in(i) = in(i).setVariable('S',0.114); % Powierzchnia charakterystyczna rakiety [m^2]
                    in(i) = in(i).setVariable('caL',4.132); % Srednia cieciwa aerodynamiczna [m]
                    in(i) = in(i).setVariable('Is0',1826.05); % Moment bezwladnosci  [kg*m^2]
                    in(i) = in(i).setVariable('Is1',1190.26); % Moment bezwladnosci  [kg*m^2]
                    in(i) = in(i).setVariable('Im0',311.75); % Moment bezwladnosci  [kg*m^2]
                    in(i) = in(i).setVariable('Im1',182.1); % Moment bezwladnosci  [kg*m^2]
                    in(i) = in(i).setVariable('ts',3); % Czas pracy silnika startowego (2.6-4.1) [s]
                    in(i) = in(i).setVariable('tm',20); % Czas pracy silnika marszowego (16-22) [s]
                    in(i) = in(i).setVariable('tster',3.7); % Czas włączenia sterowania [s]
                    in(i) = in(i).setVariable('fi',0*pi/180); % Kat plaszczyzn sterowania
                    in(i) = in(i).setVariable('licznik_z',1); % dane UWK
                    in(i) = in(i).setVariable('h_uwk',0.005);
                    in(i) = in(i).setVariable('epsilon_0_prim_srcp',-0.0007625); % prędkość kątowa linii obserwacji celu w elewacji [rad/s]
                    in(i) = in(i).setVariable('beta_0_prim_srcp',0); % prędkość kątowa linii obserwacji celu w azymucie [rad/s]
                    
                    in(i) = in(i).setVariable('RB',R1(i));
                    in(i) = in(i).setVariable('RE',R2(i));
                    in(i) = in(i).setVariable('R',R3(i));
                    in(i) = in(i).setVariable('RBC',R1C(i));
                    in(i) = in(i).setVariable('REC',R2C(i));
                    in(i) = in(i).setVariable('RC',R3C(i));
                end
                d = uiprogressdlg(fig,'Title',['Symulacja ' num2str(app.l_strzelan) ' strzelań'],'Message','Trwa symulacja...','Indeterminate','on');
                %wykonanie serii strzelań
                switch app.Para
                    case 1
                        outsim = parsim(in,'UseFastRestart','on');
                    case 0
                        outsim = sim(in,'UseFastRestart','on');
                end

            else
                error('Cel poza zasięgiem PZR')
            end
            
            d = uiprogressdlg(fig,'Title',['Symulacja ' num2str(app.l_strzelan) ' strzelań'],'Message','Trwa obróbka danych...','Indeterminate','on');
            %%obróbka
            %Wykrycie rodzaju celu
            if app.v0==0
                app.r_celu='Cel nieruchomy';
            elseif any(app.B_cel_dot) && any(app.E_cel_dot) 
                app.r_celu='Cel manewrujący';
            elseif any(app.E_cel_dot)
                app.r_celu='Cel manewrujący w E';
            elseif any(app.B_cel_dot)
                app.r_celu='Cel manewrujący w B';
            else
                app.r_celu='Cel niemanewrujący';
            end
            
            %Macierze i zmienne wykorzystywane do podsumowania strzelania
            H=zeros(app.l_strzelan,6); 
            Z=zeros(app.l_strzelan,2,"logical");
            l_t=0;
            
            %pętla przypisująca dane do zmiennych oraz macierzy podsumowania
            for i=1:app.l_strzelan
                Z(i,1)=any(outsim(i).flag_r_start);
                Z(i,2)=any(outsim(i).flag_r_cel);
                
                if Z(i,1)==1 && Z(i,2)==1
                    %funkcja wyznaczająca punkty trafień
                    [H(i,1),H(i,2),H(i,3)]=Punkty_Strzelan(app,outsim(i).xyz_r,outsim(i).xyz_c);
                    %wyznaczanie prawdopodobieństwa porażenia celu
                    [H(i,4)]=Pstwo(app,H(i,3),app.n,app.Sw,app.alfa,outsim(i).xyz_r(end,3),app.m);
                    if H(i,4)==1
                        l_t=l_t+1;
                    end
                    %wyznaczanie czasu lotu rakiety
                    H(i,5)=outsim(i).r_time;
                    %wyznacznie odległości osiągnięcia celu przez rakietę
                    H(i,6)=sqrt(outsim(i).xyz_c(end,1)^2+outsim(i).xyz_c(end,2)^2+outsim(i).xyz_c(end,3)^2);
                else
                    H(i,:)=[NaN NaN NaN NaN NaN NaN];
                end
            end
            
            %wyznaczanie położenia celu w momencie startu rakiety
            if any(out.flag_r_start)  %Warunek wystrzelenia rakiety
                [r,~]=find(out.flag_r_start,1,'first');
                xyz_sc=out.xyz_c(r,:); 
            else
                xyz_sc=[NaN NaN NaN];
            end
            
            struktura_danych.macierz_podsumowania=H;
            struktura_danych.xyz_r=out.xyz_r;
            struktura_danych.xyz_c=out.xyz_c;
            struktura_danych.tor_ruchu_celu=outc.xyz_c.Data;
            struktura_danych.xyz_c_przy_starcie_rakiety=xyz_sc;
            struktura_danych.predkosc_celu=out.Vc;
            struktura_danych.predkosc_rakiety=out.Vr;
            struktura_danych.wyniki_strzelan=[sum(Z(:,1)) l_t];
            struktura_danych.parametry_glowicy_rakiety=[app.m app.alfa app.n app.Sw];
            struktura_danych.warunki_strzelania={app.r_napr app.r_celu app.l_strzelan};
            
            %%Aktualizacja podsumowania strzelania
            Target_Plots(app,struktura_danych.tor_ruchu_celu)
            app.UITable.Data = {struktura_danych.warunki_strzelania{2},struktura_danych.warunki_strzelania{3},mean(struktura_danych.predkosc_celu.Data),max(struktura_danych.xyz_c(:,3)),...
                min(struktura_danych.xyz_c(:,3)),max(struktura_danych.xyz_c(:,2)),sqrt(struktura_danych.xyz_c(1,1)^2+struktura_danych.xyz_c(1,2)^2+struktura_danych.xyz_c(1,3)^2)};
            
            Rocket_Plots(app,struktura_danych.xyz_c,struktura_danych.xyz_r,struktura_danych.xyz_c_przy_starcie_rakiety)
            
            plot(app.UIAxes_3,struktura_danych.predkosc_rakiety.Time,struktura_danych.predkosc_rakiety.Data,"LineWidth",2)
            hold(app.UIAxes_3,'on')
            plot(app.UIAxes_3,struktura_danych.predkosc_celu.Time,struktura_danych.predkosc_celu.Data,"LineWidth",2)
            xlabel(app.UIAxes_3,'Czas [s]')
            ylabel(app.UIAxes_3,'prędkość [m/s]')
            legend(app.UIAxes_3,'v_r','v_c','Location',"northeastoutside")
            ylim(app.UIAxes_3,[0 inf])
            title(app.UIAxes_3,'Prędkość rakiety i celu')
            hold(app.UIAxes_3,'off')
            
            app.UITable_2.Data={struktura_danych.warunki_strzelania{1},struktura_danych.wyniki_strzelan(1),mean(H(:,4)),struktura_danych.wyniki_strzelan(2),mean(H(:,5)),...
                struktura_danych.predkosc_rakiety.Data(end),mean(H(:,6))};
            
            app.UITable2.Data = {max(H(:,3)),min(H(:,3)),mean(H(:,3)),median(H(:,3)),mode(round(H(:,3),1)),max(H(:,3))-min(H(:,3)),var(H(:,3)),std(H(:,3)),mean(abs(H(:,3))),iqr(H(:,3));...
                max(H(:,1)),min(H(:,1)),mean(H(:,1)),median(H(:,1)),mode(round(H(:,1),1)),max(H(:,1))-min(H(:,1)),var(H(:,1)),std(H(:,1)),mean(abs(H(:,1))),iqr(H(:,1));...
                max(H(:,2)),min(H(:,2)),mean(H(:,2)),median(H(:,2)),mode(round(H(:,2),1)),max(H(:,2))-min(H(:,2)),var(H(:,2)),std(H(:,2)),mean(abs(H(:,2))),iqr(H(:,2))};
            
            boxplot(app.UIAxes4,H(:,1:3),'Labels',{'h_epsilon','h_beta','h'})
            ylabel(app.UIAxes4,'[m]')
            title(app.UIAxes4,'Wykres ramkowy uchybów')
            
            histfit(app.UIAxes5,H(:,2),30,'normal')
            title(app.UIAxes5,'h_\beta')
            xlabel(app.UIAxes5,'[m]')
            axis(app.UIAxes5,'tight') 
            
            histfit(app.UIAxes5_2,H(:,1),30,'normal')
            title(app.UIAxes5_2,'h_\epsilon')
            xlabel(app.UIAxes5_2,'[m]')
            axis(app.UIAxes5_2,'tight') 
            
            histfit(app.UIAxes5_3,H(:,3),30,'normal')
            title(app.UIAxes5_3,'h=\surd(h_\beta^2+h_\epsilon^2)')
            xlabel(app.UIAxes5_3,'[m]')
            axis(app.UIAxes5_3,'tight')
            xlim(app.UIAxes5_3,[0 inf])
            
            scatter(app.UIAxes6,H(:,2),H(:,1),50,'blue','*')
            hold(app.UIAxes6,'on')
            scatter(app.UIAxes6,0,0,50,'red','filled')
            title(app.UIAxes6,'')
            legend(app.UIAxes6,'h_\beta^*, h_\epsilon^*','cel')
            ax = app.UIAxes6;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.XLabel.String = 'h_\beta [m]';
            ax.YLabel.String = 'h_\epsilon [m]';
            ax.XAxisLocation = 'origin';
            ax.YAxisLocation = 'origin';
            hold(app.UIAxes6,'off')
            
            Charakterystyka_Rozrzutu(app,std(H(:,2)),std(H(:,1)),[mean(H(:,2)) mean(H(:,1))])
            
            app.Parametry_glowicy = struktura_danych.parametry_glowicy_rakiety;
            app.wys_koncowa = struktura_danych.xyz_r(end,3);
            app.WysokoHkmKnob.Value = app.wys_koncowa/1000;
            
            Wyk_Pstwa_Porazenia(app,app.Parametry_glowicy,app.WysokoHkmKnob.Value*1000,app.OXhmSlider.Value)
            
            P1=nnz(struktura_danych.macierz_podsumowania(:,4)==1);
            P080=nnz(struktura_danych.macierz_podsumowania(:,4)>0.8)-P1;
            P060=nnz(struktura_danych.macierz_podsumowania(:,4)>0.6)-P1-P080;
            P040=nnz(struktura_danych.macierz_podsumowania(:,4)>0.4)-P1-P080-P060;
            P020=nnz(struktura_danych.macierz_podsumowania(:,4)>0.2)-P1-P080-P060-P040;
            P000=nnz(struktura_danych.macierz_podsumowania(:,4)<0.2);
            
            labels = {'P=1','0.8<P<1','0.6<P<0.8','0.4<P<0.6','0.2<P<0.4','P<0.2'};
            p=pie(app.UIAxes9,[P1 P080 P060 P040 P020 P000],'%.4g%%');
            legend(app.UIAxes9,labels,'Location',"southeastoutside")
            title(app.UIAxes9,'Wykres kołowy uzyskanego prawdopodobieństwa')
            p(1).FaceColor='y';
            p(3).FaceColor='#EDB120';
            p(5).FaceColor='#77AC30';
            p(9).FaceColor='#0072BD';
            p(11).FaceColor='#7E2F8E';
            
            b = bar(app.UIAxes10,reordercats(categorical({'P=1','0.8<P<1','0.6<P<0.8','0.4<P<0.6','0.2<P<0.4','P<0.2'}),...
                {'P=1','0.8<P<1','0.6<P<0.8','0.4<P<0.6','0.2<P<0.4','P<0.2'}),[P1 P080 P060 P040 P020 P000]);
            xlabel(app.UIAxes10,'')
            title(app.UIAxes10,'Wykres słupowy uzyskanego prawdopodobieństwa')
            b.FaceColor = 'flat';
            b.CData(1,:) = [1 1 0];
            b.CData(2,:) = [0.9290 0.6940 0.1250];
            b.CData(3,:) = [0.4660 0.6740 0.1880];
            b.CData(4,:) = [0.4118 0.8392 0.6706];
            b.CData(5,:) = [0 0.4470 0.7410];
            b.CData(6,:) = [0.4940 0.1840 0.5560];
            
            app.Lamp.Color = 'g';   
            
            app.SymulujtorruchuceluButton.Enable = 'on';
            app.SYMULACJAButton.Enable = 'on';
            app.PojedynczystrzaButton.Enable = 'on';
            app.OXhmSlider.Enable = 'on';
            app.WysokoHkmKnob.Enable = 'on';
            app.DodajmanewryButton.Enable = 'on';
            app.WyczymanewryButton.Enable = 'on';
            
            app.WykonajsymulacjeabywywietlipodsumowanieLabel.Visible = 'off';
            app.TabGroup2.Visible = 'on';

            close(d)
            close(fig)
        end

        % Button pushed function: SymulujtorruchuceluButton
        function SymulujtorruchuceluButtonPushed(app, event)
            fig = uifigure;
            d = uiprogressdlg(fig,'Title','Symulacja celu','Message','Trwa symulacja...','Indeterminate','on');
            
            app.SymulujtorruchuceluButton.Enable = 'off';
            app.SYMULACJAButton.Enable = 'off';
            app.PojedynczystrzaButton.Enable = 'off';
            app.DodajmanewryButton.Enable = 'off';
            app.WyczymanewryButton.Enable = 'off';
            
            in = Simulink.SimulationInput('cel_sim');
            in = in.setVariable('t_sim',app.t_sim);
            in = in.setVariable('v0',app.v0);
            in = in.setVariable('x0',app.x0);
            in = in.setVariable('y0',app.y0);
            in = in.setVariable('z0',app.z0);
            in = in.setVariable('T',app.T);
            in = in.setVariable('E_cel0',app.E_cel0);
            in = in.setVariable('E_cel_dot',app.E_cel_dot);
            in = in.setVariable('B_cel0',app.B_cel0);
            in = in.setVariable('B_cel_dot',app.B_cel_dot);
            in = in.setVariable('Ac',app.Ac);
            outc=sim(in,'UseFastRestart','on');
            
            if app.v0==0
                app.r_celu='Cel nieruchomy';
            elseif any(app.B_cel_dot) && any(app.E_cel_dot) 
                app.r_celu='Cel manewrujący';
            elseif any(app.E_cel_dot)
                app.r_celu='Cel manewrujący w E';
            elseif any(app.B_cel_dot)
                app.r_celu='Cel manewrujący w B';
            else
                app.r_celu='Cel niemanewrujący';
            end

            close(d)
            close(fig)
            
            % Open the options dialog and pass inputs
            app.DialogApp = aplikacja_tor_celu(app, outc, app.r_celu);

        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
            delete(app.DialogApp)
            delete(app)
            
        end

        % Button pushed function: PojedynczystrzaButton
        function PojedynczystrzaButtonPushed(app, event)
            fig = uifigure;
            d = uiprogressdlg(fig,'Title','Symulacja pojedyńczego strzelania','Message','Trwa symulacja...','Indeterminate','on');
            
            app.SymulujtorruchuceluButton.Enable = 'off';
            app.SYMULACJAButton.Enable = 'off';
            app.PojedynczystrzaButton.Enable = 'off';
            app.DodajmanewryButton.Enable = 'off';
            app.WyczymanewryButton.Enable = 'off';
            
            in = Simulink.SimulationInput('obwod_naprowadzania_JW');
            in = in.setVariable('t_sim',app.t_sim);
            in = in.setVariable('v0',app.v0);
            in = in.setVariable('x0',app.x0);
            in = in.setVariable('y0',app.y0);
            in = in.setVariable('z0',app.z0);
            in = in.setVariable('T',app.T);
            in = in.setVariable('E_cel0',app.E_cel0);
            in = in.setVariable('E_cel_dot',app.E_cel_dot);
            in = in.setVariable('B_cel0',app.B_cel0);
            in = in.setVariable('B_cel_dot',app.B_cel_dot);
            in = in.setVariable('Ac',app.Ac);
            
            in = in.setVariable('Fs',190000); % Ciag silnika startowego (250000-270000) [N]
            in = in.setVariable('Fm',7800); % Ciag silnika marszowego [N]
            in = in.setVariable('g',9.81); % Przyspieszenie ziemskie [m/s^2]
            in = in.setVariable('S',0.114); % Powierzchnia charakterystyczna rakiety [m^2]
            in = in.setVariable('caL',4.132); % Srednia cieciwa aerodynamiczna [m]
            in = in.setVariable('Is0',1826.05); % Moment bezwladnosci  [kg*m^2]
            in = in.setVariable('Is1',1190.26); % Moment bezwladnosci  [kg*m^2]
            in = in.setVariable('Im0',311.75); % Moment bezwladnosci  [kg*m^2]
            in = in.setVariable('Im1',182.1); % Moment bezwladnosci  [kg*m^2]
            in = in.setVariable('ts',3); % Czas pracy silnika startowego (2.6-4.1) [s]
            in = in.setVariable('tm',20); % Czas pracy silnika marszowego (16-22) [s]
            in = in.setVariable('tster',3.7); % Czas włączenia sterowania [s]
            in = in.setVariable('fi',0*pi/180); % Kat plaszczyzn sterowania
            in = in.setVariable('licznik_z',1); % dane UWK
            in = in.setVariable('h_uwk',0.005);
            in = in.setVariable('epsilon_0_prim_srcp',-0.0007625); % prędkość kątowa linii obserwacji celu w elewacji [rad/s]
            in = in.setVariable('beta_0_prim_srcp',0); % prędkość kątowa linii obserwacji celu w azymucie [rad/s]
            
            in = in.setVariable('RB',0);
            in = in.setVariable('RE',0);
            in = in.setVariable('R',0);
            in = in.setVariable('RBC',0);
            in = in.setVariable('REC',0);
            in = in.setVariable('RC',0);
            out = sim(in,'UseFastRestart','on');
            
            Z(1,1)=any(out.flag_r_start);
            Z(1,2)=any(out.flag_r_cel);
            
            if Z(1,1)==1 && Z(1,2)==1
                %funkcja wyznaczająca punkty trafień
                [H(1,1),H(1,2),H(1,3)]=Punkty_Strzelan(app,out.xyz_r,out.xyz_c);
                %wyznaczanie prawdopodobieństwa porażenia celu
                [H(1,4)]=Pstwo(app,H(1,3),app.n,app.Sw,app.alfa,out.xyz_r(end,3),app.m);
                %wyznaczanie czasu lotu rakiety
                H(1,5)=out.r_time;
                %wyznacznie odległości osiągnięcia celu przez rakietę
                H(1,6)=sqrt(out.xyz_c(end,1)^2+out.xyz_c(end,2)^2+out.xyz_c(end,3)^2);
            else
                H(1,:)=[NaN NaN NaN NaN NaN NaN];
            end
                
            
            %wyznaczanie położenia celu w momencie startu rakiety
            if any(out.flag_r_start)  %Warunek wystrzelenia rakiety
                [r,~]=find(out.flag_r_start,1,'first');
                xyz_sc=out.xyz_c(r,:); 
            else
                xyz_sc=[NaN NaN NaN];
            end
            close(d)
            close(fig)
            
            % Open the options dialog and pass inputs
            app.DialogApp = aplikacja_poj_strzal(app, out, app.r_napr, xyz_sc, H);
        end

        % Value changed function: OXhmSlider
        function OXhmSliderValueChanged(app, event)
            Wyk_Pstwa_Porazenia(app,app.Parametry_glowicy,app.WysokoHkmKnob.Value*1000,app.OXhmSlider.Value)
            
        end

        % Value changed function: WysokoHkmKnob
        function WysokoHkmKnobValueChanged(app, event)
            Wyk_Pstwa_Porazenia(app,app.Parametry_glowicy,app.WysokoHkmKnob.Value*1000,app.OXhmSlider.Value)
            app.UstawwysokodetonacjiButton.Enable = 'on';
            
        end

        % Value changed function: UstawwysokodetonacjiButton
        function UstawwysokodetonacjiButtonValueChanged(app, event)
            app.WysokoHkmKnob.Value = app.wys_koncowa/1000;
            Wyk_Pstwa_Porazenia(app,app.Parametry_glowicy,app.WysokoHkmKnob.Value*1000,app.OXhmSlider.Value)
            app.UstawwysokodetonacjiButton.Enable = 'off';
            
        end

        % Value changed function: DodajmanewryButton
        function DodajmanewryButtonValueChanged(app, event)
            app.SymulujtorruchuceluButton.Enable = 'off';
            app.SYMULACJAButton.Enable = 'off';
            app.PojedynczystrzaButton.Enable = 'off';
            app.DodajmanewryButton.Enable = 'off';
            app.WyczymanewryButton.Enable = 'off';
            
            app.DialogApp = aplikacja_manewry(app, app.B_cel_dot, app.E_cel_dot, app.Ac);
            
        end

        % Value changed function: WyczymanewryButton
        function WyczymanewryButtonValueChanged(app, event)
            app.B_cel_dot=zeros(length(app.T),1);   %prędkość kątowa w azymucie celu
            app.E_cel_dot=zeros(length(app.T),1);   %prędkość kątowa w elewacji celu
            app.Ac=zeros(length(app.T),1); 
            
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {766, 766};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {283, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 1246 766];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {283, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;

            % Create ParametrystrzelaniaPanel
            app.ParametrystrzelaniaPanel = uipanel(app.LeftPanel);
            app.ParametrystrzelaniaPanel.BorderType = 'none';
            app.ParametrystrzelaniaPanel.TitlePosition = 'centertop';
            app.ParametrystrzelaniaPanel.Title = 'Parametry strzelania';
            app.ParametrystrzelaniaPanel.BackgroundColor = [0.6627 0.8196 0.6941];
            app.ParametrystrzelaniaPanel.FontWeight = 'bold';
            app.ParametrystrzelaniaPanel.Position = [2 586 275 148];

            % Create SymulacjerwnolegeSwitchLabel
            app.SymulacjerwnolegeSwitchLabel = uilabel(app.ParametrystrzelaniaPanel);
            app.SymulacjerwnolegeSwitchLabel.HorizontalAlignment = 'center';
            app.SymulacjerwnolegeSwitchLabel.Position = [112 104 122 22];
            app.SymulacjerwnolegeSwitchLabel.Text = 'Symulacje równoległe';

            % Create SymulacjerwnolegeSwitch
            app.SymulacjerwnolegeSwitch = uiswitch(app.ParametrystrzelaniaPanel, 'slider');
            app.SymulacjerwnolegeSwitch.ValueChangedFcn = createCallbackFcn(app, @SymulacjerwnolegeSwitchValueChanged, true);
            app.SymulacjerwnolegeSwitch.Position = [38 107 36 16];
            app.SymulacjerwnolegeSwitch.Value = 'On';

            % Create czassymulacjisEditFieldLabel
            app.czassymulacjisEditFieldLabel = uilabel(app.ParametrystrzelaniaPanel);
            app.czassymulacjisEditFieldLabel.HorizontalAlignment = 'right';
            app.czassymulacjisEditFieldLabel.Position = [126 71 99 22];
            app.czassymulacjisEditFieldLabel.Text = 'czas symulacji [s]';

            % Create czassymulacjisEditField
            app.czassymulacjisEditField = uieditfield(app.ParametrystrzelaniaPanel, 'numeric');
            app.czassymulacjisEditField.Limits = [0 60];
            app.czassymulacjisEditField.ValueChangedFcn = createCallbackFcn(app, @czassymulacjisEditFieldValueChanged, true);
            app.czassymulacjisEditField.Position = [16 71 100 22];
            app.czassymulacjisEditField.Value = 30;

            % Create liczbastrzelaEditFieldLabel
            app.liczbastrzelaEditFieldLabel = uilabel(app.ParametrystrzelaniaPanel);
            app.liczbastrzelaEditFieldLabel.HorizontalAlignment = 'right';
            app.liczbastrzelaEditFieldLabel.Position = [132 38 82 22];
            app.liczbastrzelaEditFieldLabel.Text = 'liczba strzelań';

            % Create liczbastrzelaEditField
            app.liczbastrzelaEditField = uieditfield(app.ParametrystrzelaniaPanel, 'numeric');
            app.liczbastrzelaEditField.Limits = [5 500];
            app.liczbastrzelaEditField.ValueChangedFcn = createCallbackFcn(app, @liczbastrzelaEditFieldValueChanged, true);
            app.liczbastrzelaEditField.Position = [16 38 100 22];
            app.liczbastrzelaEditField.Value = 100;

            % Create metodanaprowadzaniaDropDownLabel
            app.metodanaprowadzaniaDropDownLabel = uilabel(app.ParametrystrzelaniaPanel);
            app.metodanaprowadzaniaDropDownLabel.HorizontalAlignment = 'right';
            app.metodanaprowadzaniaDropDownLabel.Position = [115 6 130 22];
            app.metodanaprowadzaniaDropDownLabel.Text = 'metoda naprowadzania';

            % Create metodanaprowadzaniaDropDown
            app.metodanaprowadzaniaDropDown = uidropdown(app.ParametrystrzelaniaPanel);
            app.metodanaprowadzaniaDropDown.Items = {'Metoda pokrycia'};
            app.metodanaprowadzaniaDropDown.ValueChangedFcn = createCallbackFcn(app, @metodanaprowadzaniaDropDownValueChanged, true);
            app.metodanaprowadzaniaDropDown.Position = [16 6 100 22];
            app.metodanaprowadzaniaDropDown.Value = 'Metoda pokrycia';

            % Create ParametrygowicybojowejrakietyPanel
            app.ParametrygowicybojowejrakietyPanel = uipanel(app.LeftPanel);
            app.ParametrygowicybojowejrakietyPanel.BorderType = 'none';
            app.ParametrygowicybojowejrakietyPanel.TitlePosition = 'centertop';
            app.ParametrygowicybojowejrakietyPanel.Title = 'Parametry głowicy bojowej rakiety';
            app.ParametrygowicybojowejrakietyPanel.BackgroundColor = [0.9608 0.7882 0.7882];
            app.ParametrygowicybojowejrakietyPanel.FontWeight = 'bold';
            app.ParametrygowicybojowejrakietyPanel.Position = [2 326 275 118];

            % Create masamateriauwybuchowegoEditFieldLabel
            app.masamateriauwybuchowegoEditFieldLabel = uilabel(app.ParametrygowicybojowejrakietyPanel);
            app.masamateriauwybuchowegoEditFieldLabel.HorizontalAlignment = 'right';
            app.masamateriauwybuchowegoEditFieldLabel.Position = [102 72 167 22];
            app.masamateriauwybuchowegoEditFieldLabel.Text = 'masa materiału wybuchowego';

            % Create masamateriauwybuchowegoEditField
            app.masamateriauwybuchowegoEditField = uieditfield(app.ParametrygowicybojowejrakietyPanel, 'numeric');
            app.masamateriauwybuchowegoEditField.Limits = [0 100];
            app.masamateriauwybuchowegoEditField.ValueChangedFcn = createCallbackFcn(app, @masamateriauwybuchowegoEditFieldValueChanged, true);
            app.masamateriauwybuchowegoEditField.Position = [10 72 79 22];
            app.masamateriauwybuchowegoEditField.Value = 70;

            % Create iloodamkwEditFieldLabel
            app.iloodamkwEditFieldLabel = uilabel(app.ParametrygowicybojowejrakietyPanel);
            app.iloodamkwEditFieldLabel.HorizontalAlignment = 'right';
            app.iloodamkwEditFieldLabel.Position = [105 39 87 22];
            app.iloodamkwEditFieldLabel.Text = 'ilość odłamków';

            % Create iloodamkwEditField
            app.iloodamkwEditField = uieditfield(app.ParametrygowicybojowejrakietyPanel, 'numeric');
            app.iloodamkwEditField.Limits = [0 4000];
            app.iloodamkwEditField.ValueChangedFcn = createCallbackFcn(app, @iloodamkwEditFieldValueChanged, true);
            app.iloodamkwEditField.Position = [10 39 79 22];
            app.iloodamkwEditField.Value = 2000;

            % Create ktrozlotuodamkwstopnieEditFieldLabel
            app.ktrozlotuodamkwstopnieEditFieldLabel = uilabel(app.ParametrygowicybojowejrakietyPanel);
            app.ktrozlotuodamkwstopnieEditFieldLabel.HorizontalAlignment = 'right';
            app.ktrozlotuodamkwstopnieEditFieldLabel.Position = [102 7 167 22];
            app.ktrozlotuodamkwstopnieEditFieldLabel.Text = 'kąt rozlotu odłamków [stopnie]';

            % Create ktrozlotuodamkwstopnieEditField
            app.ktrozlotuodamkwstopnieEditField = uieditfield(app.ParametrygowicybojowejrakietyPanel, 'numeric');
            app.ktrozlotuodamkwstopnieEditField.Limits = [0 90];
            app.ktrozlotuodamkwstopnieEditField.ValueChangedFcn = createCallbackFcn(app, @ktrozlotuodamkwstopnieEditFieldValueChanged, true);
            app.ktrozlotuodamkwstopnieEditField.Position = [10 7 79 22];
            app.ktrozlotuodamkwstopnieEditField.Value = 37;

            % Create ParametryruchuceluPanel
            app.ParametryruchuceluPanel = uipanel(app.LeftPanel);
            app.ParametryruchuceluPanel.TitlePosition = 'centertop';
            app.ParametryruchuceluPanel.Title = 'Parametry ruchu celu';
            app.ParametryruchuceluPanel.BackgroundColor = [0.698 0.9686 0.9569];
            app.ParametryruchuceluPanel.FontWeight = 'bold';
            app.ParametryruchuceluPanel.Position = [3 83 275 239];

            % Create pooeniex0mEditFieldLabel
            app.pooeniex0mEditFieldLabel = uilabel(app.ParametryruchuceluPanel);
            app.pooeniex0mEditFieldLabel.Position = [113 192 93 22];
            app.pooeniex0mEditFieldLabel.Text = 'położenie x0 [m]';

            % Create pooeniex0mEditField
            app.pooeniex0mEditField = uieditfield(app.ParametryruchuceluPanel, 'numeric');
            app.pooeniex0mEditField.Limits = [0 25000];
            app.pooeniex0mEditField.ValueDisplayFormat = '%.0f';
            app.pooeniex0mEditField.ValueChangedFcn = createCallbackFcn(app, @pooeniex0mEditFieldValueChanged, true);
            app.pooeniex0mEditField.Position = [10 192 79 22];
            app.pooeniex0mEditField.Value = 13982;

            % Create pooeniez0mEditField
            app.pooeniez0mEditField = uieditfield(app.ParametryruchuceluPanel, 'numeric');
            app.pooeniez0mEditField.Limits = [0 25000];
            app.pooeniez0mEditField.ValueDisplayFormat = '%.0f';
            app.pooeniez0mEditField.ValueChangedFcn = createCallbackFcn(app, @pooeniez0mEditFieldValueChanged, true);
            app.pooeniez0mEditField.Position = [10 135 79 22];
            app.pooeniez0mEditField.Value = 4000;

            % Create pooeniez0mEditFieldLabel
            app.pooeniez0mEditFieldLabel = uilabel(app.ParametryruchuceluPanel);
            app.pooeniez0mEditFieldLabel.Position = [113 135 93 22];
            app.pooeniez0mEditFieldLabel.Text = 'położenie z0 [m]';

            % Create powierzchniawraliwacelum2EditField
            app.powierzchniawraliwacelum2EditField = uieditfield(app.ParametryruchuceluPanel, 'numeric');
            app.powierzchniawraliwacelum2EditField.Limits = [0 2];
            app.powierzchniawraliwacelum2EditField.ValueChangedFcn = createCallbackFcn(app, @powierzchniawraliwacelum2EditFieldValueChanged, true);
            app.powierzchniawraliwacelum2EditField.Position = [10 107 70 22];
            app.powierzchniawraliwacelum2EditField.Value = 0.68;

            % Create powierzchniawraliwacelum2EditFieldLabel
            app.powierzchniawraliwacelum2EditFieldLabel = uilabel(app.ParametryruchuceluPanel);
            app.powierzchniawraliwacelum2EditFieldLabel.Position = [88 107 183 22];
            app.powierzchniawraliwacelum2EditFieldLabel.Text = 'powierzchnia wrażliwa celu [m^2]';

            % Create prdkopocztkowamsEditFieldLabel
            app.prdkopocztkowamsEditFieldLabel = uilabel(app.ParametryruchuceluPanel);
            app.prdkopocztkowamsEditFieldLabel.HorizontalAlignment = 'right';
            app.prdkopocztkowamsEditFieldLabel.Position = [98 79 150 22];
            app.prdkopocztkowamsEditFieldLabel.Text = 'prędkość początkowa [m/s]';

            % Create prdkopocztkowamsEditField
            app.prdkopocztkowamsEditField = uieditfield(app.ParametryruchuceluPanel, 'numeric');
            app.prdkopocztkowamsEditField.Limits = [0 1000];
            app.prdkopocztkowamsEditField.ValueChangedFcn = createCallbackFcn(app, @prdkopocztkowamsEditFieldValueChanged, true);
            app.prdkopocztkowamsEditField.Position = [11 79 79 22];
            app.prdkopocztkowamsEditField.Value = 300;

            % Create pooeniey0mEditField
            app.pooeniey0mEditField = uieditfield(app.ParametryruchuceluPanel, 'numeric');
            app.pooeniey0mEditField.Limits = [0 25000];
            app.pooeniey0mEditField.ValueDisplayFormat = '%.0f';
            app.pooeniey0mEditField.ValueChangedFcn = createCallbackFcn(app, @pooeniey0mEditFieldValueChanged, true);
            app.pooeniey0mEditField.Position = [10 163 79 22];
            app.pooeniey0mEditField.Value = 13982;

            % Create pooeniey0mEditFieldLabel
            app.pooeniey0mEditFieldLabel = uilabel(app.ParametryruchuceluPanel);
            app.pooeniey0mEditFieldLabel.Position = [113 163 93 22];
            app.pooeniey0mEditFieldLabel.Text = 'położenie y0 [m]';

            % Create SymulujtorruchuceluButton
            app.SymulujtorruchuceluButton = uibutton(app.ParametryruchuceluPanel, 'push');
            app.SymulujtorruchuceluButton.ButtonPushedFcn = createCallbackFcn(app, @SymulujtorruchuceluButtonPushed, true);
            app.SymulujtorruchuceluButton.BackgroundColor = [0.9294 0.6941 0.1255];
            app.SymulujtorruchuceluButton.FontWeight = 'bold';
            app.SymulujtorruchuceluButton.Position = [50 4 181 28];
            app.SymulujtorruchuceluButton.Text = 'Symuluj tor ruchu celu';

            % Create DodajmanewryButton
            app.DodajmanewryButton = uibutton(app.ParametryruchuceluPanel, 'state');
            app.DodajmanewryButton.ValueChangedFcn = createCallbackFcn(app, @DodajmanewryButtonValueChanged, true);
            app.DodajmanewryButton.Text = {'Dodaj '; 'manewry'};
            app.DodajmanewryButton.BackgroundColor = [1 1 0];
            app.DodajmanewryButton.Position = [10 39 64 36];

            % Create WyczymanewryButton
            app.WyczymanewryButton = uibutton(app.ParametryruchuceluPanel, 'state');
            app.WyczymanewryButton.ValueChangedFcn = createCallbackFcn(app, @WyczymanewryButtonValueChanged, true);
            app.WyczymanewryButton.Text = {'Wyczyść '; 'manewry'};
            app.WyczymanewryButton.BackgroundColor = [0.9804 0.5255 0.3333];
            app.WyczymanewryButton.Position = [74 39 58 36];

            % Create manewryceluLabel
            app.manewryceluLabel = uilabel(app.ParametryruchuceluPanel);
            app.manewryceluLabel.Position = [147 46 80 22];
            app.manewryceluLabel.Text = 'manewry celu';

            % Create BdynaprowadzaniaPanel
            app.BdynaprowadzaniaPanel = uipanel(app.LeftPanel);
            app.BdynaprowadzaniaPanel.TitlePosition = 'centertop';
            app.BdynaprowadzaniaPanel.Title = 'Błędy naprowadzania';
            app.BdynaprowadzaniaPanel.BackgroundColor = [0.8 0.8 0.8];
            app.BdynaprowadzaniaPanel.FontWeight = 'bold';
            app.BdynaprowadzaniaPanel.Position = [2 448 275 135];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.BdynaprowadzaniaPanel);
            app.TabGroup.Position = [4 5 268 106];

            % Create UOWrakietyTab
            app.UOWrakietyTab = uitab(app.TabGroup);
            app.UOWrakietyTab.Title = 'UOW rakiety';
            app.UOWrakietyTab.BackgroundColor = [0.9412 0.9412 0.9412];

            % Create welewacjistopnieEditFieldLabel
            app.welewacjistopnieEditFieldLabel = uilabel(app.UOWrakietyTab);
            app.welewacjistopnieEditFieldLabel.HorizontalAlignment = 'right';
            app.welewacjistopnieEditFieldLabel.Position = [123 55 109 22];
            app.welewacjistopnieEditFieldLabel.Text = 'w elewacji [stopnie]';

            % Create welewacjistopnieEditField
            app.welewacjistopnieEditField = uieditfield(app.UOWrakietyTab, 'numeric');
            app.welewacjistopnieEditField.Limits = [0 0.1];
            app.welewacjistopnieEditField.ValueChangedFcn = createCallbackFcn(app, @welewacjistopnieEditFieldValueChanged, true);
            app.welewacjistopnieEditField.Position = [12 55 100 22];
            app.welewacjistopnieEditField.Value = 0.01;

            % Create wazymuciestopnieEditFieldLabel
            app.wazymuciestopnieEditFieldLabel = uilabel(app.UOWrakietyTab);
            app.wazymuciestopnieEditFieldLabel.HorizontalAlignment = 'right';
            app.wazymuciestopnieEditFieldLabel.Position = [115 29 117 22];
            app.wazymuciestopnieEditFieldLabel.Text = 'w azymucie [stopnie]';

            % Create wazymuciestopnieEditField
            app.wazymuciestopnieEditField = uieditfield(app.UOWrakietyTab, 'numeric');
            app.wazymuciestopnieEditField.Limits = [0 0.1];
            app.wazymuciestopnieEditField.ValueChangedFcn = createCallbackFcn(app, @wazymuciestopnieEditFieldValueChanged, true);
            app.wazymuciestopnieEditField.Position = [12 29 100 22];
            app.wazymuciestopnieEditField.Value = 0.01;

            % Create wodlegocimEditField_2Label
            app.wodlegocimEditField_2Label = uilabel(app.UOWrakietyTab);
            app.wodlegocimEditField_2Label.HorizontalAlignment = 'right';
            app.wodlegocimEditField_2Label.Position = [141 3 91 22];
            app.wodlegocimEditField_2Label.Text = 'w odległości [m]';

            % Create wodlegocimEditField_2
            app.wodlegocimEditField_2 = uieditfield(app.UOWrakietyTab, 'numeric');
            app.wodlegocimEditField_2.Limits = [0 10];
            app.wodlegocimEditField_2.ValueChangedFcn = createCallbackFcn(app, @wodlegocimEditField_2ValueChanged, true);
            app.wodlegocimEditField_2.Position = [12 3 100 22];

            % Create UOWceluTab
            app.UOWceluTab = uitab(app.TabGroup);
            app.UOWceluTab.Title = 'UOW celu';
            app.UOWceluTab.BackgroundColor = [0.9412 0.9412 0.9412];

            % Create welewacjistopnieEditField_2Label
            app.welewacjistopnieEditField_2Label = uilabel(app.UOWceluTab);
            app.welewacjistopnieEditField_2Label.HorizontalAlignment = 'right';
            app.welewacjistopnieEditField_2Label.Position = [123 55 109 22];
            app.welewacjistopnieEditField_2Label.Text = 'w elewacji [stopnie]';

            % Create welewacjistopnieEditField_2
            app.welewacjistopnieEditField_2 = uieditfield(app.UOWceluTab, 'numeric');
            app.welewacjistopnieEditField_2.Limits = [0 0.1];
            app.welewacjistopnieEditField_2.ValueChangedFcn = createCallbackFcn(app, @welewacjistopnieEditField_2ValueChanged, true);
            app.welewacjistopnieEditField_2.Position = [12 55 100 22];
            app.welewacjistopnieEditField_2.Value = 0.05;

            % Create wazymuciestopnieEditField_2Label
            app.wazymuciestopnieEditField_2Label = uilabel(app.UOWceluTab);
            app.wazymuciestopnieEditField_2Label.HorizontalAlignment = 'right';
            app.wazymuciestopnieEditField_2Label.Position = [115 29 117 22];
            app.wazymuciestopnieEditField_2Label.Text = 'w azymucie [stopnie]';

            % Create wazymuciestopnieEditField_2
            app.wazymuciestopnieEditField_2 = uieditfield(app.UOWceluTab, 'numeric');
            app.wazymuciestopnieEditField_2.Limits = [0 0.1];
            app.wazymuciestopnieEditField_2.ValueChangedFcn = createCallbackFcn(app, @wazymuciestopnieEditField_2ValueChanged, true);
            app.wazymuciestopnieEditField_2.Position = [12 29 100 22];
            app.wazymuciestopnieEditField_2.Value = 0.05;

            % Create wodlegocimEditFieldLabel
            app.wodlegocimEditFieldLabel = uilabel(app.UOWceluTab);
            app.wodlegocimEditFieldLabel.HorizontalAlignment = 'right';
            app.wodlegocimEditFieldLabel.Position = [141 3 91 22];
            app.wodlegocimEditFieldLabel.Text = 'w odległości [m]';

            % Create wodlegocimEditField
            app.wodlegocimEditField = uieditfield(app.UOWceluTab, 'numeric');
            app.wodlegocimEditField.Limits = [0 50];
            app.wodlegocimEditField.ValueChangedFcn = createCallbackFcn(app, @wodlegocimEditFieldValueChanged, true);
            app.wodlegocimEditField.Position = [12 3 100 22];
            app.wodlegocimEditField.Value = 10;

            % Create SYMULACJAButton
            app.SYMULACJAButton = uibutton(app.LeftPanel, 'push');
            app.SYMULACJAButton.ButtonPushedFcn = createCallbackFcn(app, @SYMULACJAButtonPushed, true);
            app.SYMULACJAButton.BackgroundColor = [0.3294 0.8588 0.1961];
            app.SYMULACJAButton.FontSize = 16;
            app.SYMULACJAButton.FontWeight = 'bold';
            app.SYMULACJAButton.Position = [13 11 221 37];
            app.SYMULACJAButton.Text = 'SYMULACJA';

            % Create Lamp
            app.Lamp = uilamp(app.LeftPanel);
            app.Lamp.Position = [250 19 20 20];

            % Create PojedynczystrzaButton
            app.PojedynczystrzaButton = uibutton(app.LeftPanel, 'push');
            app.PojedynczystrzaButton.ButtonPushedFcn = createCallbackFcn(app, @PojedynczystrzaButtonPushed, true);
            app.PojedynczystrzaButton.BackgroundColor = [0.302 0.7765 0.9804];
            app.PojedynczystrzaButton.FontSize = 14;
            app.PojedynczystrzaButton.FontWeight = 'bold';
            app.PojedynczystrzaButton.Position = [13 53 221 24];
            app.PojedynczystrzaButton.Text = 'Pojedynczy strzał';

            % Create DANEWEJCIOWELabel
            app.DANEWEJCIOWELabel = uilabel(app.LeftPanel);
            app.DANEWEJCIOWELabel.HorizontalAlignment = 'center';
            app.DANEWEJCIOWELabel.FontSize = 18;
            app.DANEWEJCIOWELabel.FontWeight = 'bold';
            app.DANEWEJCIOWELabel.Position = [6 736 271 24];
            app.DANEWEJCIOWELabel.Text = 'DANE WEJŚCIOWE';

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.BackgroundColor = [1 1 1];
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;

            % Create PODSUMOWANIESYMULACJISTRZELALabel
            app.PODSUMOWANIESYMULACJISTRZELALabel = uilabel(app.RightPanel);
            app.PODSUMOWANIESYMULACJISTRZELALabel.BackgroundColor = [1 1 1];
            app.PODSUMOWANIESYMULACJISTRZELALabel.HorizontalAlignment = 'center';
            app.PODSUMOWANIESYMULACJISTRZELALabel.FontSize = 18;
            app.PODSUMOWANIESYMULACJISTRZELALabel.FontWeight = 'bold';
            app.PODSUMOWANIESYMULACJISTRZELALabel.Position = [1 736 956 24];
            app.PODSUMOWANIESYMULACJISTRZELALabel.Text = 'PODSUMOWANIE SYMULACJI STRZELAŃ';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.RightPanel);
            app.TabGroup2.Position = [6 6 951 728];

            % Create DANECELUTab
            app.DANECELUTab = uitab(app.TabGroup2);
            app.DANECELUTab.Title = 'DANE CELU';
            app.DANECELUTab.BackgroundColor = [1 1 1];

            % Create TabGroup3
            app.TabGroup3 = uitabgroup(app.DANECELUTab);
            app.TabGroup3.TabLocation = 'left';
            app.TabGroup3.Position = [0 127 950 576];

            % Create DTab
            app.DTab = uitab(app.TabGroup3);
            app.DTab.Title = '3D';
            app.DTab.BackgroundColor = [1 1 1];

            % Create UIAxes
            app.UIAxes = uiaxes(app.DTab);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.Position = [1 0 882 574];

            % Create DTab_2
            app.DTab_2 = uitab(app.TabGroup3);
            app.DTab_2.Title = '2D';
            app.DTab_2.BackgroundColor = [1 1 1];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.DTab_2);
            title(app.UIAxes2, 'Title')
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            app.UIAxes2.Position = [1 277 882 297];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.DTab_2);
            xlabel(app.UIAxes3, 'X')
            ylabel(app.UIAxes3, 'Y')
            app.UIAxes3.Position = [1 1 882 277];

            % Create PolarTab
            app.PolarTab = uitab(app.TabGroup3);
            app.PolarTab.Title = 'Polar';
            app.PolarTab.BackgroundColor = [1 1 1];

            % Create Panel
            app.Panel = uipanel(app.PolarTab);
            app.Panel.BackgroundColor = [1 1 1];
            app.Panel.Position = [1 0 882 574];

            % Create UITable
            app.UITable = uitable(app.DANECELUTab);
            app.UITable.ColumnName = {'Rodzaj celu'; 'Liczba celów'; 'Vśr [m/s]'; 'Maks. pułap celu [m]'; 'Min. pułap celu [m]'; 'Maks. parametr [m]'; 'Odległość wykrycia'};
            app.UITable.RowName = {};
            app.UITable.Position = [1 32 950 87];

            % Create DANESTRZELANIATab
            app.DANESTRZELANIATab = uitab(app.TabGroup2);
            app.DANESTRZELANIATab.Title = 'DANE STRZELANIA';
            app.DANESTRZELANIATab.BackgroundColor = [1 1 1];

            % Create TabGroup3_2
            app.TabGroup3_2 = uitabgroup(app.DANESTRZELANIATab);
            app.TabGroup3_2.TabLocation = 'left';
            app.TabGroup3_2.Position = [0 127 950 576];

            % Create DTab_3
            app.DTab_3 = uitab(app.TabGroup3_2);
            app.DTab_3.Title = '3D';
            app.DTab_3.BackgroundColor = [1 1 1];

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.DTab_3);
            title(app.UIAxes_2, 'Title')
            xlabel(app.UIAxes_2, 'X')
            ylabel(app.UIAxes_2, 'Y')
            app.UIAxes_2.Position = [1 0 882 574];

            % Create DTab_4
            app.DTab_4 = uitab(app.TabGroup3_2);
            app.DTab_4.Title = '2D';
            app.DTab_4.BackgroundColor = [1 1 1];

            % Create UIAxes2_2
            app.UIAxes2_2 = uiaxes(app.DTab_4);
            title(app.UIAxes2_2, 'Title')
            xlabel(app.UIAxes2_2, 'X')
            ylabel(app.UIAxes2_2, 'Y')
            app.UIAxes2_2.Position = [1 277 882 297];

            % Create UIAxes3_2
            app.UIAxes3_2 = uiaxes(app.DTab_4);
            xlabel(app.UIAxes3_2, 'X')
            ylabel(app.UIAxes3_2, 'Y')
            app.UIAxes3_2.Position = [1 1 882 277];

            % Create PolarTab_2
            app.PolarTab_2 = uitab(app.TabGroup3_2);
            app.PolarTab_2.Title = 'Polar';
            app.PolarTab_2.BackgroundColor = [1 1 1];

            % Create Panel_2
            app.Panel_2 = uipanel(app.PolarTab_2);
            app.Panel_2.BackgroundColor = [1 1 1];
            app.Panel_2.Position = [1 0 882 574];

            % Create VrVcTab
            app.VrVcTab = uitab(app.TabGroup3_2);
            app.VrVcTab.Title = 'Vr; Vc';

            % Create UIAxes_3
            app.UIAxes_3 = uiaxes(app.VrVcTab);
            title(app.UIAxes_3, 'Title')
            xlabel(app.UIAxes_3, 'X')
            ylabel(app.UIAxes_3, 'Y')
            app.UIAxes_3.XGrid = 'on';
            app.UIAxes_3.YGrid = 'on';
            app.UIAxes_3.Position = [1 0 882 574];

            % Create UITable_2
            app.UITable_2 = uitable(app.DANESTRZELANIATab);
            app.UITable_2.ColumnName = {'Metoda naprowadzania'; 'Wystrzelonych rakiet'; 'Średnie P-stwo porażenia'; 'Trafionych (P=1)'; 'Średni czas lotu rakiety [s]'; 'Vr w końcowym momencie [m/s]'; 'odegłość osiągnięcia celu [m]'};
            app.UITable_2.RowName = {};
            app.UITable_2.Position = [1 32 950 87];

            % Create ROZRZUTPOCISKWTab
            app.ROZRZUTPOCISKWTab = uitab(app.TabGroup2);
            app.ROZRZUTPOCISKWTab.Title = 'ROZRZUT POCISKÓW';
            app.ROZRZUTPOCISKWTab.BackgroundColor = [1 1 1];

            % Create TabGroup3_3
            app.TabGroup3_3 = uitabgroup(app.ROZRZUTPOCISKWTab);
            app.TabGroup3_3.TabLocation = 'left';
            app.TabGroup3_3.Position = [0 127 950 576];

            % Create WykresramkowyTab
            app.WykresramkowyTab = uitab(app.TabGroup3_3);
            app.WykresramkowyTab.Title = 'Wykres ramkowy';
            app.WykresramkowyTab.BackgroundColor = [1 1 1];

            % Create UIAxes4
            app.UIAxes4 = uiaxes(app.WykresramkowyTab);
            title(app.UIAxes4, 'Title')
            ylabel(app.UIAxes4, 'Y')
            app.UIAxes4.YGrid = 'on';
            app.UIAxes4.Position = [1 1 828 573];

            % Create HistogramyTab
            app.HistogramyTab = uitab(app.TabGroup3_3);
            app.HistogramyTab.Title = 'Histogramy';
            app.HistogramyTab.BackgroundColor = [1 1 1];

            % Create UIAxes5
            app.UIAxes5 = uiaxes(app.HistogramyTab);
            title(app.UIAxes5, 'Title')
            xlabel(app.UIAxes5, 'X')
            app.UIAxes5.YGrid = 'on';
            app.UIAxes5.Position = [1 389 828 185];

            % Create UIAxes5_2
            app.UIAxes5_2 = uiaxes(app.HistogramyTab);
            title(app.UIAxes5_2, 'Title')
            xlabel(app.UIAxes5_2, 'X')
            app.UIAxes5_2.YGrid = 'on';
            app.UIAxes5_2.Position = [1 197 828 185];

            % Create UIAxes5_3
            app.UIAxes5_3 = uiaxes(app.HistogramyTab);
            title(app.UIAxes5_3, 'Title')
            xlabel(app.UIAxes5_3, 'X')
            app.UIAxes5_3.YGrid = 'on';
            app.UIAxes5_3.Position = [3 4 828 185];

            % Create PunktytrafieTab
            app.PunktytrafieTab = uitab(app.TabGroup3_3);
            app.PunktytrafieTab.Title = 'Punkty trafień';
            app.PunktytrafieTab.BackgroundColor = [1 1 1];

            % Create UIAxes6
            app.UIAxes6 = uiaxes(app.PunktytrafieTab);
            title(app.UIAxes6, 'Title')
            xlabel(app.UIAxes6, 'X')
            ylabel(app.UIAxes6, 'Y')
            app.UIAxes6.Position = [3 4 826 570];

            % Create CharrozrzutuTab
            app.CharrozrzutuTab = uitab(app.TabGroup3_3);
            app.CharrozrzutuTab.Title = 'Char. rozrzutu';
            app.CharrozrzutuTab.BackgroundColor = [1 1 1];

            % Create UIAxes7
            app.UIAxes7 = uiaxes(app.CharrozrzutuTab);
            title(app.UIAxes7, 'Title')
            xlabel(app.UIAxes7, 'X')
            ylabel(app.UIAxes7, 'Y')
            app.UIAxes7.XGrid = 'on';
            app.UIAxes7.YGrid = 'on';
            app.UIAxes7.Position = [3 4 826 570];

            % Create UITable2
            app.UITable2 = uitable(app.ROZRZUTPOCISKWTab);
            app.UITable2.ColumnName = {'Wartość maksymalna [m]'; 'Wartość minimalna [m]'; 'Wartość oczekiwana [m]'; 'Mediana [m]'; 'Wartość modalna [m]'; 'Rozstęp [m]'; 'Wariancja [m]'; 'Odchylenie standardowe [m]'; 'Odchylenie przeciętne [m]'; 'Rozstęp międzykwartylowy [m]'};
            app.UITable2.RowName = {'h'; 'h_epsilon'; 'h_beta'};
            app.UITable2.Position = [1 5 948 113];

            % Create PRAWDOPODOBIESTWOPORAENIACELUTab
            app.PRAWDOPODOBIESTWOPORAENIACELUTab = uitab(app.TabGroup2);
            app.PRAWDOPODOBIESTWOPORAENIACELUTab.Title = 'PRAWDOPODOBIEŃSTWO PORAŻENIA CELU';
            app.PRAWDOPODOBIESTWOPORAENIACELUTab.BackgroundColor = [1 1 1];

            % Create OXhmSliderLabel
            app.OXhmSliderLabel = uilabel(app.PRAWDOPODOBIESTWOPORAENIACELUTab);
            app.OXhmSliderLabel.HorizontalAlignment = 'right';
            app.OXhmSliderLabel.Position = [770 470 70 22];
            app.OXhmSliderLabel.Text = 'Oś X (h [m])';

            % Create OXhmSlider
            app.OXhmSlider = uislider(app.PRAWDOPODOBIESTWOPORAENIACELUTab);
            app.OXhmSlider.Limits = [35 100];
            app.OXhmSlider.ValueChangedFcn = createCallbackFcn(app, @OXhmSliderValueChanged, true);
            app.OXhmSlider.Position = [777 454 150 3];
            app.OXhmSlider.Value = 50;

            % Create WysokoHkmLabel
            app.WysokoHkmLabel = uilabel(app.PRAWDOPODOBIESTWOPORAENIACELUTab);
            app.WysokoHkmLabel.HorizontalAlignment = 'center';
            app.WysokoHkmLabel.Position = [756 539 98 22];
            app.WysokoHkmLabel.Text = 'Wysokość H [km]';

            % Create WysokoHkmKnob
            app.WysokoHkmKnob = uiknob(app.PRAWDOPODOBIESTWOPORAENIACELUTab, 'continuous');
            app.WysokoHkmKnob.Limits = [0 25];
            app.WysokoHkmKnob.ValueChangedFcn = createCallbackFcn(app, @WysokoHkmKnobValueChanged, true);
            app.WysokoHkmKnob.Position = [773 595 60 60];

            % Create UstawwysokodetonacjiButton
            app.UstawwysokodetonacjiButton = uibutton(app.PRAWDOPODOBIESTWOPORAENIACELUTab, 'state');
            app.UstawwysokodetonacjiButton.ValueChangedFcn = createCallbackFcn(app, @UstawwysokodetonacjiButtonValueChanged, true);
            app.UstawwysokodetonacjiButton.Text = {'Ustaw'; 'wysokość '; 'detonacji'};
            app.UstawwysokodetonacjiButton.Position = [869 539 72 50];

            % Create UIAxes8
            app.UIAxes8 = uiaxes(app.PRAWDOPODOBIESTWOPORAENIACELUTab);
            title(app.UIAxes8, 'Title')
            xlabel(app.UIAxes8, 'X')
            ylabel(app.UIAxes8, 'Y')
            app.UIAxes8.XGrid = 'on';
            app.UIAxes8.YGrid = 'on';
            app.UIAxes8.Position = [1 334 744 367];

            % Create UIAxes9
            app.UIAxes9 = uiaxes(app.PRAWDOPODOBIESTWOPORAENIACELUTab);
            title(app.UIAxes9, 'Title')
            xlabel(app.UIAxes9, 'X')
            ylabel(app.UIAxes9, 'Y')
            app.UIAxes9.Position = [1 0 483 335];

            % Create UIAxes10
            app.UIAxes10 = uiaxes(app.PRAWDOPODOBIESTWOPORAENIACELUTab);
            title(app.UIAxes10, 'Title')
            xlabel(app.UIAxes10, 'X')
            app.UIAxes10.Position = [483 0 468 335];

            % Create WykonajsymulacjeabywywietlipodsumowanieLabel
            app.WykonajsymulacjeabywywietlipodsumowanieLabel = uilabel(app.UIFigure);
            app.WykonajsymulacjeabywywietlipodsumowanieLabel.HorizontalAlignment = 'center';
            app.WykonajsymulacjeabywywietlipodsumowanieLabel.Position = [289 7 957 760];
            app.WykonajsymulacjeabywywietlipodsumowanieLabel.Text = 'Wykonaj symulacje, aby wyświetlić podsumowanie...';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = aplikacja_main_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end