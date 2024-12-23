% *****************************************************************
% ueb4sys3.m 
% Function - File zur Systemdefinition
% des Systems Automobilfederung im Zustandsraum
%
% Gleichungen:
% x1p = x2
% x2p = a2/m2(x3-x1) + d2/m2(x4-x2)
% x3p = x4
% x4p = a2/m1(x1-x3) + d2/m1(x2-x4) + a1/m1*(u-x3) 
% 
function xdot = ueb4sys3(t, x)
% Parameter
m1 = 25;     % Masse der Raeder
m2 = 250;    % Masse der Karosserie
a1 = 9e+4;   % Federkonstante 1
a2 = 3e+4;   % Federkonstante 2
d2 = 750;    % Daempferkonstante 
% Systemmatrix A
%% SELBST
A = [0,1,0,0;
    -a2/m2,-d2/m2,a2/m2,d2/m2;
    0,0,0,1;
    a2/m1,d2/m1,(-a1-a2)/m1,-d2/m1];
% Eingangsmatrix B
B = [0;0;0;a1/m1];
%% SELBST
% Eingangsgroesse u: Realisierung der Sprungfunktion
u = 1;
% Systemdynamik
xdot = A*x(:) + B*u;




