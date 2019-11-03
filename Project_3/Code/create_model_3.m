function [model_3, train_error_3, chkFIS_3, cv_error_3] = create_model_3(D_trn, D_val)
%% In order to organize code in a better way

% Initialization
model_3 = genfis1(D_trn, 2, 'gbellmf', 'linear');

% Parameters - Train - Validation
opt = anfisOptions('InitialFIS', model_3, 'EpochNumber', 400, 'ValidationData', D_val);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;

[model_3, train_error_3, ~, chkFIS_3, cv_error_3] = anfis(D_trn, opt);


end