format long

[st_Header, m_SignalsMat] = edfread('Milani150916.edf');
k_1 = 2; %signal 2
k_2 = 8; %signal 8

Fs = st_Header.samples(k_1);
t = 0:1/Fs:1-1/Fs; %Time

%Load of bivariate time series and time intervals in which there is
% muscular contraction
x = m_SignalsMat(k_1,:);
y = m_SignalsMat(k_2,:);
load('Milani150916.mat');
figure
for k=1:length(v_TimeStartEvts)-1
    t1=v_TimeStartEvts(k)*Fs;
    t2=v_TimeStartEvts(k+1)*Fs;
    [Cxy,F] = mscohere(x(t1:t2),y(t1:t2),nuttallwin(100),80,100,Fs); %Magnitude-squared coherence
    hold on,
    plot(F,Cxy) %Plot of the Coherence vs. the frequencies (in hertz) at which Cxy is estimated
end
title('Magnitude-Squared Coherence, NuttallWin'),xlabel('Frequency (Hz)'),grid