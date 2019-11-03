function plotMemberFun(model_1, model_2, model_3, model_4)
%% Model 1
figure;
subplot(2,2,1);
[x, mf] = plotmf(model_1, 'input',1);
plot(x,mf);
xlabel('T');

subplot(2,2,2);
[x,mf] = plotmf(model_1, 'input',2);
plot(x,mf);
xlabel('AP');

subplot(2,2,3);
[x,mf] = plotmf(model_1, 'input',3);
plot(x,mf);
xlabel('RH');

subplot(2,2,4);
[x, mf] = plotmf(model_1, 'input',4);
plot(x,mf);
xlabel('V');

suptitle('TSK model 1: Trained membership functions')
saveas(gcf,'Results/model_1_membership_functions.png');

%% Model 2
figure;
subplot(2,2,1);
[x,mf] = plotmf(model_2, 'input',1);
plot(x,mf);
xlabel('T');

subplot(2,2,2);
[x,mf] = plotmf(model_2, 'input',2);
plot(x,mf);
xlabel('AP');

subplot(2,2,3);
[x,mf] = plotmf(model_2, 'input',3);
plot(x,mf);
xlabel('RH');

subplot(2,2,4);
[x,mf] = plotmf(model_2, 'input',4);
plot(x,mf);
xlabel('V');

suptitle('TSK model 2: Trained membership functions')
saveas(gcf,'Results/model_2_membership_functions.png');

%% Model 3
figure;
subplot(2,2,1);
[x,mf] = plotmf(model_3, 'input',1);
plot(x,mf);
xlabel('T');

subplot(2,2,2);
[x,mf] = plotmf(model_3, 'input',2);
plot(x,mf);
xlabel('AP');

subplot(2,2,3);
[x,mf] = plotmf(model_3, 'input',3);
plot(x,mf);
xlabel('RH');

subplot(2,2,4);
[x,mf]=plotmf(model_3, 'input',4);
plot(x,mf);
xlabel('V');

suptitle('TSK model 3: Trained membership functions')
saveas(gcf,'Results/model_3_membership_functions.png');

%% Model 4
figure;
subplot(2,2,1);
[x,mf]=plotmf(model_4, 'input',1);
plot(x,mf);
xlabel('T');

subplot(2,2,2);
[x,mf]=plotmf(model_4, 'input',2);
plot(x,mf);
xlabel('AP');

subplot(2,2,3);
[x,mf] = plotmf(model_4, 'input',3);
plot(x,mf);
xlabel('RH');

subplot(2,2,4);
[x,mf] = plotmf(model_4, 'input',4);
plot(x,mf);
xlabel('V');

suptitle('TSK model 4: Trained membership functions')
saveas(gcf,'Results/model_4_membership_functions.png');

end
