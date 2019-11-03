%% Fuzzy systems Project 4 - Part 1
% Togkousidis Anastasios
% AEM: 8920

%% Initialization
clc; clear;

%% Part 1 - Defining data sets
% Loading
% data = load('avila.dat');
% [D_trn, D_val, D_chk] = splitData(data);
% 
load data;
load D_trn;
load D_val;
load D_chk;
 

%% Part 2 - Training
% Models
nr = [2;3;4;5;6];
randii_values = 0.09:0.005:0.5;

% Finding suitable randiis
% centers = find_centers(D_trn(:,1:end-1),randii_values);
% randii = match_randii_vals(centers, nr, randii_values);
% save randii.mat randii
% save D_trn.mat D_trn
% save D_val.mat D_val
% save D_chk.mat D_chk
load randii.mat


% Models
[model_1, train_error_1, finalfis1, cv_error_1] = create_model(D_trn, D_val, randii(1));
[model_2, train_error_2, finalfis2, cv_error_2] = create_model(D_trn, D_val, randii(2));
[model_3, train_error_3, finalfis3, cv_error_3] = create_model(D_trn, D_val, randii(3));
[model_4, train_error_4, finalfis4, cv_error_4] = create_model(D_trn, D_val, randii(4));
[model_5, train_error_5, finalfis5, cv_error_5] = create_model(D_trn, D_val, randii(5));

%% Part 3 - Results
predout1 = evalfis(D_chk(:, 1:end-1), finalfis1);
predout2 = evalfis(D_chk(:, 1:end-1), finalfis2);
predout3 = evalfis(D_chk(:, 1:end-1), finalfis3);
predout4 = evalfis(D_chk(:, 1:end-1), finalfis4);
predout5 = evalfis(D_chk(:, 1:end-1), finalfis5);

% Round
predout1 = round(predout1);
predout2 = round(predout2);
predout3 = round(predout3);
predout4 = round(predout4);
predout5 = round(predout5);

%% Part 4 - Plot and save Learning Curves
plotLearningCurves(train_error_1, cv_error_1,...
                    train_error_2, cv_error_2,...
                    train_error_3, cv_error_3,...
                    train_error_4, cv_error_4,...
                    train_error_5, cv_error_5);

%% Part 5 - plot MFs
plotMemberFun(finalfis1,finalfis2,finalfis3, finalfis4, finalfis5);


%% Part 6 - Measure Error
% Error Matrix
error_mat_1 = create_error_mat(D_chk, predout1);
error_mat_2 = create_error_mat(D_chk, predout2);
error_mat_3 = create_error_mat(D_chk, predout3);
error_mat_4 = create_error_mat(D_chk, predout4);
error_mat_5 = create_error_mat(D_chk, predout5);

Error_mat = [];
Error_mat(1).error_mat = error_mat_1;
Error_mat(2).error_mat = error_mat_2;
Error_mat(3).error_mat = error_mat_3;
Error_mat(4).error_mat = error_mat_4;
Error_mat(5).error_mat = error_mat_5;

% OA
N = size(D_chk,1);
OA_1 = ( 1/N ) * trace(error_mat_1);
OA_2 = ( 1/N ) * trace(error_mat_2);
OA_3 = ( 1/N ) * trace(error_mat_3);
OA_4 = ( 1/N ) * trace(error_mat_4);
OA_5 = ( 1/N ) * trace(error_mat_5);
OA = [OA_1; OA_2; OA_3; OA_4; OA_5];

% UA, PA and k
[UA_1, PA_1, k_1] = other_error_metrics(error_mat_1, N);
[UA_2, PA_2, k_2] = other_error_metrics(error_mat_2, N);
[UA_3, PA_3, k_3] = other_error_metrics(error_mat_3, N);
[UA_4, PA_4, k_4] = other_error_metrics(error_mat_4, N);
[UA_5, PA_5, k_5] = other_error_metrics(error_mat_5, N);

UA_struct = [];
UA_struct(1).UA = UA_1;
UA_struct(2).UA = UA_2;
UA_struct(3).UA = UA_3;
UA_struct(4).UA = UA_4;
UA_struct(5).UA = UA_5;

PA_struct = [];
PA_struct(1).PA = PA_1;
PA_struct(2).PA = PA_2;
PA_struct(3).PA = PA_3;
PA_struct(4).PA = PA_4;
PA_struct(5).PA = PA_5;

kmat = [k_1; k_2; k_3; k_4; k_5];

%For the constant ones
save error_mat_const.mat Error_mat 
save OA_const.mat OA
save UA_const.mat UA_struct
save PA_const.mat PA_struct
save kmat_const.mat kmat

