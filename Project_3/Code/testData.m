function [error_mat, mse_mat, rmse_mat, Rsq, nmse_mat, ndei_mat] = testData(model_1, model_2, model_3, model_4, D_chk)
%% Testing data
out_1 = evalfis(D_chk(:,1:4), model_1);
out_2 = evalfis(D_chk(:,1:4), model_2);
out_3 = evalfis(D_chk(:,1:4), model_3);
out_4 = evalfis(D_chk(:,1:4), model_4);

% Errors
error_1 = out_1(:) - D_chk(:,5);
error_2 = out_2(:) - D_chk(:,5);
error_3 = out_3(:) - D_chk(:,5);
error_4 = out_4(:) - D_chk(:,5);
error_mat = [error_1 error_2 error_3 error_4];

% Mse's & Rmse's
mse_1 = (1 / length(error_1)) * sum(error_1.^2);
mse_2 = (1 / length(error_2)) * sum(error_2.^2);
mse_3 = (1 / length(error_3)) * sum(error_3.^2);
mse_4 = (1 / length(error_4)) * sum(error_4.^2);
mse_mat = [mse_1; mse_2; mse_3; mse_4];
rmse_mat = sqrt(mse_mat);

% R^2 coefficient
yhat = mean(D_chk(:,5));
Rsq_1 = 1 - (sum(error_1.^2)/sum((D_chk(:,5) - yhat).^2));
Rsq_2 = 1 - (sum(error_2.^2)/sum((D_chk(:,5) - yhat).^2));
Rsq_3 = 1 - (sum(error_3.^2)/sum((D_chk(:,5) - yhat).^2));
Rsq_4 = 1 - (sum(error_4.^2)/sum((D_chk(:,5) - yhat).^2));
Rsq = [Rsq_1; Rsq_2; Rsq_3; Rsq_4];

% Nmse's and Ndei's
nmse_1 = (sum(error_1.^2)/sum((D_chk(:,5) - yhat).^2)); 
nmse_2 = (sum(error_2.^2)/sum((D_chk(:,5) - yhat).^2)); 
nmse_3 = (sum(error_3.^2)/sum((D_chk(:,5) - yhat).^2)); 
nmse_4 = (sum(error_4.^2)/sum((D_chk(:,5) - yhat).^2)); 
nmse_mat = [nmse_1; nmse_2; nmse_3; nmse_4];
ndei_mat = sqrt(nmse_mat);

%% Plottings of errors
figure;
subplot(2,2,1);
plot(error_1);
title('TSK model 1')

subplot(2,2,2);
plot(error_2);
title('TSK model 2')

subplot(2,2,3);
plot(error_3);
title('TSK model 3')

subplot(2,2,4);
plot(error_4);
title('TSK model 4')
 
suptitle('Prediction Errors of models');
saveas(gcf,'Results/Prediciton_Errors.png');

save performance_index.mat error_mat mse_mat rmse_mat Rsq nmse_mat ndei_mat

end