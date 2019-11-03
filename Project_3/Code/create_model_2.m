function [model_2, train_error_2, chkFIS_2, cv_error_2] = create_model_2(D_trn, D_val)
%% In order to organize code in a better way

% Initialization
model_2 = genfis1(D_trn, 3, 'gbellmf', 'constant');

% Parameters - Train - Validation
opt = anfisOptions('InitialFIS', model_2, 'EpochNumber', 400, 'ValidationData', D_val);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;

[model_2, train_error_2, ~, chkFIS_2, cv_error_2] = anfis(D_trn, opt);


end