oo=4; c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';
c_signal_name{2}='Lozeron08092016';
c_signal_name{3}='Milani08092106';
c_signal_name{4}='Milani150916';
signal_name=c_signal_name{oo};
str_MI_1=load(['./seminario5_MI/hists_2/',signal_name,'_MI_signal8_1-6.mat']);
MI_hists_1=str_MI_1.str_MI;
str_MI_2=load(['./seminario5_MI/hists_2/',signal_name,'_MI_signal8_1-6.mat']);
MI_hists_2=str_MI_2.str_MI;

figure,
for o=1:length(MI_hists_1)
    hold on,
    subplot(3,2,o),plot((MI_hists_1(o).time_means)-2, MI_hists_1(o).mean_hists_1 )
    hold on,
    subplot(3,2,o),plot((MI_hists_2(o).time_means)-2, MI_hists_2(o).mean_hists_2 )
    subplot(3,2,o),title(['Mutual Information, ',MI_hists_1(o).name, ', ',signal_name]),
    subplot(3,2,o),grid, xlabel('Time (s)'), legend('Mean 1', 'Mean 2')
%     subplot(3,2,o), xlim([-2 3])
end