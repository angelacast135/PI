format long
oo=1;
c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';
c_signal_name{2}='Lozeron08092016';
c_signal_name{3}='Milani08092106';
c_signal_name{4}='Milani150916';
signal_name=c_signal_name{oo};
[st_Header, m_SignalsMat] = edfread([signal_name,'.edf']); % a=rand(1,10000); b=filtfilt(SOS, G, a); figure;plot(b)
load([signal_name,'.mat']); 
rand_evnt_x=randi([1 length(m_SignalsMat)], 1, length(v_TimeStartEvts));
rand_evnt_y=randi([1 length(m_SignalsMat)], 1, length(v_TimeStartEvts));
str_MI=struct;
for kk=1:6
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
    lab=st_Header.label(kk);
    figure,
    k=1;
    subplot(221),plot(x),
    hold on,
    subplot(221),plot(v_TimeStartEvts(k)*Fs,x(v_TimeStartEvts(k)*Fs),'ro')
    subplot(222),plot(y),
    hold on,
    subplot(222),plot(v_TimeStartEvts(k)*Fs,y(v_TimeStartEvts(k)*Fs),'ro')
    for k=1:length(v_TimeStartEvts)
        t1=rand_evnt_x(k);
        t2=t1+Fs*1.5;
        t3=rand_evnt_y(k);
        t4=t3+Fs*1.5;
        hold on,
        subplot(221),plot(t1,x(t1),'gx')
        subplot(221),plot(t2,x(t2),'k*')
        subplot(222),plot(t3,y(t3),'cx')
        subplot(222),plot(t4,y(t4),'m*')
    end
    subplot(221), title(['Muscular contraction. Signal ',num2str(kk),' ',lab{1},' RAND']),xlabel('Time (s)'),grid
    subplot(222), title(['Muscular contraction. Signal ',num2str(k_2),' EMG RAND']),xlabel('Time (s)'),grid
    %     figure
    mi_CM=zeros(1, length(v_TimeStartEvts));
    for k=1:length(v_TimeStartEvts)
        t1=rand_evnt_x(k);
        t2=t1+Fs*1.5;
        t3=rand_evnt_y(k);
        t4=t3+Fs*1.5;
        mi_CM(k) = mutualinfo(x(t1:t2),y(t3:t4)); %Mutual information from MI folder
    end
    str_MI(kk).MI=mi_CM;
    str_MI(kk).MI_hist=hist(mi_CM,20);
    str_MI(kk).name=lab{1};
    str_MI(kk).x_rand=rand_evnt_x;
    str_MI(kk).y_rand=rand_evnt_y;
    hold on,
    subplot(223),plot(mi_CM) %Plot of the Coherence vs. the frequencies (in hertz) at which Cxy is estimated
    hold on,
    subplot(223),title('RAND Mutual information')
    hold on,
    subplot(224),hist(mi_CM,20),title('RAND Histogram on Mutual Information')
%     pause
end
 save(['./seminario5_MI/',signal_name,'_MI_signal',num2str(k_2),'RAND.mat'], 'str_MI')