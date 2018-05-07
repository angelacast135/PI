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
        str_cc_1=load(['./seminario5_corrcoef/hists_2v2/',signame,'_cc_signal8_1-6.mat']);%%%%%%%%%%%%%%%
        cc_hists=str_cc_1.str_corrcoef;%%%%%
        
        if mod(p,3)==1
            p=1;
        elseif mod(p,3)==2
            p=2;
        elseif mod(p,3)==0
            p=3;
        end
        
        hold on,
        subplot(4,3,o),plot((cc_hists(p).time_means)-2, cc_hists(p).mean_AB_cc )%%%%%%%%%%%%%%%%%%
        hold on,
        subplot(4,3,o),title(['Correlation Coefficient, ',cc_hists(p).name, ', ',signame]),%%%%%%%%%%%%%%%
        subplot(4,3,o),grid,xlabel('Time (s)')
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
        str_cc_1=load(['./seminario5_corrcoef/hists_2v2/',signame,'_cc_signal8_1-6.mat']);%%%%%%%%%%%%%%%%%%%%%%%
        cc_hists=str_cc_1.str_corrcoef;%%%%%%%%%%%%%%%%%%%%%%
        if mod(p,3)==1
            p=4;
        elseif mod(p,3)==2
            p=5;
        elseif mod(p,3)==0
            p=6;
        end
        hold on,
        subplot(4,3,o),plot((cc_hists(p).time_means)-2, cc_hists(p).mean_AB_cc )%%%%%%%%%%%%%%%%%%%%%%%
        hold on,
        subplot(4,3,o),title(['Correlation Coefficient, ',cc_hists(p).name, ', ',signame]),%%%%%%%%%%%%%%%
        subplot(4,3,o),grid, xlabel('Time (s)')
        p=p+1;
    end
end