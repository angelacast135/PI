oo=4; c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';
c_signal_name{2}='Lozeron08092016';
c_signal_name{3}='Milani08092106';
c_signal_name{4}='Milani150916';
signal_name1=c_signal_name{oo}; 
str_corrcoef=load(['./seminario5_corrcoef/hists_1/',signal_name1,'_cc_signal8_1-6.mat']);
corrcoef_hists=str_corrcoef.str_corrcoef;
figure,
for o=1:length(corrcoef_hists)
    hold on,
    subplot(3,2,o),plot((corrcoef_hists(o).time_means)-2, corrcoef_hists(o).mean_AB_cc )
    subplot(3,2,o),title(['Correlation Coefficient, ',corrcoef_hists(o).name, ', ',signal_name1]),
    subplot(3,2,o),grid, xlabel('Time (s)') %legend('MI', 'REV MI', 'COMB1 MI', 'COMB2 MI','RAND MI')
end