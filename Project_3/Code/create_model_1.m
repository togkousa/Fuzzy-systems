function [model_1, train_error_1, chkFIS_1, cv_error] = create_model_1(D_trn, D_val)
%% In order to organize code in a better way

% Initialization
model_1 = genfis1(D_trn, 2, 'gbellmf', 'constant');

% Parameters - Train - Validation
opt = anfisOptions('InitialFIS', model_1, 'EpochNumber', 400, 'ValidationData', D_val);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;

[model_1, train_error_1, ~ , chkFIS_1, cv_error] = anfis(D_trn, opt);


end