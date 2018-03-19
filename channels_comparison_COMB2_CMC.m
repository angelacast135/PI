signal_name=cell(1,1);
signal_name{1}='Lozeron130919';
signal_name{2}='Lozeron08092016';
signal_name{3}='Milani08092106';
signal_name{4}='Milani150916';
% signame=signal_name{1}; str_MI=load(['./seminario5_MI/',signame,'_MI_signal8.mat']); MI_hists=str_MI.str_MI;
figure,
p=1;
for oo = 1:length(signal_name)
    for o = 1:length(signal_name)-1
        if oo == 2
            o=o+3;
        elseif oo == 3
            o=o+6;
        elseif oo == 4
            o=o+9;
        else 
            o=o;
        end
            
        signame=signal_name{oo};
        str_CMC=load(['./seminario5/',signame,'_CMC_signal8.mat']);
        CMC_mean=str_CMC.str_mean_cohere;
        str_CMC_REV=load(['./seminario5/',signame,'_CMC_signal8REV.mat']);
        CMC_mean_REV=str_CMC_REV.str_mean_cohere;
        str_CMC_COMB1=load(['./seminario5/',signame,'_CMC_signal8COMB1.mat']);
        CMC_mean_COMB1=str_CMC_COMB1.str_mean_cohere;
        str_CMC_COMB2=load(['./seminario5/',signame,'_CMC_signal8COMB2.mat']);
        CMC_mean_COMB2=str_CMC_COMB2.str_mean_cohere;
        if mod(p,3)==1
            p=1;
        elseif mod(p,3)==2
            p=2;
        elseif mod(p,3)==0
            p=3;
        end
        hold on,
        subplot(4,3,o),plot(CMC_mean(p).F_aux,CMC_mean(p).mean_aux)%, 'b')
        hold on,
        subplot(4,3,o),plot(CMC_mean_REV(p).F_aux,CMC_mean_REV(p).mean_aux)%, 'r')
        hold on,
        subplot(4,3,o),plot(CMC_mean_COMB1(p).F_aux,CMC_mean_COMB1(p).mean_aux)%, 'r')
        hold on,
        subplot(4,3,o),plot(CMC_mean_COMB2(p).F_aux,CMC_mean_COMB2(p).mean_aux)%, 'r')
        hold on,
        subplot(4,3,o),title(['Coherence Mean, ',CMC_mean(p).name, ', ',signame]),
        subplot(4,3,o),xlabel('Frequency (Hz)'),grid, legend('CMC', 'R-CMC','C1-CMC','C2-CMC')
        subplot(4,3,o), xlim([8 50])
        p=p+1;
    end
end


figure,
p=1;
for oo = 1:length(signal_name)
    for o = 1:length(signal_name)-1
        if oo == 2
            o=o+3;
        elseif oo == 3
            o=o+6;
        elseif oo == 4
            o=o+9;
        else 
            o=o;
        end
            
        signame=signal_name{oo};
        str_CMC=load(['./seminario5/',signame,'_CMC_signal8.mat']);
        CMC_mean=str_CMC.str_mean_cohere;
        str_CMC_REV=load(['./seminario5/',signame,'_CMC_signal8REV.mat']);
        CMC_mean_REV=str_CMC_REV.str_mean_cohere;
        str_CMC_COMB1=load(['./seminario5/',signame,'_CMC_signal8COMB1.mat']);
        CMC_mean_COMB1=str_CMC_COMB1.str_mean_cohere;
        str_CMC_COMB2=load(['./seminario5/',signame,'_CMC_signal8COMB2.mat']);
        CMC_mean_COMB2=str_CMC_COMB2.str_mean_cohere;
        if mod(p,3)==1
            p=4;
        elseif mod(p,3)==2
            p=5;
        elseif mod(p,3)==0
            p=6;
        end
        hold on,
        subplot(4,3,o),plot(CMC_mean(p).F_aux,CMC_mean(p).mean_aux)%, 'b')
        hold on,
        subplot(4,3,o),plot(CMC_mean_REV(p).F_aux,CMC_mean_REV(p).mean_aux)%, 'r')
        hold on,
        subplot(4,3,o),plot(CMC_mean_COMB1(p).F_aux,CMC_mean_COMB1(p).mean_aux)%, 'r')
        hold on,
        subplot(4,3,o),plot(CMC_mean_COMB2(p).F_aux,CMC_mean_COMB2(p).mean_aux)%, 'r')
        hold on,
        subplot(4,3,o),title(['Coherence Mean, ',CMC_mean(p).name, ', ',signame]),
        subplot(4,3,o),xlabel('Frequency (Hz)'),grid, legend('CMC', 'R-CMC','C1-CMC','C2-CMC')
        subplot(4,3,o), xlim([8 50])
        
        p=p+1;
    end
end
