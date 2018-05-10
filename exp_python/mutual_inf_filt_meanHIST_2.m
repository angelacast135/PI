format long
oo=5; c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919'; % contraction
c_signal_name{2}='Lozeron08092016'; %NO contraction
c_signal_name{3}='Milani08092106'; % NO contractoin
c_signal_name{4}='Milani150916'; % contraction
c_signal_name{5}='Diab1catalina';
signal_name=c_signal_name{oo};
[st_Header, m_SignalsMat] = edfread([signal_name,'.edf']); % a=rand(1,10000); b=filtfilt(SOS, G, a); figure;plot(b)
str_MI=struct;
v_delay=0:220; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CHANGEDDDD
for kk=1%:6 %%%%%%%%%%%%%%%%%%%%%% %1
    mean_hist_1=zeros(1,length(v_delay));
    mean_hist_2=zeros(1,length(v_delay));
    time_mean=zeros(1,length(v_delay));
    k_1 = kk; %signal EEG
    k_2 = 3; %signal EMG %%%%%%%%%%%%%%%%%%%%% %8
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
        mi_CM=zeros(1, length(v_TimeStartEvts));
        for k=1:length(v_TimeStartEvts)
            t1=(v_TimeStartEvts(k)*Fs)+(Fs*0.5);%-(Fs*2);
            t2=t1+Fs*1.5;
            t3=(v_TimeStartEvts(k)*Fs)-(Fs*2)+(v_delay(kkk)*25);
            t4=t3+Fs*1.5;
            mi_CM(k) = mutualinfo(x(t3:t4),y(t1:t2)); %Mutual information from MI folder
        end
        MI{kkk}=mi_CM;
        h1=histogram(mi_CM,20);
        MI_hist{kkk}=h1;
        mean_hist_1(kkk)=mean(h1.BinEdges);
        time_mean(kkk)=v_delay(kkk)*25/256;
        mean_hist_2(kkk)=mean(mi_CM);
    end
    str_MI(kk).name=lab{1};
    str_MI(kk).MI=MI;
    str_MI(kk).MI_hists=MI_hist;
    str_MI(kk).mean_hists_1=mean_hist_1;
    str_MI(kk).mean_hists_2=mean_hist_2;
    str_MI(kk).time_means=time_mean; 
    str_MI(kk).static='EMG_contraction'; 
 end
save(['./seminario5_MI/hists_2v2/',signal_name,'_MI_signal',num2str(k_2),'_1-',num2str(kk),'.mat'], 'str_MI')