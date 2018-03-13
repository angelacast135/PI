signal_name='Milani08092106';
str_CMC=load(['./seminario5/',signal_name,'_CMC_signal8.mat']);
CMC_mean=str_CMC.str_mean_cohere;
str_CMC_REV=load(['./seminario5/',signal_name,'_CMC_signal8REV.mat']);
CMC_mean_REV=str_CMC_REV.str_mean_cohere;
figure,
for o=1:length(CMC_mean)
    hold on,
    subplot(3,2,o),plot(CMC_mean(o).F_aux,CMC_mean(o).mean_aux, 'b')
    hold on,
    subplot(3,2,o),plot(CMC_mean_REV(o).F_aux,CMC_mean_REV(o).mean_aux, 'r')
    hold on,
    subplot(3,2,o),title(['Coherence Mean, ',CMC_mean(o).name, ', ',signal_name]),
    subplot(3,2,o),xlabel('Frequency (Hz)'),grid, legend('CMC', 'REV CMC')
end
