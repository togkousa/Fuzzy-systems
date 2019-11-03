%% Fuzzy systems Project 1
% Togkousidis Anastasios
% AEM: 8920

%% Initialization
clc; clear;

%% Part 1 - Parameters
p1 = 0.1;
p2 = 10;
c = 0.15;
tr = 0.6; 
p_min = 1/tr;

%% Part 2 - System and Root locus - Classic controller
% Creating transfer function
denominator = poly([0 -p1 -p2]);
sys_open_loop = tf([1 c], denominator);
[r,k] = rlocus(sys_open_loop);

% For plotting reasons
figure;
rlocus(sys_open_loop);

%% Select gain from diagramm
% find gain K 
gain = 60;
kp = gain / 25;
ki = 0.15*kp;

% closed loop systam
sys2 = gain*sys_open_loop;
sys_closed_loop = feedback(sys2, 1,-1);

%% Part 4 - Simulation
time = (0:0.01:5)';
u = 50*ones(length(time),1);
y = lsim(sys_closed_loop, u, time);
figure;
lsim(sys_closed_loop, u, time);
stepinfo(y,time)

%% Part 5 - Fuzzy controller
time = (0:0.01:5)';
clear controller

% Initialize FZ - PI
controller = create_fz_pi();

% Plotting
figure;
plotmf(controller, 'input' , 1);
title('Membership Functions of E');

figure;
plotmf(controller, 'input' , 2);
hl = title('Membership Functions of $\dot{E}$');
set(hl, 'Interpreter', 'latex');

figure;
plotmf(controller, 'output' , 1);
hl = title('Membership Functions of $\dot{U}$');
set(hl, 'Interpreter', 'latex');

% Adding rules
controller = add_rules_fuzzy(controller);

%% Part 6 - System Simulation
close all;
clc;
% Steady state matrices
[A,B,C,D] = tf2ss(25, poly([-0.1 -10]));
time = (0:0.01:5)';

% Set initial values
ke = 1;
a = 1;
kd = a*ke;
k1 = 2.4;

% Adapted variables
ke = 1.2;
k1 = 18;
a = 0.27;
kd = a*ke;

% % system solve
initialvector = [0;0];
y_fuz = numerical_solution(time,initialvector,A,B,C,controller,ke,kd,k1,@input_one);

% Plotting
figure;
plot(time, [y y_fuz]);
legend('Classic controller', 'Fuzzy controller');
title('Classic PI vs Fuzzy PI controller');
xlabel('Time');

fprintf('Displaying charachteristics of classic controller: \n');
stepinfo(y, time)

fprintf('Displaying charachteristics of fuzzy controller: \n');
stepinfo(y_fuz, time)


%% Part 7 - System operation when e is PS and dE is PS

ruleview(controller);

%% Part 8 - gensurf
figure;
gensurf(controller)
title('3D output surface of FZ-PI');

%% Part 9 - Different inputs
time = (0:0.01:20);
r2 = input_two_classic(time);
r3 = input_three_classic(time);

y2 = lsim(sys_closed_loop, r2, time);
y3 = lsim(sys_closed_loop, r3, time);

y_fuz2 = numerical_solution(time,initialvector,A,B,C,controller,ke,kd,k1,@input_two);
y_fuz3 = numerical_solution(time,initialvector,A,B,C,controller,ke,kd,k1,@input_three);


figure;
plot(time, r2(:), 'b',time, y2(:), 'g', time, y_fuz2(:),'r');
legend('Reference signal', 'Classic controller', 'Fuzzy controller');
title('Classic vs Fuzzy controller');

figure;
plot(time, r3(:), 'b',time, y3(:), 'g', time, y_fuz3(:),'r');
legend('Reference signal', 'Classic controller', 'Fuzzy controller');
title('Classic vs Fuzzy controller');