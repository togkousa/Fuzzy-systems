function [model_4, train_error_4, chkFIS_4, cv_error_4] = create_model_4(D_trn, D_val)
%% In order to organize code in a better way

% Initialization
model_4 = genfis1(D_trn, 3, 'gbellmf', 'linear');

% Parameters - Train - Validation
opt = anfisOptions('InitialFIS', model_4, 'EpochNumber', 400, 'ValidationData', D_val);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;

[model_4, train_error_4, ~, chkFIS_4, cv_error_4] = anfis(D_trn, opt);


end