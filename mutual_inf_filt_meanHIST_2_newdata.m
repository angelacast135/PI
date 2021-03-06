format long

oo = 13; 
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
signal_name = c_signal_name{oo};

[st_Header, m_SignalsMat] = edfread(['../',signal_name,'.edf']);

str_MI = struct;
v_delay = 0:60; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CHANGEDDDD

for kk = 1:6 %%%%%%%%%%%%%%%%%%%%%% %1
    
    mean_hist_1 = []; %zeros(1,length(v_delay));
    mean_hist_2 = []; %zeros(1,length(v_delay));
    time_mean = []; %zeros(1,length(v_delay));
    
    k_1 = kk; %signal EEG
    k_2 = 8; %signal EMG %%%%%%%%%%%%%%%%%%%%% %8
    Fs = st_Header.samples(k_1);
    load('G.mat'), load('SOS.mat')
    x_raw = m_SignalsMat(k_1,:);
    x = filtfilt(SOS, G, x_raw);
    y_raw = m_SignalsMat(k_2,:);
    y = filtfilt(SOS, G, y_raw);
    load([signal_name,'.mat']);
    lab = st_Header.label(kk);
    
    MI = cell(1,1);
    MI_hist = cell(1,1);
    
    for kkk = 1:length(v_delay)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        mi_CM = []; %zeros(1, length(v_TimeStartEvts)-6);
        for k = 3:length(v_TimeStartEvts)-3%%%%%%%%%%%%%%%% STARTS IN THE SECOND CONTRACTION
            t1 = (v_TimeStartEvts(k)*Fs) + (Fs*0.5);
            t2 = t1 + Fs*1.5;
            t3 = (v_TimeStartEvts(k)*Fs) - (Fs*2) + (v_delay(kkk)*25);
            t4 = t3 + Fs*1.5;
%             mi_CM(k) = mutualinfo(x(t1:t2),y(t3:t4)); %Mutual information from MI folder
            entr_x = entropy(x(t1:t2)); %Mutual information from MI folder
            entr_y = entropy(y(t3:t4));
            joint_xy = jointentropy(x(t1:t2), y(t3:t4));
            mi_xy = mutualinfo(x(t1:t2),y(t3:t4));
%             mi_CM(k-2) = 1 + (mi_xy/joint_xy);
            mi_CM(k-2) = (entr_x + entr_y)/joint_xy;
        end
        MI{kkk} = mi_CM;
        h1 = histogram(mi_CM,20);
        MI_hist{kkk} = h1;
        mean_hist_1(kkk) = mean(h1.BinEdges);
        time_mean(kkk) = v_delay(kkk)*25/256;
        mean_hist_2(kkk) = mean(mi_CM);
    end
    str_MI(kk).name = lab{1};
    str_MI(kk).MI = MI;
    str_MI(kk).MI_hists = MI_hist;
    str_MI(kk).mean_hists_1 = mean_hist_1;
    str_MI(kk).mean_hists_2 = mean_hist_2;
    str_MI(kk).time_means = time_mean; 
    str_MI(kk).static = 'EEG_contraction'; 
 end
% save(['./seminario5_MI/hists_1v2/',signal_name,'_NMI1_signal',num2str(k_2),'_1-',num2str(kk),'.mat'], 'str_MI')