function plotLearningCurves(train_error_1, cv_error_1,...
                    train_error_2, cv_error_2,...
                    train_error_3, cv_error_3,...
                    train_error_4, cv_error_4)
%% Learning Curves

figure;
subplot(2,2,1);
plot(1:length(train_error_1),[train_error_1 cv_error_1]);
legend('Training Error', 'Cross Validation Error');
title('TSK model 1');

subplot(2,2,2);
plot(1:length(train_error_2),[train_error_2 cv_error_2]);
legend('Training Error', 'Cross Validation Error');
title('TSK model 2');

subplot(2,2,3);
plot(1:length(train_error_3),[train_error_3 cv_error_3]);
legend('Training Error', 'Cross Validation Error');
title('TSK model 3');

subplot(2,2,4);
plot(1:length(train_error_4),[train_error_4 cv_error_4]);
legend('Training Error', 'Cross Validation Error');
title('TSK model 4');

suptitle('Learning Curves')
saveas(gcf,'Results/Learning_curves.png');


end