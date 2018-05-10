oo=5; c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';
c_signal_name{2}='Lozeron08092016';
c_signal_name{3}='Milani08092106';
c_signal_name{4}='Milani150916';
c_signal_name{5}='Diab1catalina';
signal_name1=c_signal_name{oo}; 
channel_signal='3'; %'8'; %%%%%%%%%%%%%%%%5
str_MI=load(['./seminario5_MI/hists_1v2/',signal_name1,'_MI_signal',channel_signal,'_1-1.mat']); %%%%5
MI_hists=str_MI.str_MI;
figure,
for o=1:length(MI_hists) %%%%%%%%%%% %4
    hold on,
    subplot(2,2,o),plot((MI_hists(1).time_means)-2, MI_hists(1).mean_hists_2 )
    subplot(2,2,o),title(['Mutual Information, ',MI_hists(1).name, ', ',signal_name1]),
    subplot(2,2,o),grid, xlabel('Time (s)') %legend('MI', 'REV MI', 'COMB1 MI', 'COMB2 MI','RAND MI')

%     subplot(3,2,o),plot((MI_hists(o).time_means)-2, MI_hists(o).mean_hists_2 )
%     subplot(3,2,o),title(['Mutual Information, ',MI_hists(o).name, ', ',signal_name1]),
%     subplot(3,2,o),grid, xlabel('Time (s)') %legend('MI', 'REV MI', 'COMB1 MI', 'COMB2 MI','RAND MI')
end