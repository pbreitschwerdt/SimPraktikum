clear all;
close all;

xLimits = [0, 20];   
yLimits = [-3, 3];

mdl = "A2";
open_system(mdl);
out = sim(mdl);
figure;

% Deadzone 
subplot(4, 1, 1);

% Annahme: `out.simout.Data` enthält mehrere Spalten, z.B. zwei Signale
plot(out.simout.Time, out.simout.Data(:, 1), 'r', 'DisplayName', 'Sinus');  % Erstes Signal in Rot
hold on;
plot(out.simout.Time, out.simout.Data(:, 2), 'b', 'DisplayName', 'Deadzone');  % Zweites Signal in Blau

title('Deadzone');
xlabel('Zeit (s)');
ylabel('Ausgabe');
xlim(xLimits);
ylim(yLimits);

% Legende hinzufügen
legend;
hold off;

% Saturation
subplot(4, 1, 2);

% Annahme: `out.simout.Data` enthält mehrere Spalten, z.B. zwei Signale
plot(out.simout.Time, out.simout.Data(:, 1), 'r', 'DisplayName', 'Sinus');  % Erstes Signal in Rot
hold on;
plot(out.simout.Time, out.simout.Data(:, 2), 'b', 'DisplayName', 'Saturation');  % Zweites Signal in Blau

title('Saturation');
xlabel('Zeit (s)');
ylabel('Ausgabe');
xlim(xLimits);
ylim(yLimits);

% Legende hinzufügen
legend;
hold off;

% Relay
subplot(4, 1, 3);

% Annahme: `out.simout.Data` enthält mehrere Spalten, z.B. zwei Signale
plot(out.simout2.Time, out.simout2.Data(:, 2), 'r', 'DisplayName', 'Sinus');  % Erstes Signal in Rot
hold on;
plot(out.simout2.Time, out.simout2.Data(:, 1), 'b', 'DisplayName', 'Relay');  % Zweites Signal in Blau

title('Relay');
xlabel('Zeit (s)');
ylabel('Ausgabe');
xlim(xLimits);
ylim(yLimits);

% Legende hinzufügen
legend;
hold off;

% Backlash
subplot(4, 1, 4);

% Annahme: `out.simout.Data` enthält mehrere Spalten, z.B. zwei Signale
plot(out.simout3.Time, out.simout3.Data(:, 2), 'r', 'DisplayName', 'Sinus');  % Erstes Signal in Rot
hold on;
plot(out.simout3.Time, out.simout3.Data(:, 1), 'b', 'DisplayName', 'Backlash');  % Zweites Signal in Blau

title('Backlash');
xlabel('Zeit (s)');
ylabel('Ausgabe');
xlim(xLimits);
ylim(yLimits);

% Legende hinzufügen
legend;
hold off;
