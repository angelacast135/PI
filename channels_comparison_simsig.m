signal_name=cell(1,1);
signal_name{1}='Lozeron130919';
signal_name{2}='Lozeron08092016';
signal_name{3}='Milani08092106';
signal_name{4}='Milani150916';
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
        str_MI_AMP=load(['./seminario5_MI/hists_2sigs/',signame,'simsignal_AMP_MI_signal8.mat']);
        MI_hists_AMP=str_MI_AMP.str_MI;
        str_MI_20=load(['./seminario5_MI/hists_2sigs/',signame,'simsignal20Hz_filt15-40_MI_signal8.mat']);
        MI_hists_20=str_MI_20.str_MI;
        str_MI_filt=load(['./seminario5_MI/hists_2sigs/',signame,'simsignal_filt15-40_MI_signal8.mat']);
        MI_hists_filt=str_MI_filt.str_MI;
        if mod(p,3)==1
            p=1;
        elseif mod(p,3)==2
            p=2;
        elseif mod(p,3)==0
            p=3;
        end
        hold on,
        subplot(4,3,o),histogram(MI_hists_AMP(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_filt(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_20(p).MI,20)
        hold on,
        subplot(4,3,o),title(['Mutual Information, simulated EEG ',signame]),
        subplot(4,3,o),grid, legend('AMP', 'Filt_{15-40}', '20Hz')
%         subplot(4,3,o), xlim([0 2])
        p=p+1;
    end
end

figure,
p=1;
for oo = 1:length(signal_name)
    for o=1:length(signal_name)-1
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
        str_MI_AMP=load(['./seminario5_MI/hists_2sigs/',signame,'simsignal_AMP_MI_signal8.mat']);
        MI_hists_AMP=str_MI_AMP.str_MI;
        str_MI_20=load(['./seminario5_MI/hists_2sigs/',signame,'simsignal20Hz_filt15-40_MI_signal8.mat']);
        MI_hists_20=str_MI_20.str_MI;
        str_MI_filt=load(['./seminario5_MI/hists_2sigs/',signame,'simsignal_filt15-40_MI_signal8.mat']);
        MI_hists_filt=str_MI_filt.str_MI;
        if mod(p,3)==1
            p=4;
        elseif mod(p,3)==2
            p=5;
        elseif mod(p,3)==0
            p=6;
        end
        hold on,
        subplot(4,3,o),histogram(MI_hists_AMP(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_filt(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_20(p).MI,20)
        hold on,
        subplot(4,3,o),title(['Mutual Information, simulated EEG ',signame]),
        subplot(4,3,o),grid, legend('AMP', 'Filt_{15-40}', '20Hz')
%         subplot(4,3,o), xlim([0 2])
        p=p+1;
    end
end