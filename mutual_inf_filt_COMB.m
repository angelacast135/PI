format long
signal_name='Milani08092106';
[st_Header, m_SignalsMat] = edfread([signal_name,'.edf']); % a=rand(1,10000); b=filtfilt(SOS, G, a); figure;plot(b)
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
        t1=v_TimeStartEvts(k)*Fs-Fs*2;%1.5;
        t2=t1+Fs*1.5;
        t3=v_TimeStartEvts(k)*Fs+Fs*0.5;
        t4=t3+Fs*1.5;
        hold on,
        subplot(221),plot(t3,x(t3),'go')
        subplot(221),plot(t4,x(t4),'ko')
        subplot(222),plot(t1,y(t1),'co')
        subplot(222),plot(t2,y(t2),'ro')
    end
    subplot(221), title(['Muscular contraction. Signal ',num2str(kk),' ',lab{1},' COMB']),xlabel('Time (s)'),grid
    subplot(222), title(['Muscular contraction. Signal ',num2str(k_2),' EMG COMB']),xlabel('Time (s)'),grid
    %     figure
    mi_CM=zeros(1, length(v_TimeStartEvts));
    for k=1:length(v_TimeStartEvts)
        t1=v_TimeStartEvts(k)*Fs-Fs*2;%1.5;
        t2=t1+Fs*1.5;
        t3=v_TimeStartEvts(k)*Fs+Fs*0.5;
        t4=t3+Fs*1.5;        
        mi_CM(k) = mutualinfo(x(t3:t4),y(t1:t2)); %Mutual information from MI folder
    end
    str_MI(kk).MI=mi_CM;
    str_MI(kk).MI_hist=hist(mi_CM,20);
    str_MI(kk).name=lab{1};
    hold on,
    subplot(223),plot(mi_CM) %Plot of the Coherence vs. the frequencies (in hertz) at which Cxy is estimated
    hold on,
    subplot(223),title('COMB Mutual information')
    hold on,
    subplot(224),hist(mi_CM,20),title('COMB Histogram on Mutual Information')
%     pause
end
 save(['./seminario5_MI/',signal_name,'_MI_signal',num2str(k_2),'COMB2.mat'], 'str_MI')