clear all
close all
clc

%% Set parameters
L = 1;                  % m
K = 2;                  % m/rad
phi_bar = 5/360*2*pi ;  % rad
%
T = 0.2;
D = 0.1;
c = 0.5;

% initial conditions
q0 = 0.3;
q1 = -0.1;

%% Determine consistent initial conditions for the algebraic loop

residuum = @(phi_0, q0) atan((K*(phi_0-phi_bar)+2*q0)/L)-phi_0;
phi_0_init = [ -60*pi/180, -30*pi/180, 80*pi/180 ];
phi_0i = [0, 0, 990];

for i = 1:length(phi_0i)
        phi_0i(i) = fsolve(@(phi_0) residuum(phi_0, q0), phi_0_init(i));
end
u0 = K*(phi_0i-phi_bar);



% Visualize the solutions to "residuum"
phi_0  = 0.9*linspace(-pi/2,pi/2,1e4);
y1 = atan((K*(phi_0-phi_bar) + 2*q0)/L);
y2 = phi_0;

figure('color', 'w');
    plot(phi_0*360/(2*pi),y1,...
         phi_0*360/(2*pi),y2,...
         phi_0i*360/(2*pi),atan((K*(phi_0i-phi_bar) + 2*q0)/L),'kx','markersize',8,'linewidth',2);
    grid on;
    legend({'$y_1(\varphi_0) = \arctan\left(\frac{K(\varphi_0 - \bar\varphi) + 2q_0}{L}\right)$','$y_2(\varphi_0)=\varphi_0$','$\varphi_{0i}$'},'interpreter','latex','location','southeast','Fontsize',12)
    xlabel('Winkel $\varphi_0$','interpreter','latex')
    title('Startlösungen der algebraischen Schleife')

%% %% Animate simulations results

% run simulink model
sim('model_A3_2.slx');


% no changes necessary beyond this line
z = linspace(0,L,1e3);
t   = q_s.Time;
x_s = q_s.Data*z;                           % rigid body part (direct feedthrough)
x_e = q_e.Data*sqrt(2/L)*sin(pi/L*z)*L/pi;  % elastic part
u   = u.Data;
y   = phi.Data;
y_d = phi_des.Data;

figure(2)
for i = 1:10:length(t)
    if i == 1
        subplot(1,2,1)
            cla;
            hold on
            p1 = plot(z,x_e(i,:)+x_s(i,:),'k','linewidth',3.5);
            p2 = plot(z,x_s(i,:),'r--','linewidth',1);
            fill([-0.05,-0.05,0],[0.1,-0.1,0],'w','Linewidth',2.5);
            fill([-0.05,-0.05,-0.2,-0.2],[-1 1 1 -1],0.7*[1 1 1],'linestyle','none')
            fill([-0.05,-0.05],[-1 1],'k','linewidth',2.5);
            plot(0,0,'ko','linewidth',2.5,'markersize',6)
            xlim([-0.1,L])
            ylim([min(-0.2,floor(min(x_e(:)+x_s(:)))),max(0.2,ceil(max(x_e(:)+x_s(:))))])
            grid on;
            hold off;
            xlabel('Ort $z$','interpreter','latex');
            ylabel('Auslenkung $x(z,t)$','interpreter','latex');
            title('Visualisierung der Schwingung')
        subplot(1,2,2)
            cla;
            hold on;
            plot(t,y_d,'linewidth',2)
            plot(t,y,'linewidth',2);
            p3 = plot(t(i),y(i),'rx','linewidth',2.5);
            grid on;
            hold off;
            xlabel('Zeit $t$','interpreter','latex');
            ylabel('Winkel $\varphi(t)$','interpreter','latex');
            legend({'$\bar \varphi$','$\varphi(t)$'},'interpreter','latex')
            title('Zeitverlauf des Gelenkwinkels')
    else
        p1.YData = x_e(i,:)+x_s(i,:);
        p2.YData = x_s(i,:);
        p3.XData = t(i);
        p3.YData = y(i);
        drawnow;
    end
end