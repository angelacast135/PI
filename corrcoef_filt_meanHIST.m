format long
oo=2; c_signal_name = cell(1,1);
c_signal_name{1} = 'Lozeron130919';
c_signal_name{2} = 'Lozeron08092016';
c_signal_name{3} = 'Milani08092106';
c_signal_name{4} = 'Milani150916';
signal_name = c_signal_name{oo};
[st_Header, m_SignalsMat] = edfread([signal_name,'.edf']); % a=rand(1,10000); b=filtfilt(SOS, G, a); figure;plot(b)
str_corrcoef = struct;
v_delay = 0:60;
for kk = 1:6%%%%%%%%%%%%%%%%%%%%%%
    mean_AB_cc = zeros(1,length(v_delay));
    mean_BA_cc = zeros(1,length(v_delay));
    time_mean_cc = zeros(1,length(v_delay));
    k_1 = kk; %signal EEG
    k_2 = 8; %signal EMG
    Fs = st_Header.samples(k_1);
    t = 0:1/Fs:1-1/Fs; %Time
    load('G.mat'), load('SOS.mat')
    x_raw = m_SignalsMat(k_1,:);
    x = filtfilt(SOS, G, x_raw);
    y_raw = m_SignalsMat(k_2,:);
    y = filtfilt(SOS, G, y_raw);
    load([signal_name,'.mat']);
    lab = st_Header.label(kk);
    c_cc_AB = cell(1,1); c_cc_BA = cell(1,1); equal_cc = cell(1,1);
    cc_hist = cell(1,1);
    for kkk = 1:length(v_delay)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        cc_AB_CM = zeros(1, length(v_TimeStartEvts));
        cc_BA_CM = zeros(1, length(v_TimeStartEvts));
        for k = 1:length(v_TimeStartEvts)
            t1 = (v_TimeStartEvts(k)*Fs)-(Fs*2);%+(Fs*0.5);
            t2 = t1+Fs*1.5;
            t3 = (v_TimeStartEvts(k)*Fs)-(Fs*2)+(v_delay(kkk)*25);
            t4 = t3+Fs*1.5;
            R = corrcoef(x(t3:t4),y(t1:t2)); %Corrcoef
            cc_AB_CM(k) = abs(R(3));
            cc_BA_CM(k) = abs(R(2));
        end
        c_cc_AB{kkk} = cc_AB_CM;
        c_cc_BA{kkk} = cc_AB_CM;
        equal_cc{kkk} = cc_AB_CM==cc_BA_CM;
        h1 = histogram(cc_AB_CM,20);
        cc_hist{kkk} = h1;
        time_mean_cc(kkk) = v_delay(kkk)*25/256;
        mean_AB_cc(kkk) = mean(cc_AB_CM);
        mean_BA_cc(kkk) = mean(cc_BA_CM);
    end
    str_corrcoef(kk).name = lab{1};
    str_corrcoef(kk).cc_AB = c_cc_AB;
    str_corrcoef(kk).cc_BA = c_cc_BA;
    str_corrcoef(kk).equals_cc = equal_cc;
    str_corrcoef(kk).AB_hists = cc_hist;
    str_corrcoef(kk).mean_AB_cc = mean_AB_cc;
    str_corrcoef(kk).mean_BA_cc = mean_BA_cc;
    str_corrcoef(kk).time_means = time_mean_cc; 
    str_corrcoef(kk).static = 'EMG'; 
 end
save(['./seminario5_corrcoef/hists_2/',signal_name,'_cc_signal',num2str(k_2),'_1-',num2str(kk),'.mat'], 'str_corrcoef')