classdef aplikacja_poj_strzal_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure          matlab.ui.Figure
        UITable           matlab.ui.control.Table
        TabGroup          matlab.ui.container.TabGroup
        wykres3DTab       matlab.ui.container.Tab
        UIAxes            matlab.ui.control.UIAxes
        wykres2DTab       matlab.ui.container.Tab
        UIAxes2           matlab.ui.control.UIAxes
        UIAxes3           matlab.ui.control.UIAxes
        wykrespolarnyTab  matlab.ui.container.Tab
        Panel             matlab.ui.container.Panel
        PaszczyznaocenybdunaprowadzaniaTab  matlab.ui.container.Tab
        UIAxes4           matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
        CallingApp % Main app object
    end
    
    methods (Access = private)
        
        function rocket_plot(app,xyz_c,xyz_r,xyz_sc)
            %wykres 3D
            plot3(app.UIAxes,0,0,0,'go','LineWidth',3)
            hold(app.UIAxes);
            plot3(app.UIAxes,xyz_c(:,1),xyz_c(:,2),xyz_c(:,3),'r-',"LineWidth",2)
            plot3(app.UIAxes,xyz_r(:,1),xyz_r(:,2),xyz_r(:,3),'b:',"LineWidth",2)
            plot3(app.UIAxes,xyz_r(end,1),xyz_r(end,2),xyz_r(end,3),'b*','MarkerSize',7)
            plot3(app.UIAxes,xyz_sc(1,1),xyz_sc(1,2),xyz_sc(1,3),'kx','MarkerSize',7,'Linewidth',2)
