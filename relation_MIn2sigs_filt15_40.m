oo=4; c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';
c_signal_name{2}='Lozeron08092016';
c_signal_name{3}='Milani08092106';
c_signal_name{4}='Milani150916';
signal_name=c_signal_name{oo};
str_MI_AMP=load(['./seminario5_MI/hists_2sigs/',signal_name,'simsignal_AMP_MI_signal8.mat']);
MI_hists_AMP=str_MI_AMP.str_MI;
str_MI_20=load(['./seminario5_MI/hists_2sigs/',signal_name,'simsignal20Hz_filt15-40_MI_signal8.mat']);
MI_hists_20=str_MI_20.str_MI;
str_MI_filt=load(['./seminario5_MI/hists_2sigs/',signal_name,'simsignal_filt15-40_MI_signal8.mat']);
MI_hists_filt=str_MI_filt.str_MI;

figure,
for o=1:length(MI_hists_AMP)
    hold on,
    subplot(3,2,o),histogram(MI_hists_AMP(o).MI,20)
    hold on,
    subplot(3,2,o),histogram(MI_hists_filt(o).MI,20)
    hold on,
    subplot(3,2,o),histogram(MI_hists_20(o).MI,20)
    hold on,
    subplot(3,2,o),title(['Mutual Information, simulated EEG singal ',signal_name]),
    subplot(3,2,o),grid, legend('AMP', 'Filt_{15-40}', '20Hz')
end
