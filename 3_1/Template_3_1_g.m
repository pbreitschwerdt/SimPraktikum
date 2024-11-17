%% Caompare three different methods of calculating eigenvalues
run('Init.m');

% Define linearization point of states
x0 = [0; 0; 0; 0];
s = x0(1);
sd = x0(2);
theta = x0(3);
thetad = x0(4);
% Define linearization point of input
Fext = 0;


% Get initial parameters
M = param.M;
m = param.m;
g = param.g;
sigma = param.sigma;
l = param.l;

%-------------------------------------------------------------------------
% Get eigenvalues from explicic symbolic derivation of the eigenvalues via
% the corresponding function 

% Calculate eigenvalues 
eigValSyms = eigVal_A(..);

%-------------------------------------------------------------------------
% Get eigenvalues from symbolic derivation of the A matrix

% Calculate eigenvalues 
eigValSymsA = eig(..);

%-------------------------------------------------------------------------
% Get eigenvalues via A matrix from simulink model

disp('Get linearized matrices from simulink model...');

% Get linearized matrices from simulink model
[..] = linmod('..');

disp('Linearized matrices calculated');

% Calculate eigenvalues 
eigValSimulink = eig(..);


% Plot imaginary part over real part
figure(); grid on; hold on;
plot(real(eigValSyms), imag(eigValSyms), 'x');
plot(real(eigValSymsA), imag(eigValSymsA), 'o');
plot(real(eigValSimulink), imag(eigValSimulink), '*');
xlabel('Re(\lambda)');
ylabel('Im(\lambda)');

