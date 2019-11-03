%% Fuzzy systems Project 3
% Togkousidis Anastasios
% AEM: 8920

%% Initialization
clc; clear;

%% Part 1 - Defining data sets
% Loading
data = readtable('superconduct.csv');
data = table2array(data);
data = data(randperm(size(data, 1)), :);
data = data(1:10000,:);
[m,n] = size(data);

% % Normalization
% data = normalize(data,'range');

% Setting training, validation and test set
N1 = floor(0.6*m);
N2 = floor(0.8*m);
D_trn = data(1:N1,:);
D_val = data((N1+1):N2, :);
D_chk = data((N2+1):end, :);

%% Part 2 - Training and Cross validation
nf = [3;6;9;12];
nr = [3;6;9;12;15];

% Sorting features
%[ranks, weights] = relieff( data(:,1:end-1) ,data(:,end), 150);
load ranks.mat

% 5 fold cross validation
error_mat = cv_5fold(nr, nf, D_trn, ranks);
save error_mat.mat error_mat;

% Find optimum option
% load error_mat;
mymin = min(min(error_mat));
[row,col] = find(error_mat == mymin);
nf_opt = nf(row);
nr_opt = nr(col);

% Printing results
fprintf('Optimum combination (NF,NR) = (%d,%d) \n', nf_opt, nr_opt);

%% Part 3 - Re-training for optimal values
% nf_opt = 9;
% nr_opt = 12;

Dtrn = D_trn(:,ranks(1:nf_opt));
Dval = D_val(:,ranks(1:nf_opt));
Dchk = D_chk(:,ranks(1:nf_opt));

Dtrn = [Dtrn D_trn(:,end)];
Dval = [Dval D_val(:,end)]; 
Dchk = [Dchk D_chk(:,end)]; 

% initialize fuzzy system
opt = NaN(4,1); opt(4) = 0;
% Initialize fis
model = genfis3(Dtrn(:, 1:(end-1)),Dtrn(:,end),'sugeno',nr_opt,opt);
% Train FIS with Dtrn, Dval
opt = anfisOptions('InitialFIS', model, 'EpochNumber', 100, 'ValidationData', Dval);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;
[fis,error,~,fisopt,val_error]=anfis(Dtrn, opt);

% Plot learning curve
figure;
plot(1:length(error),[error(:) val_error(:)]);
title('Learning Curve');
legend('Training','Cross Validation');
saveas(gcf,'Results/model_2_Error.png');


% Predicting output - calculating error
out = evalfis(Dchk(:,1:end-1), fisopt);
prederror = Dchk(:,end) - out(:);

% %% Error metrics
% load error_mat;
% load performance_index;
% load ranks;
% load out;
%% Plottings
% Plot Prediction and real values
figure
plot(out,'*'); hold on;
plot(Dchk(:,end),'*');
title('Estimated and Actual values');
legend('Estimations', 'Actual');
saveas(gcf,'Results/model_2_Estimations_Actual.png');


% Plot initial and final fuzzy set - Have to fix this one
figure;
subplot(3,1,1);
[xout,yout] = plotmf(model, 'input', 1);
plot(xout(:,1),yout(:,1)); hold on;
[xout,yout] = plotmf(fisopt, 'input', 1);
plot(xout(:,1),yout(:,1));
legend('Initial', 'Final');
title('Input 1 - MF 5');

subplot(3,1,2);
[xout,yout] = plotmf(model, 'input', 2);
plot(xout(:,2),yout(:,2)); hold on;
[xout,yout] = plotmf(fisopt, 'input', 2);
plot(xout(:,2),yout(:,2))
legend('Initial', 'Final')
title('Input 2 - MF 2')

subplot(3,1,3);
[xout,yout] = plotmf(model, 'input', 3);
plot(xout(:,3),yout(:,3)); hold on;
[xout,yout] = plotmf(fisopt, 'input', 3);
plot(xout(:,3),yout(:,3))
legend('Initial', 'Final')
title('Input 3 - MF 3')

suptitle('Membership functions')
saveas(gcf,'Results/MF_before_after.png');


%% Error Metrics
error_1 = prederror;
mse = (1 / length(error_1)) * sum(error_1.^2);
rmse = sqrt(mse);
yhat = mean(D_chk(:,end));
Rsq = 1 - (sum(error_1.^2)/sum((D_chk(:,end) - yhat).^2));
nmse = (sum(error_1.^2)/sum((D_chk(:,end) - yhat).^2)); 
ndei = sqrt(nmse);

