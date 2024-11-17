clear all; close all; clc;

% Add path
addpath(genpath('functions'));

% Run script of exercise 3.1 a
run('Template_3_1_a');

% Define state vector, input and parameter vector
x = [s; sd; theta; thetad];
u = Fext;
p = [m; M];

% Linearize nonlinear ODE
% Use state vector, input and parameter vector from above definition
A = jacobian(..);
B = jacobian(..);
C = jacobian(..);
% Calculate jacobian for sensitivity ode. See excercise 3.1 from lecture
P = jacobian(..);

% Calculate eigenvalues of A matrix
eigVal = eig(..);


disp('Save functions...');
% Save functions
% Bridge crane ODE
matlabFunction(..,'File','functions/bridgeCrane_f','Outputs',{'xd'});
% Bridge crane output function
matlabFunction(..,'File','functions/bridgeCrane_h','Outputs',{'y'});
% Linearized matrix A
matlabFunction(..,'File','functions/jacobian_A','Outputs',{'A'});
% Linearized matrix B
matlabFunction(..,'File','functions/jacobian_B','Outputs',{'B'});
% Linearized matrix C
matlabFunction(..,'File','functions/jacobian_C','Outputs',{'C'});
% Eigenvalues
matlabFunction(..,'File','functions/eigVal_A','Outputs',{'eigVal'});
% Linearized matrix P
matlabFunction(..,'File','functions/jacobian_P','Outputs',{'P'});
disp('Functions saved');
