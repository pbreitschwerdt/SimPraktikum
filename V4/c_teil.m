% 4.Uebung Aufgabe c)
%
% Simulation eines ungedaempften Schwingers xpp+x=0
% als Testfall fuer drei Integrationsverfahren

% -------- Runge-Kutta-Verfahren --------

% Loeschen des workspace und Fenster 2 aktivieren:
clear all
figure(2)
clf
% Definition der Integrationsparameter
...
% Schleife ueber alle Werte der Schrittweite
for i=1: ...
    % Integration des Systems ueb4sys2 mit iruku4:
    [t,x] = iruku4(...);
    % Untersuchung der Loesungen durch
    % Darstellung der Zeitverlaeufe und des Phasenportraits
    %
    % Die Simulation mit der kleinsten Schrittweite als Referenz:
    if i==1
        subplot(3,2,1)
        % Zeichnen der Zeitverlaeufe x1(t) und x2(t):
        plot(t,x(...),'-',t,x(...),'--')
        % Diagrammbeschriftung
        ...
        % Zeichnen des Phasenportraits x2(x1):
        subplot(3,2,2)
        plot(x(...),x(...),'-')
        % Diagrammbeschriftung
        ...
    end
    %
    % Zeitverlauefe und Phasenportraits fuer alle Schrittweiten
    % in jeweils einem Diagramm einzeichnen:
    subplot(3,2,3), hold on
    % Zeitverlauefe von x1(t), auf x2(t) kann verzichtet werden.
    plot(t,x(...))
    % Phasenportrait
    subplot(3,2,4), hold on
    plot(x(...),x(...),'-')
end
%
% Beschriftung der vorigen beiden Diagramme
hold on
subplot(3,2,3)
title('...'), ylabel('...')
hold on
subplot(3,2,4)
title('...')
xlabel('...'), ylabel('...')

% -------- Ende Runge-Kutta ---------

% Verifikation der Instabilitaet des Euler- und des
% Adams-Bashforth-Integrators:
%
% Es genuegt die Integrationen nur einmal durchzufuehren,
% mit nur einer konstanten Schrittweite, aber natuerlich
% ueber den gesamten Zeitbereich (sonst kein vernuenftiges
% Phasenportrait darstellbar)

% -------- Euler Integrator ---------
%
% ggf. Variablen loeschen oder neu zuweisen
...
% Integration
[t,x] = ieuler(...);
% Zeichnen des Phasenportraits in ein weiteres Diagramm
subplot(3,2,5)
hold on
plot(x(...),x(...))
% Beschriftung
...

% -------- Adams-Bashforth Integrator ---------
%
% ggf. Variablen loeschen oder neu zuweisen
...
[t,x] = iadams(...);
% Zeichnen des Phasenportraits in ein weiteres Diagramm
subplot(3,2,6)
plot(x(...),x(...))
% Beschriftung
...
