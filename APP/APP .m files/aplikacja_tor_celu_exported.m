classdef aplikacja_tor_celu_exported < matlab.apps.AppBase

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
    end

    
    properties (Access = private)
        CallingApp % Main app object
        
        outc
    end
    
    methods (Access = private)
        
        function target_plots(app,dane)
            xyz = dane;
            
            %wykres 3D
            plot3(app.UIAxes,0,0,0,'go','LineWidth',3)
            hold(app.UIAxes);
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
            
            %wykres 2D XY
            plot(app.UIAxes2,0,0, 'go','LineWidth',3)
            hold(app.UIAxes2);
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

            %wykres 2D XZ
            plot(app.UIAxes3,0,0, 'go','LineWidth',3)
            hold(app.UIAxes3);
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
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, mainapp, outc, r_celu)
            % Store main app in property for CloseRequestFcn to use
            app.CallingApp = mainapp;
            
            app.outc=outc.xyz_c.Data;
            target_plots(app,outc.xyz_c.Data)

            app.UITable.Data = {r_celu max(outc.v.Data) min(outc.v.Data) mean(outc.v.Data) max(outc.n.Data) sqrt((outc.xyz_c.Data(1,1)^2+outc.xyz_c.Data(1,2)^2+outc.xyz_c.Data(1,3)^2)) max(outc.xyz_c.Data(:,2))};      

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
            app.UIFigure.Position = [100 100 846 581];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create UITable
            app.UITable = uitable(app.UIFigure);
            app.UITable.ColumnName = {'Rodzaj celu'; 'Vmax [m/s]'; 'Vmin [m/s]'; 'Vśr [m/s]'; 'Przeciążenie maks.'; 'Odległość wykrycia [m]'; 'Parametr maks. [m]'};
            app.UITable.RowName = {};
            app.UITable.ColumnEditable = true;
            app.UITable.Position = [2 1 845 99];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 107 846 475];

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

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = aplikacja_tor_celu_exported(varargin)

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