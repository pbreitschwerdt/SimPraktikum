%% a)
clear all;
close all;

% tsim = 50 
% h = 0.2

tsim = 100;
xLimits = [0, tsim];
h = 0.2;

% Parameters
set_param('A2', 'Solver', 'ode113')

mdl = "A2";
%open_system(mdl);
out = sim(mdl);

% First subplot
hold on;
yyaxis left;
plot(out.simout.Time, out.simout.Data(:,1), 'DisplayName', 'mV')
title('Aufgabe 2a')
xlabel('Time in Months')
xlim(xLimits);
legend

% Second subplot




% Third subplot

plot(out.simout.Time, out.simout.Data(:,3), 'DisplayName', 'm')
xlim(xLimits);
% right
yyaxis right;
plot(out.simout.Time, out.simout.Data(:,2), 'DisplayName', 'p')
ylabel('p')
xlim(xLimits);

hold off;

%% b)

clear all;
close all;
tsim = 100;
xLimits = [0, tsim];


% Parameters
set_param('A2b', 'Solver', 'ode113')

mdl = "A2b";
%open_system(mdl);
out = sim(mdl);

% First subplot
hold on;
yyaxis left;
ylim([-2e4,2e4])
plot(out.simout.Time, out.simout.Data(:,1), 'DisplayName', 'mV')
title('Aufgabe 2b antizyklischer Anteil 50%')
xlabel('Time in Months')
xlim(xLimits);

% Second subplot

% Third antizyklisch
plot(out.simout.Time, out.simout.Data(:,3), 'DisplayName', 'm1')
xlim(xLimits);

% Fourth sublot zyklisch
plot(out.simout.Time, out.simout.Data(:,4), 'DisplayName', 'm2')
xlim(xLimits);

yyaxis right
ylim([-0.3,0.3])
plot(out.simout.Time, out.simout.Data(:,2), 'DisplayName', 'p')
xlim(xLimits);
legend;
grid on
hold off

figure;
mdl = "Ab2";
%open_system(mdl);
out = sim(mdl);

hold on
yyaxis left
ylim([-2e4,2e4])
plot(out.simout.Time, out.simout.Data(:,1), 'DisplayName', 'mV')
title('Aufgabe 2b antizyklischer Anteil 10%')
xlabel('Time in Months')
xlim(xLimits);


plot(out.simout.Time, out.simout.Data(:,3), 'DisplayName', 'm1')
xlim(xLimits);


% Fourth sublot zyklisch
plot(out.simout.Time, out.simout.Data(:,4), 'DisplayName', 'm2')
xlim(xLimits);

yyaxis right
ylim([-0.3,0.3])
plot(out.simout.Time, out.simout.Data(:,2), 'DisplayName', 'p')
xlim(xLimits);
legend;
grid on
hold off

%% c)

clear all;
close all;

tsim = 100;
xLimits = [0, tsim];
h = 0.2;

% Parameters
set_param('A2c', 'Solver', 'ode113')

mdl = "A2c";
%open_system(mdl);
out = sim(mdl);

% First subplot
hold on
yyaxis left
ylim([-2e4,2e4])
plot(out.simout.Time, out.simout.Data(:,3), 'DisplayName', 'm')
title('Aufgabe 2c')

xlim(xLimits);

plot(out.simout.Time, out.simout.Data(:,4), 'DisplayName', 'mL')
xlim(xLimits);

yyaxis right
ylim([-0.3,0.3])
plot(out.simout.Time, out.simout.Data(:,2), 'DisplayName', 'p')
xlim(xLimits);
legend
grid on
hold off