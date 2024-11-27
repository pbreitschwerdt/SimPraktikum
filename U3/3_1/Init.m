% Setup parameters and path for simulation
clear all; close all; clc;

% Add path to functions
addpath('functions');
% Add path to parameter 
addpath('parameter');

% Run file with parameters
run('parameterBridgeCrane')



% Set initial conditions for integrator
%x0 = [0; 0; 20*pi/180; 0];

% d)
x0 = [0; 0; 170*pi/180; 0];

% Initial conditions for sensitivity ODE
xp0 = zeros(4,2);