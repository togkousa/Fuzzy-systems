function [model_1, train_error_1, finalfis, cv_error] = create_model(D_trn, D_val, randii)
%% In order to organize code in a better way

% Initialization
fismat = genfis2(D_trn(:, 1:end-1), D_trn(:,end), randii);
 
% Change output MFs type from linear to constant and change parameters to constant value
for i = 1:size(fismat.output(1).mf,2)
    fismat.output(1).mf(i).type = 'constant' ;
    fismat.output(1).mf(i).params= 2.5;
end

% Parameters - Train - Validation
opt = anfisOptions('InitialFIS', fismat, 'EpochNumber', 400, 'ValidationData', D_val);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;

[model_1, train_error_1, ~ , finalfis, cv_error] = anfis(D_trn, opt);


end