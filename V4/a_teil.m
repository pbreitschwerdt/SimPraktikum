% 4.Uebung Aufgabe a)
%
close all;
clear all;
clc;
% Vergleich dreier Integrationsverfahren:
h_euler = [0.05, 0.5, 1.0, 2.0, 2.2];
h_adams = [0.05, 0.5, 1.0, 1.3];
h_ruku4 = [0.05, 0.5, 2.0, 2.7, 2.8, 2.9];


% Zeitspanne
t0 = 0;     % Startzeit
tfinal = 10; % Endzeit
x0 = 1;     % Anfangswert

% Diagramm vorbereiten
figure(1)
clf
% -------- Euler Integrator ---------
subplot(3,1,1)
title('Euler-Verfahren')
xlabel('Zeit t')
ylabel('x(t)')
hold on
for h = h_euler
    [t, x] = ieuler(@ueb4sys1, t0, tfinal, x0, h);
    plot(t, x, 'DisplayName', ['h = ' num2str(h)])
end
legend
hold off

% -------- Adams-Bashforth Integrator ---------
subplot(3,1,2)
title('Adams-Bashforth-Verfahren')
xlabel('Zeit t')
ylabel('x(t)')
hold on
for h = h_adams
    [t, x] = iadams(@ueb4sys1, t0, tfinal, x0, h);
    plot(t, x, 'DisplayName', ['h = ' num2str(h)])
end
legend
hold off

% -------- Runge-Kutta 4. Ordnung ---------
subplot(3,1,3)
title('Runge-Kutta 4. Ordnung')
xlabel('Zeit t')
ylabel('x(t)')
hold on
for h = h_ruku4
    [t, x] = iruku4(@ueb4sys1, t0, tfinal, x0, h);
    plot(t, x, 'DisplayName', ['h = ' num2str(h)])
end
legend
hold off
