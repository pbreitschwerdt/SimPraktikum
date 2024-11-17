%% Calculate eigenvalues of system depending on length of rope
run('Init.m');

% Define linearization point of states
x0 = [0; 0; 0; 0];
s = x0(1);
sd = x0(2);
theta = x0(3);
thetad = x0(4);
% Define linearization point of input
Fext = 0;

%% Calculate eigenvalues of A-Matrix from symbolic derivation
% Get parameters from struct
M = param.M;
m = param.m;
g = param.g;
sigma = param.sigma;

% Define vector of rope length
l = [..];

% Initialize size of matrix with eigenvalues
eigVal = zeros(4,length(l));

for i=1:length(l)

    % Calculate eigenvalues from fuction derived symbolically
    eigVal(:,i) = eigVal_A(..);

end
 
% Plot real and imaginary part of eigenvalues over length l
figure();
subplot(4,1,1); grid on; hold on;
% Plot real part of third eigenvalue over length l
plot(l,..);
xlabel('length in m');
ylabel('Re(\lambda)');
subplot(4,1,2); grid on; hold on;
% Plot imaginary part of third eigenvalue over length l
plot(l,..);
xlabel('length in m');
ylabel('Im(\lambda)');
subplot(4,1,3); grid on; hold on;
% Plot real part of forth eigenvalue over length l
plot(l,..);
xlabel('length in m');
ylabel('Re(\lambda)');
subplot(4,1,4); grid on; hold on;
% Plot imaginary part of forth eigenvalue over length l
plot(l,..);
xlabel('length in m');
ylabel('Im(\lambda)');

% Plot imaginary part over real part
figure(); grid on; hold on;
% Plot third imaginary part over third real part
plot(.., .., 'x');
% Plot forth imaginary part over forth real part
plot(.., .., 'x');
xlabel('Re(\lambda)');
ylabel('Im(\lambda)');
ylim([-5 5]);
xlim([-10 0]);

