fullfile('../PI/exp_python/mi_delays_newdata')
dir(fullfile('../PI/exp_python/mi_delays_newdata'))
clear all, close all, clc}
clear all, close all, clc
fullfile('../PI/exp_python/mi_delays_newdata')
dir(fullfile('../PI/exp_python/mi_delays_newdata'))
pwd
dir(fullfile('../PI/exp_python/mi_delays_newdata'))
pwd
cd ..
pwd
cd PI
ls
pwd
dir(fullfile('../PI/exp_python/mi_delays_newdata'))
legend(['HS_{', num2str(oo_HS), '}'], ['PA_{', num2str(oo_PA), '}'], 'Sig p-Value', 'Location', 'northeastoutside')
clear all, close all, clc
mkdir save_v_mean; save('save_V_mean/v_mean_Diab', v_mean_Diab)
mkdir save_v_mean; save('save_v_mean/v_mean_Diab', v_mean_Diab)
save('save_v_mean/v_mean_Diab.mat', v_mean_Diab)
save('save_v_mean/v_mean_Diab.mat', 'v_mean_Diab')
save('save_v_mean/v_mean_thoraval.mat', 'v_mean_L13')
clear all
save('save_v_mean/v_mean_thoraval.mat', 'v_mean_L13')
clear all
save('save_v_mean/v_mean_touboul.mat', 'v_mean_L13')
clear all
save('save_v_mean/v_mean_legrand.mat', 'v_mean_L13')
clear all
save('save_v_mean/v_mean_vialatte.mat', 'v_mean_L13')
clear all
save('save_v_mean/v_mean_vlade.mat', 'v_mean_L13')
k=1; figure(k), legend('Diab', ['PA_',num2str(k)], 'Location', 'northeastoutside')
k=2; figure(k), legend('Diab', ['PA_',num2str(k)], 'Location', 'northeastoutside')
k=1; figure(k), legend('Diab', ['PA_',num2str(k+6)], 'Location', 'northeastoutside')
k=2; figure(k), legend('Diab', ['PA_',num2str(k+6)], 'Location', 'northeastoutside')
k=3; figure(k), legend('Diab', ['PA_',num2str(k+6)], 'Location', 'northeastoutside')
k=4; figure(k), legend('Diab', ['PA_',num2str(k+6)], 'Location', 'northeastoutside')
k=4; figure(k), legend('Diab', ['PA_{',num2str(k+6),'}'], 'Location', 'northeastoutside')
k=5; figure(k), legend('Diab', ['PA_{',num2str(k+6),'}'], 'Location', 'northeastoutside')
k=6; figure(k), legend('Diab', ['Diab_1'], 'Location', 'northeastoutside')
clear all
load('save_v_mean\v_mean_Diab.mat')
load('save_v_mean\v_mean_le.mat')
v_mean_L13 = v_mean_le;
v_mean_le = v_mean_L13;
load('save_v_mean\v_mean_legrand.mat')
v_mean_legrand = v_mean_L13;
load('save_v_mean\v_mean_thoraval.mat')
v_mean_thoroval = v_mean_L13;
load('save_v_mean\v_mean_touboul.mat')
v_mean_touboul = v_mean_L13;
load('save_v_mean\v_mean_vialatte.mat')
v_mean_vialatte = v_mean_L13;
load('save_v_mean\v_mean_vlade.mat')
v_mean_vlade = v_mean_L13;
v_time = ((1:length(v_mean_Diab)) * 25 / 256) - 2;
figure, plot(v_time, v_mean_Diab)
hold on, grid on, plot(v_time, v_mean_le)
hold on, plot(v_time, v_mean_thoroval)
hold on, plot(v_time, v_mean_touboul)
hold on, plot(v_time, v_mean_legrand)
hold on, plot(v_time, v_mean_vialatte)
hold on, plot(v_time, v_mean_vlade)
k=1; figure(7), legend('Diab', ['PA_{',num2str(k+6),'}'], ['PA_{',num2str(k+7),'}'], ['PA_{',num2str(k+8),'}'], ['PA_{',num2str(k+9),'}'], ['PA_{',num2str(k+10),'}'], ['Diab_1'], 'Location', 'northeastoutside')
figure, plot(v_time, v_mean_Diab, 'LineWidth', 2)
hold on, grid on, plot(v_time, v_mean_le,'LineWidth', 1)
hold on, plot(v_time, v_mean_thoroval,'LineWidth', 1)
hold on, plot(v_time, v_mean_touboul,'LineWidth', 1)
hold on, plot(v_time, v_mean_legrand,'LineWidth', 1)
hold on, plot(v_time, v_mean_vialatte,'LineWidth', 1)
hold on, plot(v_time, v_mean_vlade,'LineWidth', 1)
k=1; figure(7), legend('Diab', ['PA_{',num2str(k+6),'}'], ['PA_{',num2str(k+7),'}'], ['PA_{',num2str(k+8),'}'], ['PA_{',num2str(k+9),'}'], ['PA_{',num2str(k+10),'}'], ['Diab_1'], 'Location', 'northeastoutside')