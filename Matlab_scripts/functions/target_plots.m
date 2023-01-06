function target_plots(dane,a)
%TARGET_PLOTS draws target path on various plots
%   TARGET_PLOTS(DANE) plots 3D, 2D and polar plots
%   dane is a cell array where first cell is xyz and the second is vśr
%   If a is not given, draws all 3 plots
%   TARGET_PLOTS(DANE,'3D') draws 3D plot
%   TARGET_PLOTS(DANE,'2D') draws 2D plot
%   TARGET_PLOTS(DANE,'polar') draws polar plot

xyz=dane{1,1};
v=dane{1,2};

[~,s]=size(xyz);

if isempty(xyz)
    error('target coordinates are not given')
elseif s~=3
    error('target coordinates must be 3 dimensional')
end

if nargin==2
    if strcmpi(a,'3D')
        figure;
        hold on
        plot3(0,0,0,'go','LineWidth',3)
        plot3(xyz(1,1),xyz(1,2),xyz(1,3),'r*','MarkerSize',7)
        plot3(xyz(:,1),xyz(:,2),xyz(:,3),'r-',"LineWidth",2)
        view(-45,45)
        axis image
        text(10,-10,100,'SNR')
        hold off

        grid on
        xlabel('x [m]')
        ylabel('y [m]')
        zlabel('z [m]')
        title({'Wykres toru ruchu celu'; ['V_ś_r = ', num2str(v),' m/s']})
        legend('SNR','wykrycie celu','tor lotu celu')
        
    elseif strcmpi(a,'2D')
        figure;
        subplot(2,1,1)
        hold on
        plot(0,0,'go','LineWidth',3)
        plot(xyz(1,1),xyz(1,3),'r*','MarkerSize',7)
        plot(xyz(:,1),xyz(:,3),'r-',"LineWidth",2)
        hold off
        
        axis equal
        grid on
        ylim([0 inf])
        xlabel('x [m]')
        ylabel('z [m]')
        title({'Wykres toru ruchu celu'; ['V_ś_r = ', num2str(v),' m/s']})

        subplot(2,1,2)
        hold on
        plot(0,0,'go','LineWidth',3)
        plot(xyz(1,1),xyz(1,2),'r*','MarkerSize',7)
        plot(xyz(:,1),xyz(:,2),'r-',"LineWidth",2)
        hold off

        grid on
        axis equal
        xlabel('x [m]')
        ylabel('y [m]')

        legend('SNR','wykrycie celu','tor lotu celu',"Location","southeast")
        
    elseif strncmpi(a,'polar',4)
        [theta,rho] = cart2pol(xyz(:,1),xyz(:,2));

        figure
        pax = polaraxes;
        hold on
        polarplot(0+0i,'go','MarkerSize',7)
        polarplot(theta(1).*-1,rho(1)./1000,'r*','MarkerSize',7)
        polarplot(theta.*-1,rho./1000,'r-','linewidth',2)
        hold off

        legend('SNR','wykrycie celu','tor lotu celu')
        title({'Wykres toru ruchu celu'; ['V_ś_r = ', num2str(v),' m/s']})
        text(rad2deg(-180),1,'SNR')

        pax.ThetaZeroLocation = 'top';
        pax.ThetaDir = 'clockwise';
        pax.FontSize = 12;
        pax.RAxisLocation = 0;
    else
        error('write in the second input: 3D, 2D or polar')
    end
else
    %% 1) wykres xyz
    figure
    hold on
    plot3(0,0,0,'go','LineWidth',3)
    plot3(xyz(1,1),xyz(1,2),xyz(1,3),'r*','MarkerSize',7)
    plot3(xyz(:,1),xyz(:,2),xyz(:,3),'r-',"LineWidth",2)
    view(-45,45)
    axis image
    text(10,-10,100,'SNR')
    hold off

    grid on
    xlabel('x [m]')
    ylabel('y [m]')
    zlabel('z [m]')
    title({'Wykres toru ruchu celu'; ['V_ś_r = ', num2str(v),' m/s']})
    legend('SNR','wykrycie celu','tor lotu celu')

    %% 2) Wykresy xy i xz
    figure;
    subplot(2,1,1)
    hold on
    plot(0,0,'go','LineWidth',3)
    plot(xyz(1,1),xyz(1,3),'r*','MarkerSize',7)
    plot(xyz(:,1),xyz(:,3),'r-',"LineWidth",2)
    hold off

    grid on
    ylim([0 inf])
    xlabel('x [m]')
    ylabel('z [m]')
    title({'Wykres toru ruchu celu'; ['V_ś_r = ', num2str(v),' m/s']})

    subplot(2,1,2)
    hold on
    plot(0,0,'go','LineWidth',3)
    plot(xyz(1,1),xyz(1,2),'r*','MarkerSize',7)
    plot(xyz(:,1),xyz(:,2),'r-',"LineWidth",2)
    hold off

    grid on
    axis equal
    xlabel('x [m]')
    ylabel('y [m]')

    legend('SNR','wykrycie celu','tor lotu celu',"Location","southeast")

    %% 3) Wykres układu biegunowego
    [theta,rho] = cart2pol(xyz(:,1),xyz(:,2));

    figure
    pax = polaraxes;
    hold on
    polarplot(0+0i,'go','MarkerSize',7)
    polarplot(theta(1).*-1,rho(1)./1000,'r*','MarkerSize',7)
    polarplot(theta.*-1,rho./1000,'r-','linewidth',2)
    hold off

    legend('SNR','wykrycie celu','tor lotu celu')
    title({'Wykres toru ruchu celu'; ['V_ś_r = ', num2str(v),' m/s']})
    text(rad2deg(-180),1,'SNR')

    pax.ThetaZeroLocation = 'top';
    pax.ThetaDir = 'clockwise';
    pax.FontSize = 12;
    pax.RAxisLocation = 0;
end
