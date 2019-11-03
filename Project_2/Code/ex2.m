%% Fuzzy systems Project 2
% Togkousidis Anastasios
% AEM: 8920

%% Initialization
clc; clear;

%% Part 1 - Parameters
clear controller;

% Initialize controller and parameters
controller = create_fz_pi();

% Plotting
figure;
plotmf(controller, 'input' , 1);
title('Membership Functions of d_{h} and d_{v} ');

figure;
plotmf(controller, 'input' , 2);
title('Membership Functions of d_v');

figure;
plotmf(controller, 'input' , 3);
title('Membership Functions of ?');

figure;
plotmf(controller, 'output' , 1);
title('Membership Functions of ??');

% Adding rules
controller = add_rules_fuzzy(controller);

%% Part 2 - Simulation
velocity = 0.05; % We want velocity for step dt
time = 0:1:200;
initial_position = [4.1; 0.3];
initial_theta = -90;
initial_vector = [initial_position; initial_theta];

% Simulation
out = numerical_solution(time,initial_vector,velocity,controller);
x = out(:,1);
y = out(:,2);
error = sqrt((x(end)-10)^2+(y(end)-3.2)^2)
%% plotting results
figure;

h1 = scatter(10,3.2,60,[0.6350 0.0780 0.1840],'x','LineWidth',3); hold on;
h2 = scatter(4.1,0.3,60,[0.9290, 0.6940, 0.1250],'x','LineWidth',3); hold on;
h3 = scatter(x,y,10, 'filled'); hold on;
h4 = line([5 5],[0 1],'Color', 'r');
h5 = line([5 6],[1 1],'Color', 'r');
h6 = line([6 6],[1 2],'Color', 'r');
h7 = line([6 7],[2 2],'Color', 'r');
h8 = line([7 7],[2 3],'Color', 'r');
h9 = line([7 11],[3 3],'Color', 'r');
set(get(get(h3,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h4,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h5,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h6,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h7,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h8,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h9,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
legend([h1 h2],'Final Point','Initial Point');
xlim([0,11]);
ylim([0 4]);
title('Route for ?_{0} = -90');

%% Part 3 - Changing Parameters
clear controller;

% Initialize controller and parameters
controller = create_fz_pi_2();

% Plotting
figure;
plotmf(controller, 'input' , 1);
title('Membership Functions of d_{h}');


figure;
plotmf(controller, 'input' , 2);
title('Membership Functions of d_v');

figure;
plotmf(controller, 'input' , 3);
title('Membership Functions of ?');

figure;
plotmf(controller, 'output' , 1);
title('Membership Functions of ??');

% Adding rules
controller = add_rules_fuzzy(controller);

%% Part 4 - Simulation
velocity = 0.05; % We want velocity for step dt
time = 0:1:200;
initial_position = [4.1; 0.3];
initial_theta = -90;
initial_vector = [initial_position; initial_theta];

% Simulation
out = numerical_solution(time,initial_vector,velocity,controller);
x = out(:,1);
y = out(:,2);
error = sqrt((x(end)-10)^2+(y(end)-3.2)^2)
%% plotting results
figure;
h1 = scatter(10,3.2,60,[0.6350 0.0780 0.1840],'x','LineWidth',3); hold on;
h2 = scatter(4.1,0.3,60,[0.9290, 0.6940, 0.1250],'x','LineWidth',3); hold on;
h3 = scatter(x,y,10, 'filled'); hold on;
h4 = line([5 5],[0 1],'Color', 'r');
h5 = line([5 6],[1 1],'Color', 'r');
h6 = line([6 6],[1 2],'Color', 'r');
h7 = line([6 7],[2 2],'Color', 'r');
h8 = line([7 7],[2 3],'Color', 'r');
h9 = line([7 11],[3 3],'Color', 'r');
set(get(get(h3,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h4,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h5,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h6,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h7,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h8,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h9,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
legend([h1 h2],'Final Point','Initial Point');
xlim([0,11]);
ylim([0 4]);
title('Route for ?_{0} = -90');
