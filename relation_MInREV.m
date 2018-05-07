oo=5; c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';% contraction
c_signal_name{2}='Lozeron08092016'; %NO contraction
c_signal_name{3}='Milani08092106'; %NO contraction
c_signal_name{4}='Milani150916'; % contraction
c_signal_name{5}='Diab1catalina';
signal_name=c_signal_name{oo};
channel_signal='3';%%%%%%%%%%%%% %'8';
str_MI=load(['./seminario5_MI/',signal_name,'_MI_signal',channel_signal,'_13cont.mat']);
MI_hists=str_MI.str_MI;
% str_MI_REV=load(['./seminario5_MI/',signal_name,'_MI_signal',channel_signal,'REV.mat']);
% MI_hists_REV=str_MI_REV.str_MI;
% str_MI_COMB1=load(['./seminario5_MI/',signal_name,'_MI_signal',channel_signal,'COMB1.mat']);
% MI_hists_COMB1=str_MI_COMB1.str_MI;
% str_MI_COMB2=load(['./seminario5_MI/',signal_name,'_MI_signal',channel_signal,'COMB2.mat']);
% MI_hists_COMB2=str_MI_COMB2.str_MI;
% % str_MI_RAND=load(['./seminario5_MI/',signal_name,'_MI_signal',channel_signal,'RAND.mat']);
% % MI_hists_RAND=str_MI_RAND.str_MI;
% figure,
for o=1%:length(MI_hists)
    hold on,
%     subplot(3,2,o),
    histogram(MI_hists(o).MI,20)
    hold on,
%     subplot(3,2,o),histogram(MI_hists_REV(o).MI,20)
%     hold on,
%     subplot(3,2,o),histogram(MI_hists_COMB1(o).MI,20)
%     hold on,
%     subplot(3,2,o),histogram(MI_hists_COMB2(o).MI,20)
% %     hold on,
% %     subplot(3,2,o),histogram(MI_hists_RAND(o).MI,20)
%     hold on,
%     subplot(3,2,o),
    title(['Mutual Information, ',MI_hists(o).name, ', ',signal_name]),
%     subplot(3,2,o),
    grid, legend('MI')%, 'REV MI', 'COMB1 MI', 'COMB2 MI')%,'RAND MI')
end
