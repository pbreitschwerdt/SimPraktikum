% iadams.m
% Matlab function file integrating a system of differential equations
% using an 2nd order Adams-Bashforth algorithm.

function [tout, yout] = iadams(FunFcn, t0, tfinal, y0, stpsize)

% DESCRIPTION:
% iadams('fun', T0, Tfinal, Y0, stpsize) integrates the system
% of ordinary differential equations described by the M-file
% FUN.M over the interval T0 to Tfinal, using initial conditions
% Y0 with a step size defined by stpsize. An euler algorithm
% is used to integrate the initial step.
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
fold = feval(FunFcn, t, y);
fold = fold(:);
tout = t;
yout = y';
% euler integration for initial step
estpsize = stpsize/10;
etfinal = t0+h;
[et,eresult] = ieuler(FunFcn, t0, etfinal, y0(:), estpsize);
y = eresult(end,:)';
tout = [tout; etfinal];
yout = [yout; y'];
t = etfinal;
% main loop Adams-Bashforth algorithm
while (t < tfinal)
    if t + h > tfinal, h = tfinal - t; end
    s1 = feval(FunFcn, t, y(:));
    s1 = s1(:);
    s2 = fold;
    f = y + h/2*(3*s1-s2);
    % Update the solution
    t = t + h;
    y = f;
    fold = s1;
    tout = [tout; t];
    yout = [yout; y'];
end










