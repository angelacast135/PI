
oo = 12;

c_signal_name = cell(1,1);
c_signal_name{1} = 'Lozeron130919';
c_signal_name{2} = 'Lozeron08092016';
c_signal_name{3} = 'Milani08092106';
c_signal_name{4} = 'Milani150916';
c_signal_name{5} = 'Diab1catalina';
c_signal_name{6} = 'laurier_micka';
c_signal_name{7} = 'le_brun_david';
c_signal_name{8} = 'thoraval_daniel';
c_signal_name{9} = 'touboul_beatrice';
c_signal_name{10} = 'legrand_cyril';
c_signal_name{11} = 'vialatte_clement';
c_signal_name{12} = 'vlade_catalina_diab';
signal_name1 = c_signal_name{oo}; 

channel_signal = '8'; %%%%%%%%%%%%%%%%5
str_MI = load(['./seminario5_MI/hists_1v2/',signal_name1,'_NMI2_signal',channel_signal,'_1-6.mat']); %%%%6
MI_hists = str_MI.str_MI;
h = split(signal_name1,  '_');
full_name ='';
for r =1:length(h)
    full_name = [full_name,' ', h{r}];
end
figure,
for o=1:length(MI_hists) %%%%%%%%%%% %4
    hold on,
% %     subplot(2,2,o),
%       plot((MI_hists(1).time_means)-2, MI_hists(1).mean_hists_2 )
% %     subplot(2,2,o),
% title(['Mutual Information, ',MI_hists(1).name, ', ',full_name]),
% %     subplot(2,2,o),
% grid, xlabel('Time (s)') %legend('MI', 'REV MI', 'COMB1 MI', 'COMB2 MI','RAND MI')

    subplot(3,2,o),plot((MI_hists(o).time_means)-2, MI_hists(o).mean_hists_2 )
    subplot(3,2,o),title(['NMI2, ',MI_hists(o).name, ', ',full_name]), % Mutual Information
    subplot(3,2,o),grid, xlabel('Time (s)') %legend('MI', 'REV MI', 'COMB1 MI', 'COMB2 MI','RAND MI')
end