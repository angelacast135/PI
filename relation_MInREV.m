signal_name='Milani08092106';
str_MI=load(['./seminario5_MI/',signal_name,'_MI_signal8.mat']);
MI_hists=str_MI.str_MI;
str_MI_REV=load(['./seminario5_MI/',signal_name,'_MI_signal8REV.mat']);
MI_hists_REV=str_MI_REV.str_MI;
str_MI_COMB1=load(['./seminario5_MI/',signal_name,'_MI_signal8COMB1.mat']);
MI_hists_COMB1=str_MI_COMB1.str_MI;
str_MI_COMB2=load(['./seminario5_MI/',signal_name,'_MI_signal8COMB2.mat']);
MI_hists_COMB2=str_MI_COMB2.str_MI;
figure,
for o=1:length(MI_hists)
    hold on,
    subplot(3,2,o),histogram(MI_hists(o).MI,20)
    hold on,
    subplot(3,2,o),histogram(MI_hists_REV(o).MI,20)
    hold on,
    subplot(3,2,o),histogram(MI_hists_COMB1(o).MI,20)
    hold on,
    subplot(3,2,o),histogram(MI_hists_COMB2(o).MI,20)
    hold on,
    subplot(3,2,o),title(['Mutual Information, ',MI_hists(o).name, ', ',signal_name]),
    subplot(3,2,o),grid, legend('MI', 'REV MI', 'COMB1 MI', 'COMB2 MI')
end
