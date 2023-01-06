classdef aplikacja_manewry_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        DodawaniemanewruPanel           matlab.ui.container.Panel
        RodzajDropDownLabel             matlab.ui.control.Label
        RodzajDropDown                  matlab.ui.control.DropDown
        WartomanewrustopnieEditFieldLabel  matlab.ui.control.Label
        WartomanewrustopnieEditField    matlab.ui.control.NumericEditField
        SzybkomanewrustopniesEditFieldLabel  matlab.ui.control.Label
        SzybkomanewrustopniesEditField  matlab.ui.control.NumericEditField
        CzasrozpoczciamanewrusEditFieldLabel  matlab.ui.control.Label
        CzasrozpoczciamanewrusEditField  matlab.ui.control.NumericEditField
        DodajButton                     matlab.ui.control.StateButton
        DodaniezmianyprdkociPanel       matlab.ui.container.Panel
        RodzajDropDown_2Label           matlab.ui.control.Label
        RodzajDropDown_2                matlab.ui.control.DropDown
        WartoprzyrostuprdkocimsEditFieldLabel  matlab.ui.control.Label
        WartoprzyrostuprdkocimsEditField  matlab.ui.control.NumericEditField
        Wartoprzyspieszeniams2EditFieldLabel  matlab.ui.control.Label
        Wartoprzyspieszeniams2EditField  matlab.ui.control.NumericEditField
        CzasrozpoczciaprzyspieszeniasEditFieldLabel  matlab.ui.control.Label
        CzasrozpoczciaprzyspieszeniasEditField  matlab.ui.control.NumericEditField
        DodajButton_2                   matlab.ui.control.StateButton
        ZAAKCEPTUJButton                matlab.ui.control.Button
        UITable                         matlab.ui.control.Table
        ANULUJButton                    matlab.ui.control.Button
    end

    
    properties (Access = private)
        CallingApp % Description
        A_z
        E_z
        Ac_z % Description
        tabela 
        l = 1
    end
    
    methods (Access = private)
        
        function V = Acceleration(~,v,as,tp,V)
            as=abs(as/v)*v;                     %przypisanie wartości przyspieszenia odpowiedniego znaku +/-
            B=zeros(length(V),1);               %wektor pomocniczy B
            t_s=abs(v/as);                      %czas trwania przyspieszenia [s]
                
            for i=1:t_s/0.001                     %do wektora B przez dany przedział czasu przypisujemy wartość przyspieszenia
                B(i+tp/0.001)=as;
            end
                
            V=V+B;                              %dodawanie nowego sygnału przyspieszenia do istniejącego wektora przyspieszneia
        end
        
        function A = Azimuth_turn(~,theta,thetadot,tp,A)
            thetadot=abs(thetadot/theta)*theta; %przypisanie prędkości kątowej odpowiedniego znaku +/-
            B=zeros(length(A),1);               %wektor pomocniczy B
            t_s=abs(theta/thetadot);            %czas trwania manewru;
            
            for i=1:t_s/0.001                     %do wektora B przez dany przedział czasu przypisujemy wartość prędkości
                B(i+tp/0.001)=deg2rad(thetadot);
            end
            
            A=A+B;                              %dodawanie nowego sygnału prędkości do istniejącego wektora prędkości
        end
        
        function E = Elevation_turn(~,epsilon,epsilondot,tp,E)
            epsilondot=abs(epsilondot/epsilon)*epsilon; %przypisanie prędkości kątowej odpowiedniego znaku +/-
            B=zeros(length(E),1);                       %wektor pomocniczy B
            t_s=abs(epsilon/epsilondot);                %czas trwania manewru [s]
                
            for i=1:t_s/0.001                             %do wektora B przez dany przedział czasu przypisujemy wartość prędkości
                B(i+tp/0.001)=deg2rad(epsilondot);
            end
                
            E=E+B;                                      %dodawanie nowego sygnału prędkości do istniejącego wektora prędkości
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, mainapp, A, E, Ac)
            % Store main app in property for CloseRequestFcn to use
            app.CallingApp = mainapp;
            
            app.A_z = A;
            app.Ac_z = Ac;
            app.E_z = E;
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

        % Value changed function: DodajButton
        function DodajButtonValueChanged(app, event)
            value = app.RodzajDropDown.Value;
            if strcmp(value,'skręt w prawo') 
                app.A_z = Azimuth_turn(app,app.WartomanewrustopnieEditField.Value,app.SzybkomanewrustopniesEditField.Value,app.CzasrozpoczciamanewrusEditField.Value,app.A_z);
            elseif strcmp(value,'skręt w lewo')
                app.A_z = Azimuth_turn(app,(-1*app.WartomanewrustopnieEditField.Value),app.SzybkomanewrustopniesEditField.Value,app.CzasrozpoczciamanewrusEditField.Value,app.A_z);
            elseif strcmp(value,'skręt w górę')
                app.E_z = Elevation_turn(app,app.WartomanewrustopnieEditField.Value,app.SzybkomanewrustopniesEditField.Value,app.CzasrozpoczciamanewrusEditField.Value,app.E_z);
            else
                app.E_z = Elevation_turn(app,(-1*app.WartomanewrustopnieEditField.Value),app.SzybkomanewrustopniesEditField.Value,app.CzasrozpoczciamanewrusEditField.Value,app.E_z);
            end
            
            switch app.l
                case 1
                    app.tabela = {app.RodzajDropDown.Value [num2str(app.WartomanewrustopnieEditField.Value) ' stopnie'] [num2str(app.SzybkomanewrustopniesEditField.Value) ' stopnie/s'] app.CzasrozpoczciamanewrusEditField.Value};
                    app.UITable.Data = app.tabela;
                    app.l = app.l + 1;
                otherwise
                    app.tabela = [app.tabela;
                        {app.RodzajDropDown.Value [num2str(app.WartomanewrustopnieEditField.Value) ' stopnie'] [num2str(app.SzybkomanewrustopniesEditField.Value) ' stopnie/s'] app.CzasrozpoczciamanewrusEditField.Value}];
                    app.UITable.Data = app.tabela;
            end
            
        end

        % Value changed function: DodajButton_2
        function DodajButton_2ValueChanged(app, event)
            value = app.RodzajDropDown_2.Value;
            if strcmp(value,'przyspieszenie')
                app.Ac_z = Acceleration(app,app.WartoprzyrostuprdkocimsEditField.Value,app.Wartoprzyspieszeniams2EditField.Value,app.CzasrozpoczciaprzyspieszeniasEditField.Value,app.Ac_z);
            else
                app.Ac_z = Acceleration(app,(-1*app.WartoprzyrostuprdkocimsEditField.Value),app.Wartoprzyspieszeniams2EditField.Value,app.CzasrozpoczciaprzyspieszeniasEditField.Value,app.Ac_z);
            end
            
            switch app.l
                case 1
                    app.tabela = {app.RodzajDropDown_2.Value [num2str(app.WartoprzyrostuprdkocimsEditField.Value) ' m/s'] [num2str(app.Wartoprzyspieszeniams2EditField.Value) ' m/s^2'] app.CzasrozpoczciaprzyspieszeniasEditField.Value};
                    app.UITable.Data = app.tabela;
                    app.l = app.l + 1;
                otherwise
                    app.tabela = [app.tabela;
                        {app.RodzajDropDown_2.Value [num2str(app.WartoprzyrostuprdkocimsEditField.Value) ' m/s'] [num2str(app.Wartoprzyspieszeniams2EditField.Value) ' m/s^2'] app.CzasrozpoczciaprzyspieszeniasEditField.Value}];
                    app.UITable.Data = app.tabela;
            end
            
        end

        % Button pushed function: ZAAKCEPTUJButton
        function ZAAKCEPTUJButtonPushed(app, event)
            app.CallingApp.Ac = app.Ac_z;
            app.CallingApp.B_cel_dot = app.A_z;
            app.CallingApp.E_cel_dot = app.E_z;
            
            % Enable the Plot Opions button in main app
            app.CallingApp.SymulujtorruchuceluButton.Enable = 'on';
            app.CallingApp.SYMULACJAButton.Enable = 'on';
            app.CallingApp.PojedynczystrzaButton.Enable = 'on';
            app.CallingApp.DodajmanewryButton.Enable = 'on';
            app.CallingApp.WyczymanewryButton.Enable = 'on';
            
            % Delete the dialog box 
            delete(app)
            
        end

        % Button pushed function: ANULUJButton
        function ANULUJButtonPushed(app, event)
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
            app.UIFigure.Position = [100 100 538 403];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create DodawaniemanewruPanel
            app.DodawaniemanewruPanel = uipanel(app.UIFigure);
            app.DodawaniemanewruPanel.TitlePosition = 'centertop';
            app.DodawaniemanewruPanel.Title = 'Dodawanie manewru';
            app.DodawaniemanewruPanel.BackgroundColor = [1 1 1];
            app.DodawaniemanewruPanel.FontWeight = 'bold';
            app.DodawaniemanewruPanel.Position = [1 185 253 219];

            % Create RodzajDropDownLabel
            app.RodzajDropDownLabel = uilabel(app.DodawaniemanewruPanel);
            app.RodzajDropDownLabel.HorizontalAlignment = 'right';
            app.RodzajDropDownLabel.Position = [16 165 43 22];
            app.RodzajDropDownLabel.Text = 'Rodzaj';

            % Create RodzajDropDown
            app.RodzajDropDown = uidropdown(app.DodawaniemanewruPanel);
            app.RodzajDropDown.Items = {'skręt w prawo', 'skręt w lewo', 'skręt w dół', 'skręt w górę'};
            app.RodzajDropDown.Position = [74 165 168 22];
            app.RodzajDropDown.Value = 'skręt w prawo';

            % Create WartomanewrustopnieEditFieldLabel
            app.WartomanewrustopnieEditFieldLabel = uilabel(app.DodawaniemanewruPanel);
            app.WartomanewrustopnieEditFieldLabel.HorizontalAlignment = 'right';
            app.WartomanewrustopnieEditFieldLabel.Position = [11 127 150 22];
            app.WartomanewrustopnieEditFieldLabel.Text = 'Wartość manewru [stopnie]';

            % Create WartomanewrustopnieEditField
            app.WartomanewrustopnieEditField = uieditfield(app.DodawaniemanewruPanel, 'numeric');
            app.WartomanewrustopnieEditField.Limits = [0 360];
            app.WartomanewrustopnieEditField.Position = [176 127 66 22];

            % Create SzybkomanewrustopniesEditFieldLabel
            app.SzybkomanewrustopniesEditFieldLabel = uilabel(app.DodawaniemanewruPanel);
            app.SzybkomanewrustopniesEditFieldLabel.HorizontalAlignment = 'right';
            app.SzybkomanewrustopniesEditFieldLabel.Position = [2 89 168 22];
            app.SzybkomanewrustopniesEditFieldLabel.Text = 'Szybkość manewru [stopnie/s]';

            % Create SzybkomanewrustopniesEditField
            app.SzybkomanewrustopniesEditField = uieditfield(app.DodawaniemanewruPanel, 'numeric');
            app.SzybkomanewrustopniesEditField.Limits = [0 90];
            app.SzybkomanewrustopniesEditField.Position = [176 89 66 22];

            % Create CzasrozpoczciamanewrusEditFieldLabel
            app.CzasrozpoczciamanewrusEditFieldLabel = uilabel(app.DodawaniemanewruPanel);
            app.CzasrozpoczciamanewrusEditFieldLabel.HorizontalAlignment = 'right';
            app.CzasrozpoczciamanewrusEditFieldLabel.Position = [1 51 169 22];
            app.CzasrozpoczciamanewrusEditFieldLabel.Text = 'Czas rozpoczęcia manewru [s]';

            % Create CzasrozpoczciamanewrusEditField
            app.CzasrozpoczciamanewrusEditField = uieditfield(app.DodawaniemanewruPanel, 'numeric');
            app.CzasrozpoczciamanewrusEditField.Limits = [0 60];
            app.CzasrozpoczciamanewrusEditField.Position = [176 51 66 22];

            % Create DodajButton
            app.DodajButton = uibutton(app.DodawaniemanewruPanel, 'state');
            app.DodajButton.ValueChangedFcn = createCallbackFcn(app, @DodajButtonValueChanged, true);
            app.DodajButton.Text = 'Dodaj';
            app.DodajButton.Position = [77 12 100 22];

            % Create DodaniezmianyprdkociPanel
            app.DodaniezmianyprdkociPanel = uipanel(app.UIFigure);
            app.DodaniezmianyprdkociPanel.TitlePosition = 'centertop';
            app.DodaniezmianyprdkociPanel.Title = 'Dodanie zmiany prędkości';
            app.DodaniezmianyprdkociPanel.BackgroundColor = [1 1 1];
            app.DodaniezmianyprdkociPanel.FontWeight = 'bold';
            app.DodaniezmianyprdkociPanel.Position = [254 185 285 219];

            % Create RodzajDropDown_2Label
            app.RodzajDropDown_2Label = uilabel(app.DodaniezmianyprdkociPanel);
            app.RodzajDropDown_2Label.HorizontalAlignment = 'right';
            app.RodzajDropDown_2Label.Position = [45 165 43 22];
            app.RodzajDropDown_2Label.Text = 'Rodzaj';

            % Create RodzajDropDown_2
            app.RodzajDropDown_2 = uidropdown(app.DodaniezmianyprdkociPanel);
            app.RodzajDropDown_2.Items = {'przyspieszenie', 'hamowanie'};
            app.RodzajDropDown_2.Position = [103 165 168 22];
            app.RodzajDropDown_2.Value = 'przyspieszenie';

            % Create WartoprzyrostuprdkocimsEditFieldLabel
            app.WartoprzyrostuprdkocimsEditFieldLabel = uilabel(app.DodaniezmianyprdkociPanel);
            app.WartoprzyrostuprdkocimsEditFieldLabel.HorizontalAlignment = 'right';
            app.WartoprzyrostuprdkocimsEditFieldLabel.Position = [8 127 186 22];
            app.WartoprzyrostuprdkocimsEditFieldLabel.Text = 'Wartość przyrostu prędkości [m/s]';

            % Create WartoprzyrostuprdkocimsEditField
            app.WartoprzyrostuprdkocimsEditField = uieditfield(app.DodaniezmianyprdkociPanel, 'numeric');
            app.WartoprzyrostuprdkocimsEditField.Limits = [0 200];
            app.WartoprzyrostuprdkocimsEditField.Position = [205 127 66 22];

            % Create Wartoprzyspieszeniams2EditFieldLabel
            app.Wartoprzyspieszeniams2EditFieldLabel = uilabel(app.DodaniezmianyprdkociPanel);
            app.Wartoprzyspieszeniams2EditFieldLabel.HorizontalAlignment = 'right';
            app.Wartoprzyspieszeniams2EditFieldLabel.Position = [26 89 173 22];
            app.Wartoprzyspieszeniams2EditFieldLabel.Text = 'Wartość przyspieszenia [m/s^2]';

            % Create Wartoprzyspieszeniams2EditField
            app.Wartoprzyspieszeniams2EditField = uieditfield(app.DodaniezmianyprdkociPanel, 'numeric');
            app.Wartoprzyspieszeniams2EditField.Limits = [0 90];
            app.Wartoprzyspieszeniams2EditField.Position = [205 89 66 22];

            % Create CzasrozpoczciaprzyspieszeniasEditFieldLabel
            app.CzasrozpoczciaprzyspieszeniasEditFieldLabel = uilabel(app.DodaniezmianyprdkociPanel);
            app.CzasrozpoczciaprzyspieszeniasEditFieldLabel.HorizontalAlignment = 'right';
            app.CzasrozpoczciaprzyspieszeniasEditFieldLabel.Position = [-1 51 200 22];
            app.CzasrozpoczciaprzyspieszeniasEditFieldLabel.Text = 'Czas rozpoczęcia przyspieszenia [s]';

            % Create CzasrozpoczciaprzyspieszeniasEditField
            app.CzasrozpoczciaprzyspieszeniasEditField = uieditfield(app.DodaniezmianyprdkociPanel, 'numeric');
            app.CzasrozpoczciaprzyspieszeniasEditField.Limits = [0 60];
            app.CzasrozpoczciaprzyspieszeniasEditField.Position = [205 51 66 22];

            % Create DodajButton_2
            app.DodajButton_2 = uibutton(app.DodaniezmianyprdkociPanel, 'state');
            app.DodajButton_2.ValueChangedFcn = createCallbackFcn(app, @DodajButton_2ValueChanged, true);
            app.DodajButton_2.Text = 'Dodaj';
            app.DodajButton_2.Position = [93 12 100 22];

            % Create ZAAKCEPTUJButton
            app.ZAAKCEPTUJButton = uibutton(app.UIFigure, 'push');
            app.ZAAKCEPTUJButton.ButtonPushedFcn = createCallbackFcn(app, @ZAAKCEPTUJButtonPushed, true);
            app.ZAAKCEPTUJButton.BackgroundColor = [0.0745 0.6235 1];
            app.ZAAKCEPTUJButton.FontSize = 16;
            app.ZAAKCEPTUJButton.FontWeight = 'bold';
            app.ZAAKCEPTUJButton.Position = [120 12 123 26];
            app.ZAAKCEPTUJButton.Text = 'ZAAKCEPTUJ';

            % Create UITable
            app.UITable = uitable(app.UIFigure);
            app.UITable.ColumnName = {'Rodzaj'; 'Wartość manewru'; 'Szybkość manewru'; 'Czas rozpoczęcia [s]'};
            app.UITable.RowName = {};
            app.UITable.Position = [1 44 538 142];

            % Create ANULUJButton
            app.ANULUJButton = uibutton(app.UIFigure, 'push');
            app.ANULUJButton.ButtonPushedFcn = createCallbackFcn(app, @ANULUJButtonPushed, true);
            app.ANULUJButton.BackgroundColor = [1 0 0];
            app.ANULUJButton.FontSize = 16;
            app.ANULUJButton.FontWeight = 'bold';
            app.ANULUJButton.Position = [302.5 12 123 26];
            app.ANULUJButton.Text = 'ANULUJ';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = aplikacja_manewry_exported(varargin)

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