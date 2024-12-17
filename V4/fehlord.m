clear all;
close all;
clc;

% fehlord.m
% Simulationstechnik Übung 4
% Darstellung des lokalen Verfahrensfehlers für die
% Integration des Testsystems xdot = -x mit dem
% Runge-Kutta-Verfahren 4. Ordnung

% Schrittweiten
h = 0.1:0.1:2;  % Schrittweiten von 0.1 bis 2
fehlvek = [];   % Array für die Fehlerwerte

% Anfangsbedingungen
x0 = 1;         % Anfangswert
t0 = 0;         % Anfangszeit
tfinal = h(1);  % Endzeit (nur ein Schritt)
  
% Schleife über alle Schrittweiten
for i = 1:length(h)
    % Integration des Systems mit Runge-Kutta-Verfahren 4. Ordnung
    [t, x] = iruku4(@ueb4sys1, t0, t0 + h(i), x0, h(i));
    
    % Berechnung der exakten Lösung
    exakt = x0 * exp(-h(i));  % Exakte Lösung nach einem Schritt
    
    % Berechnung des Fehlers für den Endwert der numerischen Lösung
    fehler = abs(x(end) - exakt);   % Fehler als absolute Differenz
    
    % Speichern des Fehlers in einem Vektor
    fehlvek(i) = fehler;  % Fehlervector wird hier als Vektor gespeichert
end

% Plot der Fehler in Abhängigkeit von der Schrittweite
figure
plot(h, fehlvek, 'o-', 'DisplayName', 'Fehler')
title('Lokaler Verfahrensfehler für Runge-Kutta-Verfahren 4. Ordnung');
ylabel('x(numerisch)-x(exakt) nach einem Integrationsschritt');
xlabel('Schrittweite h')
grid on
legend
