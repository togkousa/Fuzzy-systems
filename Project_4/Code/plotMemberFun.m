function plotMemberFun(model_1, model_2, model_3, model_4, model_5)
%% Model 1
figure;
N = size(model_1.input,2);
for i = 1:N
    subplot(N,2,i);
    [x, mf] = plotmf(model_1, 'input',i);
    plot(x,mf);
end

suptitle('TSK model 1: Trained membership functions')
saveas(gcf,'Results_1/TSK1_membership_functions_const.png');

%% Model 2
figure;
N = size(model_2.input,2);
for i = 1:N
    subplot(N,2,i);
    [x, mf] = plotmf(model_2, 'input',i);
    plot(x,mf);
end

suptitle('TSK model 2: Trained membership functions')
saveas(gcf,'Results_1/TSK2_membership_functions_const.png');

%% Model 3
figure;
N = size(model_3.input,2);
for i = 1:N
    subplot(N,2,i);
    [x, mf] = plotmf(model_3, 'input',i);
    plot(x,mf);
end

suptitle('TSK model 3: Trained membership functions')
saveas(gcf,'Results_1/TSK3_membership_functions_const.png');

%% Model 4
figure;
N = size(model_4.input,2);
for i = 1:N
    subplot(N,2,i);
    [x, mf] = plotmf(model_4, 'input',i);
    plot(x,mf);
end

suptitle('TSK model 4: Trained membership functions')
saveas(gcf,'Results_1/TSK4_membership_functions_const.png');

%% Model 5
figure;
N = size(model_5.input,2);
for i = 1:N
    subplot(N,2,i);
    [x, mf] = plotmf(model_5, 'input',i);
    plot(x,mf);
end

suptitle('TSK model 5: Trained membership functions')
saveas(gcf,'Results_1/TSK5_membership_functions_const.png');


end
