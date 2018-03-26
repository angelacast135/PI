oo=1;oo2=3; c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';
c_signal_name{2}='Lozeron08092016';
c_signal_name{3}='Milani08092106';
c_signal_name{4}='Milani150916';
signal_name1=c_signal_name{oo}; signal_name2=c_signal_name{oo2};
str_MI=load(['./seminario5_MI/hists_2sigs/',signal_name1,signal_name2,'_MI_signal8_1-6.mat']);
MI_hists=str_MI.str_MI;
figure,
for o=1:length(MI_hists)
    hold on,
    subplot(3,2,o),plot((MI_hists(o).time_means)-2, MI_hists(o).mean_hists_2 )
    subplot(3,2,o),title(['Mutual Information, ',MI_hists(o).name, ', ',signal_name1,'-',signal_name2]),
    subplot(3,2,o),grid, xlabel('Time (s)') %legend('MI', 'REV MI', 'COMB1 MI', 'COMB2 MI','RAND MI')
end