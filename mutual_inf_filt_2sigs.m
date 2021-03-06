format long
oo=1; oo2=3; c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';
c_signal_name{2}='Lozeron08092016';
c_signal_name{3}='Milani08092106';
c_signal_name{4}='Milani150916';
signal_name_1=c_signal_name{oo};
[st_Header1, m_SignalsMat1] = edfread([signal_name_1,'.edf']); % a=rand(1,10000); b=filtfilt(SOS, G, a); figure;plot(b)
signal_name_2=c_signal_name{oo2};
[st_Header2, m_SignalsMat2] = edfread([signal_name_2,'.edf']); % a=rand(1,10000); b=filtfilt(SOS, G, a); figure;plot(b)
str_MI=struct; 
for kk=1:6
    k_1 = kk; %signal EEG
    k_2 = 8; %signal EMG
    Fs = st_Header1.samples(k_1);
    t = 0:1/Fs:1-1/Fs; %Time
    load('G.mat'), load('SOS.mat')
    x_raw = m_SignalsMat1(k_1,:);
    x = filtfilt(SOS, G, x_raw);
    y_raw = m_SignalsMat2(k_2,:);
    y = filtfilt(SOS, G, y_raw);
    load([signal_name_1,'.mat']);
    v_TimeStartEvts1=v_TimeStartEvts;
    load([signal_name_2,'.mat']);
    v_TimeStartEvts2=v_TimeStartEvts;
    lab=st_Header1.label(kk);
    figure,
    k=1;
    subplot(221),plot(x),
    hold on,
    subplot(221),plot(v_TimeStartEvts1(k)*Fs,x(v_TimeStartEvts1(k)*Fs),'ro')
    subplot(222),plot(y),
    hold on,
    subplot(222),plot(v_TimeStartEvts2(k)*Fs,y(v_TimeStartEvts2(k)*Fs),'ro')
    if length(v_TimeStartEvts1)<length(v_TimeStartEvts2), n_events=length(v_TimeStartEvts1); else, n_events=length(v_TimeStartEvts2); end
    for k=1:n_events
        t1=v_TimeStartEvts1(k)*Fs+Fs*0.5;
        t2=t1+Fs*1.5;
        t3=v_TimeStartEvts2(k)*Fs+Fs*0.5;
        t4=t3+Fs*1.5;
        hold on,
        subplot(221),plot(t1,x(t1),'go')
        subplot(221),plot(t2,x(t2),'ko')
        subplot(222),plot(t3,y(t3),'go')
        subplot(222),plot(t4,y(t4),'ko')
    end
    subplot(221), title(['Muscular contraction. Signal ',num2str(kk),' ',lab{1}]),xlabel('Time (s)'),grid
    subplot(222), title(['Muscular contraction. Signal ',num2str(k_2),' EMG']),xlabel('Time (s)'),grid
%     figure
    mi_CM=zeros(1, n_events);
    for k=1:n_events
        t1=v_TimeStartEvts(k)*Fs+Fs*0.5;
        t2=t1+Fs*1.5;
        t3=v_TimeStartEvts2(k)*Fs+Fs*0.5;
        t4=t3+Fs*1.5;
        mi_CM(k) = mutualinfo(x(t1:t2),y(t3:t4)); %Mutual information from MI folder
    end
    str_MI(kk).MI=mi_CM;
    str_MI(kk).MI_hist=hist(mi_CM,20);
    str_MI(kk).name=lab{1};
    hold on,
    subplot(223),plot(mi_CM) %Plot of the Coherence vs. the frequencies (in hertz) at which Cxy is estimated
    hold on,
    subplot(223),title('Mutual information')
    hold on,
    subplot(224),hist(mi_CM,20),title('Histogram on Mutual Information')
%     pause
end
save(['./seminario5_MI/hists_2sigs/',signal_name_1,signal_name_2,'_MI_signal',num2str(k_2),'.mat'], 'str_MI')