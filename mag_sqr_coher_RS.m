format long
addpath './data'
signal_name='Milani08092106';
[st_Header, m_SignalsMat] = edfread([signal_name,'.edf']);
str_mean_cohere=struct; 
for kk=1:6
    k_1 = kk; %signal EEG
    k_2 = 8; %signal EMG
    Fs = st_Header.samples(k_1);
    t = 0:1/Fs:1-1/Fs; %Time
    x = m_SignalsMat(k_1,:);
    y = m_SignalsMat(k_2,:);
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
        t1=v_TimeStartEvts(k)*Fs+Fs*0.5;
        t2=t1+Fs*1.5;
        hold on,
        subplot(221),plot(t1,x(t1),'go')
        subplot(221),plot(t2,x(t2),'ko')
        subplot(222),plot(t1,y(t1),'go')
        subplot(222),plot(t2,y(t2),'ko')
    end
    subplot(221), title(['Muscular contraction. Signal ',num2str(kk),' ',lab{1}]),xlabel('Time (s)'),grid
    subplot(222), title(['Muscular contraction. Signal ',num2str(k_2),' EMG']),xlabel('Time (s)'),grid
    total_cohere=zeros(length(v_TimeStartEvts),501);
%     figure
    for k=1:length(v_TimeStartEvts)
        t1=v_TimeStartEvts(k)*Fs+Fs*0.5;
        t2=t1+Fs*1.5;
        [Cxy,F] = mscohere(x(t1:t2),y(t1:t2),hann(100),80,1000,Fs); %Magnitude-squared coherence
        total_cohere(k,:)=Cxy';
        hold on,
        subplot(223),plot(F,Cxy) %Plot of the Coherence vs. the frequencies (in hertz) at which Cxy is estimated
        hold off  
    end
    subplot(223),title('Magnitude-Squared Coherence, HannWin'),xlabel('Frequency (Hz)'),grid
    mean_total_cohere=mean(total_cohere);
    str_mean_cohere(kk).mean=mean_total_cohere;
    str_mean_cohere(kk).F=F;
%     figure,
    F_aux=F(F>=8); F_aux=F_aux(F_aux<=40); 
    mean_cohere_aux=mean_total_cohere(F>=8); mean_cohere_aux=mean_cohere_aux(F_aux<=40);
    str_mean_cohere(kk).mean_aux=mean_cohere_aux;
    str_mean_cohere(kk).F_aux=F_aux;
    str_mean_cohere(kk).name=lab{1};
    hold on,
    subplot(224),plot(F_aux,mean_cohere_aux),title('Mean of Magnitude-Squared Coherence, HannWin'),xlabel('Frequency (Hz)'),grid
%     pause
end
save(['./seminario5/',signal_name,'_CMC_signal',num2str(k_2),'.mat'], 'str_mean_cohere')