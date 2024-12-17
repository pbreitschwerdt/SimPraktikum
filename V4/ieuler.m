% ieuler.m
% Matlab function file integrating a system of differential equations
% using an Euler algorithm.

function [tout, yout] = ieuler(FunFcn, t0, tfinal, y0, stpsize)

% [t,x] = iruku4(@ueb4sys2, t0, tsim, x0, h)

% DESCRIPTION:
% euler('fun', T0, Tfinal, Y0, stpsize) integrates the system
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
% T  - Returned integration time points (column-vector).
% Y  - Returned solution, one solution row-vector per tout-value.
% The result can be displayed by: plot(tout, yout).
%
% J. Loeffler, 09/09/93 and MathWorks, Inc.
% Copyright (c) 1987 by the MathWorks, Inc.
% All rights reserved.

if nargin < 5, stpsize=0.01; end

% Initialization
t = t0;
h = stpsize;
y = y0(:);
tout = t;
yout = y';

% main loop
while (t < tfinal)
    if t + h > tfinal, h = tfinal - t; end
    s1 = feval(FunFcn, t, y);
    % Transponieren, falls FunFcn Zeilenvektor statt Spaltenvektor liefert
    s1 = s1(:);
    ynew = y + h*s1;
    % Update the solution
    t = t + h;
    y = ynew;
    tout = [tout; t];
    yout = [yout; y'];
end

   








