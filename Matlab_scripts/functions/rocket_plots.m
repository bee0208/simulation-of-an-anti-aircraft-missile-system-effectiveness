function rocket_plots(xyz_c,xyz_r,xyz_sc,a)
%TARGET_PLOTS draws target and rocket path on various plots
%   TARGET_PLOTS(XYZ) plots 3D, 2D and polar plots
%   First input is target coordinates, second - rocket coordinates
%   If a is not given, draws all 3 plots
%   ROCKET_PLOTS(XYZ, XYZ_R,'3D') draws 3D plot
%   ROCKET_PLOTS(XYZ, XYZ_R,'2D') draws 2D plot
%   ROCKET_PLOTS(XYZ, XYZ_R,'polar') draws polar plot

[~,s]=size(xyz_c);
[~,sr]=size(xyz_r);

if isempty(xyz_c)
    error('target coordinates are not given')
elseif s~=3
    error('target coordinates must be 3 dimensional')
end

if isempty(xyz_sc)
    xyz_sc=[NaN NaN NaN];
end

if isempty(xyz_r)
    error('rocket coordinates are not given')
elseif sr~=3
    error('rocket coordinates must be 3 dimensional')
end

if nargin==4
    if strcmpi(a,'3D')
        figure
        hold on
        plot3(0,0,0,'go','LineWidth',3)
        plot3(xyz_c(:,1),xyz_c(:,2),xyz_c(:,3),'r-',"LineWidth",2)
        plot3(xyz_r(:,1),xyz_r(:,2),xyz_r(:,3),'b:',"LineWidth",2)
        plot3(xyz_r(end,1),xyz_r(end,2),xyz_r(end,3),'b*','MarkerSize',7)
%         plot3(xyz(1,1),xyz(1,2),xyz(1,3),'r*','MarkerSize',7)
        plot3(xyz_sc(1,1),xyz_sc(1,2),xyz_sc(1,3),'kx','MarkerSize',7,'Linewidth',2)
        view(-45,45)
        axis image
        text(10,-10,100,'SNR')
        hold off

        grid on
        xlabel('x [m]')
        ylabel('y [m]')
        zlabel('z [m]')
        title('Wykres trajektorii celu i rakiety')
        legend('SNR','tor ruchu celu','tor ruchu rakiety','wybuch rakiety','moment wystrzelenia rakiety')
        
    elseif strcmpi(a,'2D')
        figure
        subplot(2,1,1)
        hold on
        plot(0,0,'go','LineWidth',3)
        plot(xyz_c(:,1),xyz_c(:,3),'r-',"LineWidth",2)
        plot(xyz_r(:,1),xyz_r(:,3),'b:',"LineWidth",2)
        plot(xyz_r(end,1),xyz_r(end,3),'b*','MarkerSize',7)
%         plot(xyz(1,1),xyz(1,3),'r*','MarkerSize',7)
        plot(xyz_sc(1,1),xyz_sc(1,3),'kx','MarkerSize',7,'Linewidth',2)
        hold off

        grid on
        axis equal
        ylim([0 inf])
        xlabel('x [m]')
        ylabel('z [m]')
        title('Wykres trajektorii celu i rakiety')

        subplot(2,1,2)
        hold on
        plot(0,0,'go','LineWidth',3)
        plot(xyz_c(:,1),xyz_c(:,2),'r-',"LineWidth",2)
        plot(xyz_r(:,1),xyz_r(:,2),'b:',"LineWidth",2)
        plot(xyz_r(end,1),xyz_r(end,2),'b*','MarkerSize',7)
%         plot(xyz(1,1),xyz(1,2),'r*','MarkerSize',7)
        plot(xyz_sc(1,1),xyz_sc(1,2),'kx','MarkerSize',7,'Linewidth',2)
        hold off

        grid on
        axis equal
        xlabel('x [m]')
        ylabel('y [m]')

        legend('SNR','tor ruchu celu','tor ruchu rakiety','wybuch rakiety','moment wystrzelenia rakiety',"Location","southeast")
        
    elseif strncmpi(a,'polar',4)
        [theta,rho] = cart2pol(xyz_c(:,1),xyz_c(:,2));
        [theta_r,rho_r] = cart2pol(xyz_r(:,1),xyz_r(:,2));
        [theta_sc,rho_sc] = cart2pol(xyz_sc(1,1),xyz_sc(1,2));

        figure
        pax = polaraxes;
        hold on
        polarplot(0+0i,'go','MarkerSize',7)
        polarplot(theta.*-1,rho./1000,'r-','linewidth',2)
        polarplot(theta_r.*-1,rho_r./1000,'b:','linewidth',2)
        polarplot(theta_r(end).*-1,rho_r(end)./1000,'b*','MarkerSize',7)
