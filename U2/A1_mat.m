clear all;
close all;

% Parameters
a=5;
b=0.01;
c=3;
d=0.0001;
e=0.0001;
f=0.01;
x10 = 30000;
x20 = 150;
x_x = (a*f+b*c)/(e*f+b*d);
y_y = (a*d-e*c)/(e*f+b*d);

set_param('A1', 'Solver', 'ode4', 'FixedStep', num2str(0.001));

% a)

xLimits = [0, 8.1];   
x10_AB = [30000, 30000, 30000, 30000, 30000];
x20_AB = [50, 100, 250, 501, 1000];

%Bei fünfhundert Räuber ist glaube nen spezialfall mit 501 fkt.
%Und nein die grapfen müssen nicht alle gleich sein da die räuber sich ja
%ändern

mdl = "A1";
open_system(mdl);
figure;

for i = 1:length(x10_AB)
    aktuellerWert = x10_AB(i);
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(e));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(f));
    % Simulation ausführen
    out = sim(mdl);
    
    % Plotten der Daten für Visualisierung
    subplot(length(x10_AB), 1, i);
    plot(out.simout.Time, out.beute.Data, 'r', 'DisplayName', 'Beute'); % Erstes Signal in Rot
    title(['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i)) ' mit Eigenkonkurrenz']);
    xlabel('Zeit (s)');
    ylabel('Ausgabe');
    xlim(xLimits);
    legend;
end

figure;

for i = 1:length(x10_AB)
    aktuellerWert = x10_AB(i);
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(e));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(f));

    % Simulation ausführen
    out = sim(mdl);
    subplot(length(x10_AB), 1, i);
    plot(out.simout.Time, out.raeuber.Data, 'b', 'DisplayName', 'Räuber');  % Zweites Signal in Blau
    title(['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i)) ' mit Eigenkonkurrenz']);
    xlabel('Zeit (s)');
    ylabel('Ausgabe');
    xlim(xLimits);
    legend;
end

figure;

for i = 1:length(x10_AB)
    aktuellerWert = x10_AB(i);
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(e));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(f));
    % Simulation ausführen
    out = sim(mdl);
    
    % Plotten der Daten für Visualisierung
    plot(out.raeuber.Data, out.beute.Data, 'DisplayName', ['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i))]); % Erstes Signal in Rot
    hold on;
end
    plot(0,0,"or", DisplayName="Triviale Ruhelage")
    plot(0, a/e,"or", DisplayName="Ruhelage")
    plot((a*d-e*c)/(e*f+b*d), (a*f+b*c)/(e*f+b*d), "or", DisplayName="Ruhelage")
    title('Phasen mit Eigenkonkurrenz');
    xlabel('Räuber');
    ylabel('Beute');
    legend;
    hold off;

figure;


for i = 1:length(x10_AB)
    aktuellerWert = x10_AB(i);
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(0));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(0));
    % Simulation ausführen
    out = sim(mdl);
    
    % Plotten der Daten für Visualisierung
    subplot(length(x10_AB), 1, i);
    plot(out.simout.Time, out.beute.Data, 'r', 'DisplayName', 'Beute'); % Erstes Signal in Rot
    title(['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i)) ' ohne Eigenkonkurrenz']);
    xlabel('Zeit (s)');
    ylabel('Ausgabe');
    xlim(xLimits);
    legend;
end

figure;

for i = 1:length(x10_AB)
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(0));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(0));

    % Simulation ausführen
    out = sim(mdl);
    subplot(length(x10_AB), 1, i);
    plot(out.simout.Time, out.raeuber.Data, 'b', 'DisplayName', 'Räuber');  % Zweites Signal in Blau
    title(['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i)) ' ohne Eigenkonkurrenz']);
    xlabel('Zeit (s)');
    ylabel('Ausgabe');
    xlim(xLimits);
    legend;
end

figure;

for i = 1:length(x10_AB)
    aktuellerWert = x10_AB(i);
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(0));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(0));
    % Simulation ausführen
    out = sim(mdl);
    
    % Plotten der Daten für Visualisierung
    plot(out.beute.Data, out.raeuber.Data, 'DisplayName', ['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i))]); % Erstes Signal in Rot
    hold on;
end
    title('Phasen ohne Eigenkonkurrenz');
    xlabel('Beute');
    ylabel('Räuber');
    legend;
    hold off;


%% b)
clear all;
close all;

% Parameters
a=5;
b=0.01;
c=3;
d=0.0001;
e=0.0001;
f=0.01;
x10 = 30000;
x20 = 150;

set_param('A1', 'Solver', 'ode45');

xLimits = [0, 8.1];   
x10_AB = [30000, 30000, 30000, 30000, 30000];
x20_AB = [50, 100, 250, 501, 1000];

%Bei fünfhundert Räuber ist glaube nen spezialfall mit 501 fkt.
%Und nein die grapfen müssen nicht alle gleich sein da die räuber sich ja
%ändern

mdl = "A1";
open_system(mdl);
figure;

for i = 1:length(x10_AB)
    aktuellerWert = x10_AB(i);
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(e));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(f));
    % Simulation ausführen
    out = sim(mdl);
    
    % Plotten der Daten für Visualisierung
    subplot(length(x10_AB), 1, i);
    plot(out.simout.Time, out.beute.Data, 'r', 'DisplayName', 'Beute'); % Erstes Signal in Rot
    title(['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i)) ' mit Eigenkonkurrenz']);
    xlabel('Zeit (s)');
    ylabel('Ausgabe');
    xlim(xLimits);
    legend;
end

figure;

for i = 1:length(x10_AB)
    aktuellerWert = x10_AB(i);
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(e));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(f));

    % Simulation ausführen
    out = sim(mdl);
    subplot(length(x10_AB), 1, i);
    plot(out.simout.Time, out.raeuber.Data, 'b', 'DisplayName', 'Räuber');  % Zweites Signal in Blau
    title(['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i)) ' mit Eigenkonkurrenz']);
    xlabel('Zeit (s)');
    ylabel('Ausgabe');
    xlim(xLimits);
    legend;
end

figure;

for i = 1:length(x10_AB)
    aktuellerWert = x10_AB(i);
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(e));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(f));
    % Simulation ausführen
    out = sim(mdl);
    
    % Plotten der Daten für Visualisierung
    plot(out.raeuber.Data, out.beute.Data, 'DisplayName', ['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i))]); % Erstes Signal in Rot
    hold on;
end
    plot(0,0,"or", DisplayName="Triviale Ruhelage")
    plot(0, a/e,"or", DisplayName="Ruhelage")
    plot((a*d-e*c)/(e*f+b*d), (a*f+b*c)/(e*f+b*d), "or", DisplayName="Ruhelage")
    title('Phasen mit Eigenkonkurrenz');
    xlabel('Räuber');
    ylabel('Beute');
    legend;
    hold off;

figure;


for i = 1:length(x10_AB)
    aktuellerWert = x10_AB(i);
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(0));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(0));
    % Simulation ausführen
    out = sim(mdl);
    
    % Plotten der Daten für Visualisierung
    subplot(length(x10_AB), 1, i);
    plot(out.simout.Time, out.beute.Data, 'r', 'DisplayName', 'Beute'); % Erstes Signal in Rot
    title(['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i)) ' ohne Eigenkonkurrenz']);
    xlabel('Zeit (s)');
    ylabel('Ausgabe');
    xlim(xLimits);
    legend;
end

figure;

for i = 1:length(x10_AB)
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(0));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(0));

    % Simulation ausführen
    out = sim(mdl);
    subplot(length(x10_AB), 1, i);
    plot(out.simout.Time, out.raeuber.Data, 'b', 'DisplayName', 'Räuber');  % Zweites Signal in Blau
    title(['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i)) ' ohne Eigenkonkurrenz']);
    xlabel('Zeit (s)');
    ylabel('Ausgabe');
    xlim(xLimits);
    legend;
end

figure;

for i = 1:length(x10_AB)
    aktuellerWert = x10_AB(i);
    set_param('A1/Beute_AB:x_10', 'InitialCondition', num2str(x10_AB(i)));
    set_param('A1/Räuber_AB:x_20', 'InitialCondition', num2str(x20_AB(i)));
    set_param('A1/Eigenkonkurrenz_Beute_(e)', 'Gain', num2str(0));
    set_param('A1/Eigenkonkurrenz_Räuber_(f)', 'Gain', num2str(0));
    % Simulation ausführen
    out = sim(mdl);
    
    % Plotten der Daten für Visualisierung
    plot(out.beute.Data, out.raeuber.Data, 'DisplayName', ['x10 AB = ', num2str(x10_AB(i)) ' und x20 AB = ', num2str(x20_AB(i))]); % Erstes Signal in Rot
    hold on;
end
    title('Phasen ohne Eigenkonkurrenz');
    xlabel('Räuber');
    ylabel('Beute');
    legend;
    hold off;