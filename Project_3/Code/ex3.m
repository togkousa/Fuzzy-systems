%% Fuzzy systems Project 3
% Togkousidis Anastasios
% AEM: 8920

%% Initialization
clc; clear;

%% Part 1 - Defining data sets
% Loading
data = load('CCPP.dat');
data = data(randperm(size(data, 1)), :);
[m,n] = size(data);

% Setting training, validation and test set
N1 = floor(0.6*m);
N2 = floor(0.8*m);
D_trn = data(1:N1,:);
D_val = data((N1+1):N2, :);
D_chk = data((N2+1):end, :);

%% Part 2 - Training
% Models
[model_1, train_error_1, chkFIS_1, cv_error_1] = create_model_1(D_trn, D_val);
[model_2, train_error_2, chkFIS_2, cv_error_2] = create_model_2(D_trn, D_val);
[model_3, train_error_3, chkFIS_3, cv_error_3] = create_model_3(D_trn, D_val);
[model_4, train_error_4, chkFIS_4, cv_error_4] = create_model_4(D_trn, D_val);

%% Plottings

% Plot trained Membership functions
plotMemberFun(model_1, model_2, model_3, model_4);

% Plotting learning curves
plotLearningCurves(train_error_1, cv_error_1, train_error_2, cv_error_2,...
    train_error_3, cv_error_3,train_error_4, cv_error_4);

% Testing
[error_mat, mse_mat, rmse_mat, Rsq, nmse_mat, ndei_mat] = ...
    testData(model_1, model_2, model_3, model_4, D_chk);
