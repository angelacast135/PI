format long
oo=2; c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';
c_signal_name{2}='Lozeron08092016';
c_signal_name{3}='Milani08092106';
c_signal_name{4}='Milani150916';
signal_name=c_signal_name{oo};
[st_Header, m_SignalsMat] = edfread([signal_name,'.edf']); % a=rand(1,10000); b=filtfilt(SOS, G, a); figure;plot(b)
str_MI=struct;
v_delay=0:60;
for kk=3%1:6%%%%%%%%%%%%%%%%%%%%%%
    mean_hist=zeros(1,length(v_delay));
    time_mean=zeros(1,length(v_delay));
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
    MI=cell(1,1);
    MI_hist=cell(1,1);
    for kkk=1:length(v_delay)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        figure(kk),
        k=1;
        subplot(221),plot(x),
        hold on,
        subplot(221),plot(v_TimeStartEvts(k)*Fs,x(v_TimeStartEvts(k)*Fs),'r*')
        subplot(222),plot(y),
        hold on,
        subplot(222),plot(v_TimeStartEvts(k)*Fs,y(v_TimeStartEvts(k)*Fs),'r*')
        for k=1:length(v_TimeStartEvts)
            t1=v_TimeStartEvts(k)*Fs-Fs*2;%1.5;
            t2=t1+Fs*1.5;
            t3=(v_TimeStartEvts(k)*Fs)-(Fs*2)+(v_delay(kkk)*25);
            t4=t3+Fs*1.5;
            hold on,
            subplot(221),plot(t1,x(t1),'go')
            subplot(221),plot(t2,x(t2),'ko')
            subplot(222),plot(t3,y(t3),'co')
            subplot(222),plot(t4,y(t4),'mx')
        end
        subplot(221), title(['Muscular contraction. Signal ',num2str(kk),' ',lab{1},' MH']),xlabel('Time (s)'),grid
        subplot(222), title(['Muscular contraction. Signal ',num2str(k_2),' EMG MH']),xlabel('Time (s)'),grid
        %     figure
        mi_CM=zeros(1, length(v_TimeStartEvts));
        for k=1:length(v_TimeStartEvts)
            t1=v_TimeStartEvts(k)*Fs-Fs*2;%1.5;
            t2=t1+Fs*1.5;
            t3=(v_TimeStartEvts(k)*Fs)-(Fs*2)+(v_delay(kkk)*25);
            t4=t3+Fs*1.5;
            mi_CM(k) = mutualinfo(x(t1:t2),y(t3:t4)); %Mutual information from MI folder
        end
        MI{kkk}=mi_CM;
        h1=histogram(mi_CM,20);
        MI_hist{kkk}=h1;
        mean_hist(kkk)=mean(h1.BinEdges);
        time_mean(kkk)=v_delay(kkk)*25/256;
%         mean_hist{kkk}=mean(h1.BinEdges);
        hold on,
        subplot(223),plot(mi_CM) %Plot of the Coherence vs. the frequencies (in hertz) at which Cxy is estimated
        hold on,
        subplot(223),title('MH Mutual information')
        hold on,
        subplot(224),histogram(mi_CM,20),title('MH Histogram on Mutual Information')
        %     pause
    end
    str_MI(kk).name=lab{1};
    str_MI(kk).MI=MI;
    str_MI(kk).MI_hists=MI_hist;
    str_MI(kk).mean_hists=mean_hist;
    str_MI(kk).time_means=time_mean; 
end
% save(['./seminario5_MI/hists/',signal_name,'_MI_signal',num2str(k_2),'_1-',num2str(kk),'.mat'], 'str_MI')