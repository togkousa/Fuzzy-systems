function plotLearningCurves(train_error_1, cv_error_1,...
                    train_error_2, cv_error_2,...
                    train_error_3, cv_error_3,...
                    train_error_4, cv_error_4,...
                    train_error_5, cv_error_5)
%% Learning Curves

figure;
plot(1:length(train_error_1),[train_error_1 cv_error_1]);
legend('Training Error', 'Cross Validation Error');
title('TSK model 1 - Learning curve');
saveas(gcf,'Results_1/TSK_1_LC_const.png');

figure;
plot(1:length(train_error_2),[train_error_2 cv_error_2]);
legend('Training Error', 'Cross Validation Error');
title('TSK model 2 - Learning curve');
saveas(gcf,'Results_1/TSK_2_LC_const.png');

figure;
plot(1:length(train_error_3),[train_error_3 cv_error_3]);
legend('Training Error', 'Cross Validation Error');
title('TSK model 3 - Learning curve');
saveas(gcf,'Results_1/TSK_3_LC_const.png');

figure;
plot(1:length(train_error_4),[train_error_4 cv_error_4]);
legend('Training Error', 'Cross Validation Error');
title('TSK model 4 - Learning curve');
saveas(gcf,'Results_1/TSK_4_LC_const.png');

figure;
plot(1:length(train_error_5),[train_error_5 cv_error_5]);
legend('Training Error', 'Cross Validation Error');
title('TSK model 5 - Learning curve');
saveas(gcf,'Results_1/TSK_5_LC_const.png');


end