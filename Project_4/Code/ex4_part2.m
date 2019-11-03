%% Fuzzy systems Project 4 - Part 2
% Togkousidis Anastasios
% AEM: 8920

%% Initialization
clc; clear;

%% Part 1 - Defining data sets
% Loading
data = readtable('isolet.dat');
data = table2array(data);
data = data(randperm(size(data, 1)), :);

[m,n] = size(data);

% Setting training, validation and test set
N1 = floor(0.6*m);
N2 = floor(0.8*m);
D_trn = data(1:N1,:);
D_val = data((N1+1):N2, :);
D_chk = data((N2+1):end, :);

%% Part 2 - Training and Cross validation
nf = [3; 6; 9; 12];
randii_values = 0.18:0.04:0.34;

% Sorting features
% [ranks, weights] = relieff( data(:,1:end-1) ,data(:,end), 20);
% save ranks

load ranks.mat
data_ranked = data(:,ranks);

% 5 fold cross validation
cv_5fold_mat = cv_5fold(randii_values, nf, D_trn, ranks);
save cv_5fold_mat.mat cv_5fold_mat;

% Find optimum option
% load error_mat;
mymin = min(min(cv_5fold_mat));
[row,col] = find(cv_5fold_mat == mymin);
nf_opt = nf(row);
randii_opt = randii_values(col);
save n_optimal.mat nf_opt randii_opt


%% Part 3 - Re-training for optimal values
load n_optimal.mat
Dtrn = D_trn(:,ranks(1:nf_opt));
Dval = D_val(:,ranks(1:nf_opt));
Dchk = D_chk(:,ranks(1:nf_opt));

Dtrn = [Dtrn D_trn(:,end)];
Dval = [Dval D_val(:,end)]; 
Dchk = [Dchk D_chk(:,end)]; 

% System
fismat = genfis2(Dtrn(:,1:end-1), Dtrn(:,end),randii_opt);
for i = 1:size(fismat.output(1).mf,2)
    fismat.output(1).mf(i).type = 'constant' ;
    fismat.output(1).mf(i).params= 2.5;
end
% opt = anfisOptions('InitialFIS', fismat, 'EpochNumber', 200, 'ValidationData', Dval);
opt = anfisOptions('InitialFIS', fismat);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;

% Training
[fis,error,~,fisopt,val_error] = anfis(Dtrn,fismat,100,[0 0 0 0],Dval);

% Testing
predout = evalfis(Dchk(:, 1:end-1), fisopt);
predout = round(predout);

%% Plottings
% Plot learning curve
figure;
plot(1:length(error),[error(:) val_error(:)]);
title('Learning Curve');
legend('Training','Cross Validation');
saveas(gcf,'Results_2/model_2_Error.png');

% Plot Prediction and real values
figure
plot(predout,'*'); hold on;
plot(Dchk(:,end),'*');
title('Estimated and Actual values');
legend('Estimations', 'Actual');
saveas(gcf,'Results_2/model_2_Estimations_Actual.png');

%% Error metrics
error_mat_1 = create_error_mat(Dchk, predout);
N = size(Dchk,1);
OA_1 = ( 1/N ) * trace(error_mat_1);
[UA_1, PA_1, k_1] = other_error_metrics(error_mat_1, N);

save results2.mat error_mat_1 OA_1 UA_1 PA_1 k_1



%% Plotting membership functions

% Plot initial and final fuzzy set - Have to fix this one
figure;
subplot(3,1,1);
[xout,yout] = plotmf(fismat, 'input', 1);
plot(xout(:,1),yout(:,1)); hold on;
[xout,yout] = plotmf(fisopt, 'input', 1);
plot(xout(:,1),yout(:,1));
legend('Initial', 'Final');
title('Input 1 - MF 5');

subplot(3,1,2);
[xout,yout] = plotmf(fismat, 'input', 2);
plot(xout(:,2),yout(:,2)); hold on;
[xout,yout] = plotmf(fisopt, 'input', 2);
plot(xout(:,2),yout(:,2))
legend('Initial', 'Final')
title('Input 2 - MF 2')

subplot(3,1,3);
[xout,yout] = plotmf(fismat, 'input', 3);
plot(xout(:,3),yout(:,3)); hold on;
[xout,yout] = plotmf(fisopt, 'input', 3);
plot(xout(:,3),yout(:,3))
legend('Initial', 'Final')
title('Input 3 - MF 3')

suptitle('Membership functions')
saveas(gcf,'Results_2/MF_before_after.png');