%         polarplot(theta(1).*-1,rho(1)./1000,'r*','MarkerSize',7)
        polarplot(theta_sc*-1,rho_sc/1000,'kx','MarkerSize',7,'Linewidth',2)
        hold off

        legend('SNR','tor ruchu celu','tor ruchu rakiety','wybuch rakiety','moment wystrzelenia rakiety')
        title('Wykres trajektorii celu i rakiety')
        text(rad2deg(-180),1,'SNR')
        % text(theta(1).*-1+0.02,rho(1)./1000,'moment wykrycia')

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
        plot3(xyz_c(:,1),xyz_c(:,2),xyz_c(:,3),'r-',"LineWidth",2)
        plot3(xyz_r(:,1),xyz_r(:,2),xyz_r(:,3),'b:',"LineWidth",2)
        plot3(xyz_r(end,1),xyz_r(end,2),xyz_r(end,3),'b*','MarkerSize',7)
%         plot3(xyz(1,1),xyz(1,2),xyz(1,3),'r*','MarkerSize',7)
        plot3(xyz_sc(1,1),xyz_sc(1,2),xyz_sc(1,3),'kx','MarkerSize',7,'Linewidth',2)
        view(-45,45)
        axis image
        text(10,-10,100,'SNR')
        hold off

        grid on
        xlabel('x [m]')
        ylabel('y [m]')
        zlabel('z [m]')
        title('Wykres trajektorii celu i rakiety')
        legend('SNR','tor ruchu celu','tor ruchu rakiety','wybuch rakiety','moment wystrzelenia rakiety')

    %% 2) Wykresy xy i xz
    figure
        subplot(2,1,1)
        hold on
        plot(0,0,'go','LineWidth',3)
        plot(xyz_c(:,1),xyz_c(:,3),'r-',"LineWidth",2)
        plot(xyz_r(:,1),xyz_r(:,3),'b:',"LineWidth",2)
        plot(xyz_r(end,1),xyz_r(end,3),'b*','MarkerSize',7)
%         plot(xyz(1,1),xyz(1,3),'r*','MarkerSize',7)
        plot(xyz_sc(1,1),xyz_sc(1,3),'kx','MarkerSize',7,'Linewidth',2)
        hold off

        grid on
        ylim([0 inf])
        xlabel('x [m]')
        ylabel('z [m]')
        title('Wykres trajektorii celu i rakiety')

        subplot(2,1,2)
        hold on
        plot(0,0,'go','LineWidth',3)
        plot(xyz_c(:,1),xyz_c(:,2),'r-',"LineWidth",2)
        plot(xyz_r(:,1),xyz_r(:,2),'b:',"LineWidth",2)
        plot(xyz_r(end,1),xyz_r(end,2),'b*','MarkerSize',7)
%         plot(xyz(1,1),xyz(1,2),'r*','MarkerSize',7)
        plot(xyz_sc(1,1),xyz_sc(1,2),'kx','MarkerSize',7,'Linewidth',2)
        hold off

        grid on
        axis equal
        xlabel('x [m]')
        ylabel('y [m]')

        legend('SNR','tor ruchu celu','tor ruchu rakiety','wybuch rakiety','moment wystrzelenia rakiety',"Location","southeast")

    %% 3) Wykres układu biegunowego
        [theta,rho] = cart2pol(xyz_c(:,1),xyz_c(:,2));
        [theta_r,rho_r] = cart2pol(xyz_r(:,1),xyz_r(:,2));
        [theta_sc,rho_sc] = cart2pol(xyz_sc(1,1),xyz_sc(1,2));

        figure
        pax = polaraxes;
        hold on
        polarplot(0+0i,'go','MarkerSize',7)
        polarplot(theta.*-1,rho./1000,'r-','linewidth',2)
        polarplot(theta_r.*-1,rho_r./1000,'b:','linewidth',2)
        polarplot(theta_r(end).*-1,rho_r(end)./1000,'b*','MarkerSize',7)
%         polarplot(theta(1).*-1,rho(1)./1000,'r*','MarkerSize',7)
        polarplot(theta_sc*-1,rho_sc/1000,'kx','MarkerSize',7,'Linewidth',2)
        hold off

        legend('SNR','tor ruchu celu','tor ruchu rakiety','wybuch rakiety','moment wystrzelenia rakiety')
        title('polar coordinate system')
        text(rad2deg(-180),1,'SNR')
        % text(theta(1).*-1+0.02,rho(1)./1000,'moment wykrycia')

        pax.ThetaZeroLocation = 'top';
        pax.ThetaDir = 'clockwise';
        pax.FontSize = 12;
        pax.RAxisLocation = 0;
end

