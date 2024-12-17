% 4.Uebung Aufgabe d)
%
% Bestimmung der Schrittweite fuer das Runge-Kutta-Verfahren 4.Ordung 
% fuer die Stabilitaetsgrenze des Verfahrens. Testsystem ist Modell
% fuer Automobilfederung aus Aufgabe 1.

% Loeschen des workspace und Fenster 3 aktivieren:
clear all
figure(3)
clf

% ----- Simulation -----
%
% Definition der Integrationsparameter
...
% Vorgabe der Schrittweite h:
h=0.01;
% Integration des Systems ueb4sys3:
[t,x] = iruku4(...);
% Zeichnen der Zeitverlaeufe:
subplot(2,1,1)
plot(t,x(:,1),'-',t,x(:,3),'--')
title('Lage Rad x(1) und Karosserie x(3)')
% Zeichnen der Zeitverlaufe der Geschwindigkeiten:
subplot(2,1,2)
plot(t,x(:,2),'-',t,x(:,4),'--')
title('Geschwindigkeit Rad x(2) und Karosserie x(4)')

% ------ Berechnung der Eigenwerte: -----
%
% (Parameter und A-Matrix aus ueb4sys3.m uebernommen)
m1 = 25;     % Masse der Raeder
m2 = 250;    % Masse der Karosserie
a1 = 9e+4;   % Federkonstante 1
a2 = 3e+4;   % Federkonstante 2
d2 = 750;    % Daempferkonstante
%
% Berechnung der A-Matrix:
A = [...];
% Ausgabe des Ergebnisses:
disp('Eigenwerte des Systems:')
% Berechung der Eigenwerte:
lam = ...

disp('Kappa-Werte:')
kappa = ...

% Darstellung der Kappa-Werte in der Kappa-Ebene:

% Fenster 4 aktivieren:
figure(4)
clf

% Tragen Sie den Imaginaerteil ueber dem Realteil auf:
plot( ... , ... ,'o')
grid on
% Beschriftung
title('Kappa-Ebene kappa=h*lambda')
xlabel('Realteil')
ylabel('Imaginaerteil')

% Stabilitaetsgebiet Runge-Kutta-Verfahren
for phi = ...
    z = ...;
    kappa = ...;
    hold on
    plot(...)
end
