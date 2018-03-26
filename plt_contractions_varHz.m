% oo=4;
c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';
c_signal_name{2}='Lozeron08092016';
c_signal_name{3}='Milani08092106';
c_signal_name{4}='Milani150916';
figure,
for oo=1:4
    signal_name=c_signal_name{oo};
    str_MI_freq=load(['./seminario5_MI/hists_2sigs/',signal_name,'simsignalvarHz_filt15-40_MI_signal8.mat']);
    MI_hists_freq=str_MI_freq.str_MI;
    v_means_freq=zeros(1, length(MI_hists_freq));
    v_freqs=zeros(1, length(MI_hists_freq));
    for o=1:length(MI_hists_freq)
        v_means_freq(o)=mean(MI_hists_freq(o).MI);
        v_freqs(o)=str2double(MI_hists_freq(o).name(1:2));
    end
    hold on,
    subplot(2,2,oo),plot(v_freqs,v_means_freq)
    hold on,
    subplot(2,2,oo),title(['Mutual Information, simulated EEG signal ',signal_name]),
    subplot(2,2,oo),grid,% legend('AMP', 'Filt_{15-40}', '20Hz') 
    subplot(2,2,oo),xlabel('Freq (Hz)')
end