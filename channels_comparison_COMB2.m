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
        str_MI=load(['./seminario5_MI/',signame,'_MI_signal8.mat']);
        MI_hists=str_MI.str_MI;
        str_MI_REV=load(['./seminario5_MI/',signame,'_MI_signal8REV.mat']);
        MI_hists_REV=str_MI_REV.str_MI;
        str_MI_COMB1=load(['./seminario5_MI/',signame,'_MI_signal8COMB1.mat']);
        MI_hists_COMB1=str_MI_COMB1.str_MI;
        str_MI_COMB2=load(['./seminario5_MI/',signame,'_MI_signal8COMB2.mat']);
        MI_hists_COMB2=str_MI_COMB2.str_MI;
        str_MI_RAND=load(['./seminario5_MI/',signame,'_MI_signal8RAND.mat']);
        MI_hists_RAND=str_MI_RAND.str_MI;
        if mod(p,3)==1
            p=1;
        elseif mod(p,3)==2
            p=2;
        elseif mod(p,3)==0
            p=3;
        end
        hold on,
        subplot(4,3,o),histogram(MI_hists(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_REV(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_COMB1(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_COMB2(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_RAND(p).MI,20)
        hold on,
        subplot(4,3,o),title(['Mutual Information, ',MI_hists(p).name, ', ',signame]),
        subplot(4,3,o),grid, legend('MI', 'REV MI', 'COMB1 MI', 'COMB2 MI', 'RAND MI')
        subplot(4,3,o), xlim([0 2])
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
        str_MI=load(['./seminario5_MI/',signame,'_MI_signal8.mat']);
        MI_hists=str_MI.str_MI;
        str_MI_REV=load(['./seminario5_MI/',signame,'_MI_signal8REV.mat']);
        MI_hists_REV=str_MI_REV.str_MI;
        str_MI_COMB1=load(['./seminario5_MI/',signame,'_MI_signal8COMB1.mat']);
        MI_hists_COMB1=str_MI_COMB1.str_MI;
        str_MI_COMB2=load(['./seminario5_MI/',signame,'_MI_signal8COMB2.mat']);
        MI_hists_COMB2=str_MI_COMB2.str_MI;
        str_MI_RAND=load(['./seminario5_MI/',signame,'_MI_signal8RAND.mat']);
        MI_hists_RAND=str_MI_RAND.str_MI;
        if mod(p,3)==1
            p=4;
        elseif mod(p,3)==2
            p=5;
        elseif mod(p,3)==0
            p=6;
        end
        hold on,
        subplot(4,3,o),histogram(MI_hists(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_REV(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_COMB1(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_COMB2(p).MI,20)
        hold on,
        subplot(4,3,o),histogram(MI_hists_RAND(p).MI,20)
        hold on,
        subplot(4,3,o),title(['Mutual Information, ',MI_hists(p).name, ', ',signame]),
        subplot(4,3,o),grid, legend('MI', 'REV MI', 'COMB1 MI', 'COMB2 MI', 'RAND MI')
        subplot(4,3,o), xlim([0 2])
        p=p+1;
    end
end