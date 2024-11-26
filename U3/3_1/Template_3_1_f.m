%% Calculate steady states of simulink model
run('Init.m');

% Define initial conditions to find the lower steady position of the
% pendulum
x0 = [..];
[x_s_lo, ~, ~, ~] = trim('..', x0); % Lower

% Define initial conditions to find the upper steady position of the
% pendulum
x0 = [..];

[x_s_up, ~, ~, ~] = trim('..', x0); % Upper
