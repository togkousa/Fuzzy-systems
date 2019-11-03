function controller = create_fz_pi_2()

% Initialize FZ - PI
controller = newfis('fis');

% Adding inputs
controller = addvar(controller,'input', 'dh', [0 1]);
controller = addvar(controller,'input', 'dv', [0 1]);
controller = addvar(controller,'input', 'theta', [-180 180]);

% Adding outputs
controller = addvar(controller,'output', 'dtheta', [-130 130]);

% Adding rules - dh
controller = addmf(controller,'input',1,'VS','trimf',[-0.25 0 0.25]);
controller = addmf(controller,'input',1,'S','trimf', [0 0.25 0.5]);
controller = addmf(controller,'input',1,'M','trimf', [0.25 0.5 0.75]);
controller = addmf(controller,'input',1,'L','trimf', [0.5 0.75 1]);
controller = addmf(controller,'input',1,'VL','trimf', [0.75 1 1.25]);

% Adding rules - dv
controller = addmf(controller,'input',2,'VS','trimf',[-0.2 0 0.2]);
controller = addmf(controller,'input',2,'S','trimf', [0.15 0.2 0.25]);
controller = addmf(controller,'input',2,'M','trimf', [0.2 0.5 0.8]);
controller = addmf(controller,'input',2,'L','trimf', [0.5 0.75 1]);
controller = addmf(controller,'input',2,'VL','trimf', [0.75 1 1.25]);

% Adding rules - theta
controller = addmf(controller,'input',3,'NL','trimf',[-270 -180 -90]);
controller = addmf(controller,'input',3,'NS','trimf', [-140 -70 0]);
controller = addmf(controller,'input',3,'ZE','trimf', [-30 0 30]);
controller = addmf(controller,'input',3,'PS','trimf', [0 70 140]);
controller = addmf(controller,'input',3,'PL','trimf', [90 180 270]);

% Adding rules - dtheta
controller = addmf(controller,'output',1,'Nl','trimf',[-195 -130 -65]);
controller = addmf(controller,'output',1,'NS','trimf', [-130 -65 0]);
controller = addmf(controller,'output',1,'ZE','trimf', [-30 0 30]);
controller = addmf(controller,'output',1,'PS','trimf', [0 65 130]);
controller = addmf(controller,'output',1,'PL','trimf', [65 130 195]);


end