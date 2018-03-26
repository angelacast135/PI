oo=1;oo2=3; c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';
c_signal_name{2}='Lozeron08092016';
c_signal_name{3}='Milani08092106';
c_signal_name{4}='Milani150916';
signal_name1=c_signal_name{oo}; signal_name2=c_signal_name{oo2};
str_MI=load(['./seminario5_MI/',signal_name1,'_MI_signal8.mat']);
MI_hists=str_MI.str_MI;
str_MI_2=load(['./seminario5_MI/',signal_name2,'_MI_signal8.mat']);
MI_hists_2=str_MI_2.str_MI;
str_MI_2sigs=load(['./seminario5_MI/hists_2sigs/',signal_name1,signal_name2,'_MI_signal8.mat']);
MI_hists_2sigs=str_MI_2sigs.str_MI;

figure,
for o=1:length(MI_hists)
    hold on,
    subplot(3,2,o),histogram(MI_hists(o).MI,20)
    hold on,
    subplot(3,2,o),histogram(MI_hists_2(o).MI,20)
    hold on,
    subplot(3,2,o),histogram(MI_hists_2sigs(o).MI,20)
    hold on,
    subplot(3,2,o),title(['Mutual Information, ',MI_hists(o).name, ', ',signal_name1,'-',signal_name2]),
    subplot(3,2,o),grid, legend('MI 1', 'MI 2', 'MI_{2sigs}')
end
