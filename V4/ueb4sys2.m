% *****************************************************************
% ueb4sys2.m 
% Function - File zur
% Systemdefinition des Systems xdotdot + x = 0 im Zustandsraum
function xdot = ueb4sys2(t, x)
xdot(1) = x(2);
xdot(2) = -x(1);