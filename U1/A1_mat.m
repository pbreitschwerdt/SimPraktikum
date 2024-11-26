%% System Definition
% a)
clear all;
close all;

A = [0,1;-1/4,0];
b = [0;1/4];
c = [1,0];
d = 0;

simulationTime = 60;  
xLimits = [0, simulationTime];   
yLimits = [-3, 3];

for variable = 0.1:0.1:0.4
    % Schrittweite in den Simulink-Parametern festlegen
    set_param('A1', 'Solver', 'ode4', 'FixedStep', num2str(variable));
    mdl = "A1";
    open_system(mdl);
    
    % Simulation ausführen
    out = sim(mdl);
    
    % Neues Plot-Fenster für jede Schrittweite öffnen
    figure;
    
    % Fehler (simout) plotten
    subplot(3, 1, 1);
    plot(out.simout.Time, out.simout.Data, 'r'); 
    title(['Fehler bei Schrittweite = ', num2str(variable)]);
    xlabel('Zeit (s)');
    ylabel('Fehler');
    xlim(xLimits);
    ylim([-0.00025,0.00025]);
    
    % Analytische Lösung (simout1) plotten
    subplot(3, 1, 2);
    plot(out.simout1.Time, out.simout1.Data, 'g'); 
    title('Analytische Lösung');
    xlabel('Zeit (s)');
    ylabel('Analytische Lösung');
    xlim(xLimits);
    ylim(yLimits);
    
    % Numerische Lösung (simout2) plotten
    subplot(3, 1, 3);
    plot(out.simout2.Time, out.simout2.Data, 'b'); 
    title('Numerische Lösung');
    xlabel('Zeit (s)');
    ylabel('Numerische Lösung');
    xlim(xLimits);
    ylim(yLimits);
    
    % Gesamttitel für das Plotfenster
    sgtitle(['Simulationsergebnisse bei Schrittweite ', num2str(variable)]);
end

%% b)

clear all;
close all;


A = [0,1;-1/4,0];
b = [0;1/4];
c = [1,0];
d = 0;

simulationTime = 60;  
xLimits = [0, simulationTime];   
yLimits = [-3, 3];

for variable = 0.05:0.05:0.15
    % Schrittweite in den Simulink-Parametern festlegen
    set_param('A1', 'Solver', 'ode1', 'FixedStep', num2str(variable));
    mdl = "A1";
    open_system(mdl);
    
    % Simulation ausführen
    out = sim(mdl);
    
    % Neues Plot-Fenster für jede Schrittweite öffnen
    figure;
    
    % Fehler (simout) plotten
    subplot(3, 1, 1);
    plot(out.simout.Time, out.simout.Data, 'r'); 
    title(['Fehler bei Schrittweite = ', num2str(variable)]);
    xlabel('Zeit (s)');
    ylabel('Fehler');
    xlim(xLimits);
    ylim([-0.75,0.75]);
    
    % Analytische Lösung (simout1) plotten
    subplot(3, 1, 2);
    plot(out.simout1.Time, out.simout1.Data, 'g'); 
    title('Analytische Lösung');
    xlabel('Zeit (s)');
    ylabel('Analytische Lösung');
    xlim(xLimits);
    ylim(yLimits);
    
    % Numerische Lösung (simout2) plotten
    subplot(3, 1, 3);
    plot(out.simout2.Time, out.simout2.Data, 'b'); 
    title('Numerische Lösung');
    xlabel('Zeit (s)');
    ylabel('Numerische Lösung');
    xlim(xLimits);
    ylim(yLimits);
    
    % Gesamttitel für das Plotfenster
    sgtitle(['Simulationsergebnisse bei Schrittweite ', num2str(variable), ...
        'und od1']);
end

for variable = 0.3:0.1:0.5
    % Schrittweite in den Simulink-Parametern festlegen
    set_param('A1', 'Solver', 'ode2', 'FixedStep', num2str(variable));
    mdl = "A1";
    open_system(mdl);
    
    % Simulation ausführen
    out = sim(mdl);
    
    % Neues Plot-Fenster für jede Schrittweite öffnen
    figure;
    
    % Fehler (simout) plotten
    subplot(3, 1, 1);
    plot(out.simout.Time, out.simout.Data, 'r'); 
    title(['Fehler bei Schrittweite = ', num2str(variable)]);
    xlabel('Zeit (s)');
    ylabel('Fehler');
    xlim(xLimits);
    ylim([-0.25,0.25]);
    
    % Analytische Lösung (simout1) plotten
    subplot(3, 1, 2);
    plot(out.simout1.Time, out.simout1.Data, 'g'); 
    title('Analytische Lösung');
    xlabel('Zeit (s)');
    ylabel('Analytische Lösung');
    xlim(xLimits);
    ylim(yLimits);
    
    % Numerische Lösung (simout2) plotten
    subplot(3, 1, 3);
    plot(out.simout2.Time, out.simout2.Data, 'b'); 
    title('Numerische Lösung');
    xlabel('Zeit (s)');
    ylabel('Numerische Lösung');
    xlim(xLimits);
    ylim(yLimits);
    
    % Gesamttitel für das Plotfenster
    sgtitle(['Simulationsergebnisse bei Schrittweite ', num2str(variable) ...
        'und ode2']);
end