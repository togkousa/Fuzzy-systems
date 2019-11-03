function controller = create_fz_pi()

% Initialize FZ - PI
controller = newfis('fis');

% Adding inputs
controller = addvar(controller,'input', 'E', [-1 1]);
controller = addvar(controller,'input', 'dE', [-1 1]);

% Adding outputs
controller = addvar(controller,'output', 'dU', [-1 1]);

% Adding rules - E
controller = addmf(controller,'input',1,'NV','trimf',[-1.25 -1 -0.75]);
controller = addmf(controller,'input',1,'NL','trimf', [-1 -0.75 -0.5]);
controller = addmf(controller,'input',1,'NM','trimf', [-0.75 -0.5 -0.25]);
controller = addmf(controller,'input',1,'NS','trimf', [-0.5 -0.25 0]);
controller = addmf(controller,'input',1,'ZR','trimf', [-0.25 0 0.25]);
controller = addmf(controller,'input',1,'PS','trimf', [0 0.25 0.5]);
controller = addmf(controller,'input',1,'PM','trimf', [0.25 0.5 0.75]);
controller = addmf(controller,'input',1,'PL','trimf', [0.5 0.75 1]);
controller = addmf(controller,'input',1,'PV','trimf', [0.75 1 1.25]);

% Adding rules - dE
controller = addmf(controller,'input',2,'NV','trimf',[-1.25 -1 -0.75]);
controller = addmf(controller,'input',2,'NL','trimf', [-1 -0.75 -0.5]);
controller = addmf(controller,'input',2,'NM','trimf', [-0.75 -0.5 -0.25]);
controller = addmf(controller,'input',2,'NS','trimf', [-0.5 -0.25 0]);
controller = addmf(controller,'input',2,'ZR','trimf', [-0.25 0 0.25]);
controller = addmf(controller,'input',2,'PS','trimf', [0 0.25 0.5]);
controller = addmf(controller,'input',2,'PM','trimf', [0.25 0.5 0.75]);
controller = addmf(controller,'input',2,'PL','trimf', [0.5 0.75 1]);
controller = addmf(controller,'input',2,'PV', 'trimf', [0.75 1 1.25]);

% Adding rules - dU
controller = addmf(controller,'output',1,'NV','trimf',[-1.25 -1 -0.75]);
controller = addmf(controller,'output',1,'NL','trimf', [-1 -0.75 -0.5]);
controller = addmf(controller,'output',1,'NM','trimf', [-0.75 -0.5 -0.25]);
controller = addmf(controller,'output',1,'NS','trimf', [-0.5 -0.25 0]);
controller = addmf(controller,'output',1,'ZR','trimf', [-0.25 0 0.25]);
controller = addmf(controller,'output',1,'PS','trimf', [0 0.25 0.5]);
controller = addmf(controller,'output',1,'PM','trimf', [0.25 0.5 0.75]);
controller = addmf(controller,'output',1,'PL','trimf', [0.5 0.75 1]);
controller = addmf(controller,'output',1,'PV', 'trimf', [0.75 1 1.25]);


end