%% Parameter festlegen
clear all;
close all;

tolerance = 0.05;  % Größere Toleranz für Testzwecke
xLimits = [0, 10];   
yLimits = [-2, 2];
daempferWerte = [750, 1500, 3000];

% Modell öffnen
mdl = "A3";
open_system(mdl);

% Schleife für jeden Dämpferwert
for i = 1:length(daempferWerte)
    aktuellerWert = daempferWerte(i);
    set_param('A3/d2', 'Gain', num2str(aktuellerWert));
    
    % Simulation ausführen
    out = sim(mdl);
    
    % Plotten der Daten für Visualisierung
    subplot(3, 1, i);
    plot(out.simout.Time, out.simout.Data(:, 1), 'r', 'DisplayName', 'y(t)');  % Erstes Signal in Rot
    hold on;
    plot(out.simout.Time, out.simout.Data(:, 2), 'b', 'DisplayName', 'x(t)');  % Zweites Signal in Blau
    title(['d = ', num2str(aktuellerWert)]);
    xlabel('Zeit (s)');
    ylabel('Ausgabe');
    xlim(xLimits);
    ylim(yLimits);
    legend;
    hold off;

    % Stationären Wert als Mittelwert der letzten 10% der Simulation berechnen
    last_10_percent = round(length(out.simout.Time) * 0.9):length(out.simout.Time);
    x_data = out.simout.Data(:, 2);
    y_data = out.simout.Data(:, 1);
    time = out.simout.Time;
    
    x_stationary = mean(x_data(last_10_percent));
    y_stationary = mean(y_data(last_10_percent));
    
    % Toleranzbereich berechnen
    x_upper = x_stationary * (1 + tolerance);
    x_lower = x_stationary * (1 - tolerance);
    y_upper = y_stationary * (1 + tolerance);
    y_lower = y_stationary * (1 - tolerance);
    
    % Einschwingzeit als ersten Zeitpunkt bestimmen, ab dem die Werte im Toleranzbereich bleiben
    x_time_idx = find(all(x_data >= x_lower & x_data <= x_upper, 2), 1);
    y_time_idx = find(all(y_data >= y_lower & y_data <= y_upper, 2), 1);

    % Einschwingzeiten anzeigen
    if ~isempty(x_time_idx)
        x_settling_time = time(x_time_idx);
        disp(['Für Dämpferwert ', num2str(aktuellerWert), ' ist die Einschwingzeit für x-Wert: ', num2str(x_settling_time), ' Sekunden']);
    else
        disp(['Für Dämpferwert ', num2str(aktuellerWert), ' wurde keine Einschwingzeit für x-Wert gefunden.']);
    end
    
    if ~isempty(y_time_idx)
        y_settling_time = time(y_time_idx);
        disp(['Für Dämpferwert ', num2str(aktuellerWert), ' ist die Einschwingzeit für y-Wert: ', num2str(y_settling_time), ' Sekunden']);
    else
        disp(['Für Dämpferwert ', num2str(aktuellerWert), ' wurde keine Einschwingzeit für y-Wert gefunden.']);
    end
end

%% b)
clear all;
close all;

xLimits = [0, 10];   
yLimits = [-2, 2];
frequenz = 0;


resonanzFrequenz1 = [1.3*2*pi, 1.5*2*pi, 1.7*2*pi];
resonanzFrequenz2 = [9.5*2*pi, 11.1*2*pi, 12*2*pi];

mdl = "A3b";
open_system(mdl);
figure;
for i = 1:length(resonanzFrequenz1)
    aktuellerWert = resonanzFrequenz1(i);
    set_param('A3b/Sine_Wave', 'Frequency', num2str(aktuellerWert));
    
    % Simulation ausführen
    out = sim(mdl);
    
    % Plotten der Daten für Visualisierung
    subplot(3, 1, i);
    plot(out.simout.Time, out.simout.Data(:, 1), 'r', 'DisplayName', 'y(t)');  % Erstes Signal in Rot
    hold on;
    plot(out.simout.Time, out.simout.Data(:, 2), 'b', 'DisplayName', 'x(t)');  % Zweites Signal in Blau
    title(['f1 = ', num2str(aktuellerWert)]);
    xlabel('Zeit (s)');
    ylabel('Ausgabe');
    xlim(xLimits);
    ylim(yLimits);
    legend;
    hold off;
end
figure;
xLimits = [0, 10];   
yLimits = [-5, 5];
for i = 1:length(resonanzFrequenz2)
    aktuellerWert = resonanzFrequenz2(i);
    set_param('A3b/Sine_Wave', 'Frequency', num2str(aktuellerWert));
    
    % Simulation ausführen
    out = sim(mdl);
    
    % Plotten der Daten für Visualisierung
    subplot(3, 1, i);
    plot(out.simout.Time, out.simout.Data(:, 1), 'r', 'DisplayName', 'y(t)');  % Erstes Signal in Rot
    hold on;
    plot(out.simout.Time, out.simout.Data(:, 2), 'b', 'DisplayName', 'x(t)');  % Zweites Signal in Blau
    title(['f2 = ', num2str(aktuellerWert)]);
    xlabel('Zeit (s)');
    ylabel('Ausgabe');
    xlim(xLimits);
    ylim(yLimits);
    legend;
    hold off;
end

%% 3 c)
clear all;
close all;

set_param('A3c', 'Solver', 'ode45');

% TODO -> alles als iterative forschleife coden und einfach so lange runnen
% lassen bis man "Vernünfitge werte" gefunden hat \_(°_°)_/

noise_power_value = 0.025;
set_param('A3c/Band-Limited_White_Noise', 'Cov', num2str(noise_power_value));

mdl = "A3c";
open_system(mdl);
out = sim(mdl);

figure;
plot(out.simout.Time, out.simout.Data(:, 1), 'r', 'DisplayName', 'y(t)');  % Erstes Signal in Rot
hold on;
plot(out.simout.Time, out.simout.Data(:, 2), 'b', 'DisplayName', 'x(t)');  % Zweites Signal in Blau
title(['Dieses Komische Noise']);
xlabel('Zeit (s)');
ylabel('Ausgabe');
xlim([3,10]);
ylim([-2,2]);
legend;
hold off;