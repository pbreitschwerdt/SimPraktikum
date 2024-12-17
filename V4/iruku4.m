function [tout, yout] = iruku4(FunFcn, t0, tfinal, y0, stpsize)

% DESCRIPTION:
% ruku('fun', T0, Tfinal, Y0, stpsize) integrates the system
% of ordinary differential equations described by the M-file
% FUN.M over the interval T0 to Tfinal and using initial
% conditions Y0 with a step size defined by stpsize.
%
% INPUT:
% FunFcn  - String containing name of user-supplied problem description.
%           Call: yprime = fun(t,y) where FunFcn = 'fun'.
%           t      - Time (scalar).
%           y      - Solution column-vector.
%           yprime - Returned derivative column-vector; yprime(i) = dy(i)/dt.
% t0      - Initial value of t.
% tfinal  - Final value of t.
% y0      - Initial value column-vector.
% stpsize - Desired step size
%
% OUTPUT:
% tout - Returned integration time points (column-vector).
% yout - Returned solution, one solution row-vector per tout-value.
% The result can be displayed by: plot(tout, yout).
%
% Initialization
if nargin < 5, stpsize = 0.01; end

t = t0;
h = stpsize;
y = y0(:);
tout = t;
yout = y';

% Main loop
while (t < tfinal)
    if t + h > tfinal
        h = tfinal - t; % Adjust last step size
    end

    % Berechnung der Steigungen
    s1 = feval(FunFcn, t, y);
    s1 = s1(:);
    s2 = feval(FunFcn, t + h/2, y + h/2 * s1);
    s2 = s2(:);
    s3 = feval(FunFcn, t + h/2, y + h/2 * s2);
    s3 = s3(:);
    s4 = feval(FunFcn, t + h, y + h * s3);
    s4 = s4(:);

    % Runge-Kutta Schritt
    ynew = y + h/6 * (s1 + 2*s2 + 2*s3 + s4);

    % Update
    t = t + h;
    y = ynew;
    tout = [tout; t];
    yout = [yout; y'];
end


