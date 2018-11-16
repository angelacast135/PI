% perform a permutation test within every contraction

% oo = 8;
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

addpath('../mi/seminario5_MI/hists_1v2/')
oo_HS = 11;
oo_PA = 12;
signal_name_HS = c_signal_name{oo_HS};
signal_name_PA = c_signal_name{oo_PA};

% [st_Header, m_SignalsMat] = edfread([signal_name,'.edf']);
k_2_HS = 8; %3
k_2_PA = 8; %8

kk_HS = 6; %1
kk_PA = 6; %6

str_MI_HS = load(['mi/seminario5_MI/hists_1v2/',signal_name_HS,'_NMI1_signal',num2str(k_2_HS),'_1-',num2str(kk_HS),'.mat']); %%%%%%% NOMR
% str_MI_HS = load(['mi/seminario5_MI/hists_1v2/',signal_name_HS,'_MI_signal',num2str(k_2_HS),'_1-',num2str(kk_HS),'.mat']); 
str_MI_HS = str_MI_HS.str_MI;
MI_HS = str_MI_HS(1).MI;

str_MI_PA = load(['mi/seminario5_MI/hists_1v2/',signal_name_PA,'_NMI1_signal',num2str(k_2_PA),'_1-',num2str(kk_PA),'.mat']); %%%%%%% NOMR
% str_MI_PA = load(['mi/seminario5_MI/hists_1v2/',signal_name_PA,'_MI_signal',num2str(k_2_PA),'_1-',num2str(kk_PA),'.mat']); 
str_MI_PA = str_MI_PA.str_MI;
MI_PA = str_MI_PA(1).MI;

[m_HS,n_HS] = size(MI_HS); %determine if every single structure (subject) have the same amount of times**
[m_PA,n_PA] = size(MI_PA); %determine if every single structure (subject) have the same amount of times**
if n_HS > n_PA
    n = n_PA;
else
    n = n_HS;
end

st_PermTest = struct();
s_Alpha = 0.05;                % Nivel de confianza alfa
s_Perm = 1600;                 % Número de permutaciones a realizar

for delay = 1:n
    v_mi_time_HS = MI_HS{1, delay}; % this contains the mutual information for one same moment of the contraction for every contraction
    v_mi_time_PA = MI_PA{1, delay}; % this contains the mutual information for one same moment of the contraction for every contraction
    
    if length(v_mi_time_HS) > length(v_mi_time_PA) % amount of events per delay
        s_aux = randperm(length(v_mi_time_HS));
        v_mi_time_HS = v_mi_time_HS(s_aux(1:length(v_mi_time_PA)));
    else
        s_aux = randperm(length(v_mi_time_PA));
        v_mi_time_PA = v_mi_time_PA(s_aux(1:length(v_mi_time_HS)));
    end
    
    if (mean(v_mi_time_HS) > mean (v_mi_time_PA))
        v_FirstDistr = v_mi_time_HS;
        v_SecondDistr = v_mi_time_PA;
    else
        v_FirstDistr = v_mi_time_PA;
        v_SecondDistr = v_mi_time_HS;
    end
    
    [v_StatTest, v_pValue] = f_PermTest2(v_FirstDistr, v_SecondDistr, s_Alpha, s_Perm);
    st_PermTest(delay).StatTest = v_StatTest;
    st_PermTest(delay).pValue = v_pValue;
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


%% plot

for k = 1:length(MI_HS)
    MImeans_HS(k) = mean(MI_HS{1,k});
end
for k = 1:length(MI_PA)
    MImeans_PA(k) = mean(MI_PA{1,k});
end
v_time = ((1:length(MImeans_HS)) * 25 / 256) - 2;
figure, plot(v_time, MImeans_HS)
hold on, plot(v_time, MImeans_PA)
grid on, title('Norm Mutual Information1')
% grid on, title('Mutual Information')
xlabel('time (s)'), ylabel('MI Score')

global_min = min(min(MImeans_PA), min(MImeans_HS));

x = find(v_pValue_mean == 1);
y = ones(1, length(x))* (global_min - 0.05);

plot(v_time(x), y, 'r*', 'LineWidth', 2 )
legend(['HS_{', num2str(oo_HS), '}'], ['PA_{', num2str(oo_PA), '}'], 'Sig p-Value', 'Location', 'northeastoutside')










