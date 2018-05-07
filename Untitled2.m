    for kkk=1:length(v_delay)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(kk),
k=1;
subplot(121),plot(x),
hold on,
subplot(121),plot(v_TimeStartEvts(k)*Fs,x(v_TimeStartEvts(k)*Fs),'r*')
subplot(122),plot(y),
hold on,
subplot(122),plot(v_TimeStartEvts(k)*Fs,y(v_TimeStartEvts(k)*Fs),'r*')
for k=1:length(v_TimeStartEvts)
    t1=v_TimeStartEvts(k)*Fs-Fs*2;%1.5;
    t2=t1+Fs*1.5;
    t3=(v_TimeStartEvts(k)*Fs)-(Fs*2)+(v_delay(kkk)*25);
    t4=t3+Fs*1.5;
    hold on,
    subplot(121),plot(t1,x(t1),'go')
    subplot(121),plot(t2,x(t2),'ko')
    subplot(122),plot(t3,y(t3),'co')
    subplot(122),plot(t4,y(t4),'mx')
end
subplot(121), title(['Muscular contraction. Signal ',num2str(kk),' ',lab{1},' MH']),xlabel('Time (s)'),grid
subplot(122), title(['Muscular contraction. Signal ',num2str(k_2),' EMG MH']),xlabel('Time (s)'),grid
    end