%             view(-45,45)
            
            legend(app.UIAxes, 'SNR','tor ruchu celu','tor ruchu rakiety','wybuch rakiety','moment wystrzelenia rakiety')
            title(app.UIAxes, 'Wykres trajektorii celu i rakiety (3D)')
            axis(app.UIAxes, 'equal');
            ax = app.UIAxes;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.ZGrid = 'on';
            ax.XLabel.String = 'x [m]';
            ax.YLabel.String = 'y [m]';
            ax.ZLabel.String = 'z [m]';
            
            %wykres 2D XY
            hold(app.UIAxes2);
            plot(app.UIAxes2,0,0,'go','LineWidth',3)
            plot(app.UIAxes2,xyz_c(:,1),xyz_c(:,2),'r-',"LineWidth",2)
            plot(app.UIAxes2,xyz_r(:,1),xyz_r(:,2),'b:',"LineWidth",2)
            plot(app.UIAxes2,xyz_r(end,1),xyz_r(end,2),'b*','MarkerSize',7)
            plot(app.UIAxes2,xyz_sc(1,1),xyz_sc(1,2),'kx','MarkerSize',7,'Linewidth',2)
            
            title(app.UIAxes2, 'Wykres trajektorii celu i rakiety (2D)')
            ylim(app.UIAxes2,[0 inf])
            xlim(app.UIAxes2,[0 inf])
            ax = app.UIAxes2;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.XLabel.String = 'x [m]';
            ax.YLabel.String = 'y [m]';

            %wykres 2D XZ
            hold(app.UIAxes3);
            plot(app.UIAxes3,0,0,'go','LineWidth',3)
            plot(app.UIAxes3,xyz_c(:,1),xyz_c(:,3),'r-',"LineWidth",2)
            plot(app.UIAxes3,xyz_r(:,1),xyz_r(:,3),'b:',"LineWidth",2)
            plot(app.UIAxes3,xyz_r(end,1),xyz_r(end,3),'b*','MarkerSize',7)
            plot(app.UIAxes3,xyz_sc(1,1),xyz_sc(1,3),'kx','MarkerSize',7,'Linewidth',2)
            
            legend(app.UIAxes3, 'SNR','tor ruchu celu','tor ruchu rakiety','wybuch rakiety','moment wystrzelenia rakiety',"Location","southeast")
            ylim(app.UIAxes3,[0 inf])
            xlim(app.UIAxes3,[0 inf])
            ax = app.UIAxes3;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.XLabel.String = 'x [m]';
            ax.YLabel.String = 'z [m]';
            
            %wykres polar
            [theta,rho] = cart2pol(xyz_c(:,1),xyz_c(:,2));
            [theta_r,rho_r] = cart2pol(xyz_r(:,1),xyz_r(:,2));
            [theta_sc,rho_sc] = cart2pol(xyz_sc(1,1),xyz_sc(1,2));
            
            Pax = polaraxes(app.Panel);
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
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, mainapp, out, r_napr, xyz_sc, H)
            % Store main app in property for CloseRequestFcn to use
            app.CallingApp = mainapp;
            
            xyz_r = out.xyz_r;
            xyz_c = out.xyz_c;
            
            rocket_plot(app,xyz_c,xyz_r,xyz_sc)
            
            hold(app.UIAxes4)
            scatter(app.UIAxes4,H(1,2),H(1,1),250,'blue','*')
            scatter(app.UIAxes4,0,0,50,'red','filled')
            title(app.UIAxes4,'')
            legend(app.UIAxes4,'h_\beta^*, h_\epsilon^*','cel')
            ax = app.UIAxes4;
            ax.XGrid = 'on';
            ax.YGrid = 'on';
            ax.XLabel.String = 'h_\beta [m]';
            ax.YLabel.String = 'h_\epsilon [m]';
            ax.XAxisLocation = 'origin';
            ax.YAxisLocation = 'origin';
            
            app.UITable.Data = {r_napr H(1,4) H(1,5) out.Vr.Data(end) H(1,6) H(1,3)};
        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
            % Enable the Plot Opions button in main app
            app.CallingApp.SymulujtorruchuceluButton.Enable = 'on';
            app.CallingApp.SYMULACJAButton.Enable = 'on';
            app.CallingApp.PojedynczystrzaButton.Enable = 'on';
            app.CallingApp.DodajmanewryButton.Enable = 'on';
            app.CallingApp.WyczymanewryButton.Enable = 'on';
            
            % Delete the dialog box 
            delete(app)
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [1 1 1];
            app.UIFigure.Position = [100 100 847 583];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create UITable
            app.UITable = uitable(app.UIFigure);
            app.UITable.ColumnName = {'Metoda naprowadzania'; 'P-stwo porażenia celu'; 'Czas lotu rakiety [s]'; 'Vr końcowa [m/s]'; 'Odległość osiągnięcia celu [m]'; 'Uchyb [m]'};
            app.UITable.RowName = {};
            app.UITable.ColumnEditable = true;
            app.UITable.Position = [4 1 845 99];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [3 107 846 475];

            % Create wykres3DTab
            app.wykres3DTab = uitab(app.TabGroup);
            app.wykres3DTab.Title = 'wykres 3D';
            app.wykres3DTab.BackgroundColor = [1 1 1];

            % Create UIAxes
            app.UIAxes = uiaxes(app.wykres3DTab);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.Position = [2 1 843 449];

            % Create wykres2DTab
            app.wykres2DTab = uitab(app.TabGroup);
            app.wykres2DTab.Title = 'wykres 2D';
            app.wykres2DTab.BackgroundColor = [1 1 1];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.wykres2DTab);
            title(app.UIAxes2, 'Title')
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            app.UIAxes2.Position = [2 209 843 241];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.wykres2DTab);
            xlabel(app.UIAxes3, 'X')
            ylabel(app.UIAxes3, 'Y')
            app.UIAxes3.Position = [2 1 843 209];

            % Create wykrespolarnyTab
            app.wykrespolarnyTab = uitab(app.TabGroup);
            app.wykrespolarnyTab.Title = 'wykres polarny';
            app.wykrespolarnyTab.BackgroundColor = [1 1 1];

            % Create Panel
            app.Panel = uipanel(app.wykrespolarnyTab);
            app.Panel.BackgroundColor = [1 1 1];
            app.Panel.Position = [2 1 843 449];

            % Create PaszczyznaocenybdunaprowadzaniaTab
            app.PaszczyznaocenybdunaprowadzaniaTab = uitab(app.TabGroup);
            app.PaszczyznaocenybdunaprowadzaniaTab.Title = 'Płaszczyzna oceny błędu naprowadzania';
            app.PaszczyznaocenybdunaprowadzaniaTab.BackgroundColor = [1 1 1];

            % Create UIAxes4
            app.UIAxes4 = uiaxes(app.PaszczyznaocenybdunaprowadzaniaTab);
            title(app.UIAxes4, 'Title')
            xlabel(app.UIAxes4, 'X')
            ylabel(app.UIAxes4, 'Y')
            app.UIAxes4.Position = [2 1 843 449];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = aplikacja_poj_strzal_exported(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

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