st_slide = dir(fullfile('../PI/exp_python/mi_delays_newdata_movingbothwindows')); %%%%%%%%%%%%%%%%
st_slide(1:2) = [];
oo = 14;
c_signal_name = cell(1,1);
c_signal_name{1} = 'Lozeron130919'; % contraction
c_signal_name{2} = 'Lozeron08092016'; %NO contraction
c_signal_name{3} = 'Milani08092106'; % NO contractoin
c_signal_name{4} = 'Milani150916'; % contraction
c_signal_name{5} = 'Diab1catalina';
c_signal_name{6} = 'laurier_micka';
c_signal_name{7} = 'le_brun_david';
c_signal_name{8} = 'thoraval_daniel';
c_signal_name{9} = 'touboul_beatrice';
c_signal_name{10} = 'legrand_cyril';
c_signal_name{11} = 'vialatte_clement';
c_signal_name{12} = 'vlade_catalina_diab';
c_signal_name{13} = 'LUOISON_MAURICE_DIAB';
c_signal_name{14} = 'CM_diabete';
signal_name = c_signal_name{oo};
check_name = split(signal_name, '_');


for k = 1:length(st_slide)
   c_splits = split(st_slide(k).name,'_');
   if length ( c_splits) > 3
       str_name = c_splits{3};
       if isequal(str_name,'vlade') %%% vlade diab
           load(fullfile('../PI/exp_python/mi_delays_newdata_movingbothwindows',st_slide(k).name));
           c_split = split(c_splits{end}, '.');
           s_ind = str2double(c_split{1}) + 1;
           Diab(:,s_ind) = mi;           
           fprintf('-----DIAB------- %s\n',st_slide(k).name)
       elseif isequal(str_name, check_name{1})
           load(fullfile('../PI/exp_python/mi_delays_newdata_movingbothwindows',st_slide(k).name));
           c_split = split(c_splits{end}, '.');
           s_ind = str2double(c_split{1}) + 1;
           L13(:,s_ind) = mi;
           fprintf('-----Le------- %s\n',st_slide(k).name)
       end
   end
end
%% Plot MI means
v_mean_Diab = mean(Diab);
v_mean_L13 = mean(L13);
v_time = ((1:length(v_mean_Diab)) * 25 / 256) - 2;
figure, plot(v_time ,v_mean_Diab)
hold on, plot(v_time,v_mean_L13)
grid on, title('Normalized Mutual Information')
xlabel('time (s)'), ylabel('Norm MI Score')
% legend('le_brun_david', signal_name, 'Location', 'northeastoutside') 
legend('Diab', signal_name, 'Location', 'northeastoutside') 
%% Permutation test between Diab and L13
addpath('PermTest\')
[m,n] = size(Diab);
st_PermTest = struct();
s_Alpha = 0.05;                % Nivel de confianza alfa
s_Perm = 1600;                 % N�mero de permutaciones a realizar
for kk = 1:n
    v_MI_Diab = Diab(:,kk);
    v_MI_L13 = L13(:,kk);
    if (mean(v_MI_Diab) > mean (v_MI_L13(1:13)))
        v_FirstDistr = v_MI_Diab;
        v_SecondDistr = v_MI_L13(1:13);
    else
        v_FirstDistr = v_MI_L13(1:13);
        v_SecondDistr = v_MI_Diab;
    end
    
    [v_StatTest, v_pValue] = f_PermTest2(v_FirstDistr,v_SecondDistr, s_Alpha, s_Perm);
    st_PermTest(kk).StatTest = v_StatTest;
    st_PermTest(kk).pValue = v_pValue;
end

%% check estimators
[o, p] = size(st_PermTest);
v_pValue_mean = zeros(1,p);
for kkk = 1:p
%     v_pValue_mean(kkk) = st_PermTest(kkk).pValue(1);
    v_pValue_mean(kkk) = st_PermTest(kkk).StatTest(1);
end
figure
x = 1:p;
plot(x,v_pValue_mean)

%%

% for k = 1:length(MI_HS)
%     MImeans_HS(k) = mean(MI_HS{1,k});
% end
% for k = 1:length(MI_PA)
%     MImeans_PA(k) = mean(MI_PA{1,k});
% end
% v_time = ((1:length(MImeans_HS)) * 25 / 256) - 2;
% figure, plot(v_time, MImeans_HS)
% hold on, plot(v_time, MImeans_PA)
% grid on, title('Norm Mutual Information1')
% % grid on, title('Mutual Information')
% xlabel('time (s)'), ylabel('MI Score')

global_min = min(min(v_mean_Diab), min(v_mean_L13));

x = find(v_pValue_mean == 1);
y = ones(1, length(x))* (global_min - 0.05);
figure(oo-6), hold on,
plot(v_time(x), y, 'r*', 'LineWidth', 2 )
% legend('thoraval_daniel', signal_name, 'Location', 'northeastoutside') 
% legend('Diab', signal_name, 'Location', 'northeastoutside')
legend('Diab', ['PA_{',num2str(oo),'}'],'Location', 'northeastoutside')
% legend(['HS_{', num2str(oo_HS), '}'], ['PA_{', num2str(oo_PA), '}'], 'Sig p-Value', 'Location', 'northeastoutside')




