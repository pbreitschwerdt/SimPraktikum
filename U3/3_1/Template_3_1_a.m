clear all; close all; clc;

%% Calculate ODE via external function
%   VF = EulerLagrange(L,X,Q_i,Q_e,R,par,varargin) uses the Lagrangian of a
%   system to derive its corresponding differential equations. The  
%   Lagrangian L needs to be defined symbolically in terms of the generalized 
%   coordinates and velocities X and system parameters par. Coordinates and
%   velocities need to be arranged in the form X = {q1 dq1 q2 dq2 ...}.
%   Q are the vectors of generalized forces. The Q_i are internal forces
%   and are functions of the generalized coordinates. Use the Q_e to 
%   describe external generalized forces that do not depend on the 
%   generalized coordinates but rather a yet to be determined control force
%   or torque, for example. R is the dissipation function as suggested by
%   Rayleigh. 
%
%   The function returns the vector field description of the derived
%   differential equations, VF, and the associated MATLAB function and 
%   Simulink block. The output is controlled by varargin, a cell array of 
%   strings:
%      'm':      create MATLAB function
%      's':      create Simulink block
%      filename: file name(s) for created output

% Add path
addpath(genpath('functions'));

% Define symbolic variables
syms s sd theta thetad Fext m M g l sigma

% Potential energy
E_pot = ..;
% Kinetic energy
E_kin = ..;

% Lagrange function
L = ..;


% Define generalized coordinates and velocities X
X   = {s sd theta thetad};
% Define internal forces and external generalized forces
Q_i = {0 -sigma*thetad}; Q_e = {Fext 0};
% Define parameters
par = {m M g l sigma};
% Define dissipation function
R   = {0 0};

disp('Generate ODE for bridge crane...');
% Euler lagrange formalism to derive the corresponding differential
% equations
f = EulerLagrange(L,X,Q_i,Q_e,R,par);
disp('ODE generated');

% Define output function
h = ..;

