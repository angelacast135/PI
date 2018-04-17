format long
% run('../mvgc_v1.0/startup.m') %%%%%%%%%%%%%%%%%%%%%%%%%%%%
oo=1; c_signal_name=cell(1,1);
c_signal_name{1}='Lozeron130919';
c_signal_name{2}='Lozeron08092016';
c_signal_name{3}='Milani08092106';
c_signal_name{4}='Milani150916';
c_signal_name{5}='Diab1catalina';
signal_name=c_signal_name{oo};
[st_Header, m_SignalsMat] = edfread([signal_name,'.edf']); % a=rand(1,10000); b=filtfilt(SOS, G, a); figure;plot(b)
str_GC=struct;
for kk=1:6%%%%%%%%%%%%%%%%%%%%%%%%%%%
    k_1 = kk; %signal EEG
    k_2 = 8; %signal EMG %%%%%%%%%%%%%%%%%%%%%%%%%
    Fs = st_Header.samples(k_1);
    t = 0:1/Fs:1-1/Fs; %Time
%     load('G.mat'), load('SOS.mat')
    x_raw = m_SignalsMat(k_1,:);
    x = x_raw; %filtfilt(SOS, G, x_raw);
    y_raw = m_SignalsMat(k_2,:);
    y = y_raw; %filtfilt(SOS, G, y_raw);
    load([signal_name,'.mat']);
    lab=st_Header.label(kk);
    figure,
    k=1;
    subplot(221),plot(x),
    hold on,
    subplot(221),plot(v_TimeStartEvts(k)*Fs,x(v_TimeStartEvts(k)*Fs),'ro')
    subplot(222),plot(y),
    hold on,
    subplot(222),plot(v_TimeStartEvts(k)*Fs,y(v_TimeStartEvts(k)*Fs),'ro')
    for k=1:length(v_TimeStartEvts)
        t1=v_TimeStartEvts(k)*Fs+Fs*0.5;
        t2=t1+Fs*1.5;
        hold on,
        subplot(221),plot(t1,x(t1),'go')
        subplot(221),plot(t2,x(t2),'ko')
        subplot(222),plot(t1,y(t1),'go')
        subplot(222),plot(t2,y(t2),'ko')
    end
    subplot(221), title(['Muscular contraction. Signal ',num2str(kk),' ',lab{1}]),xlabel('Time (s)'),grid
    subplot(222), title(['Muscular contraction. Signal ',num2str(k_2),' EMG']),xlabel('Time (s)'),grid
    %     figure
    
%     X=zeros(2,length(x(t1:t2)),length(v_TimeStartEvts));
    for k=1:length(v_TimeStartEvts)
        t1=v_TimeStartEvts(1)*Fs+Fs*0.5;
%         t_aux=v_TimeStartEvts(end)*Fs+Fs*0.5;
        t2=t1+Fs*1.5;
        X(1,:)=x(t1:t2);%+min(x(t1:t2));
        X(2,:)=y(t1:t2);%+min(y(t1:t2));
    
    regmode   = 'OLS';  % VAR model estimation regression mode ('OLS', 'LWR' or empty for default)
    morder    = 'BIC';  % model order to use ('actual', 'AIC', 'BIC' or supplied numerical value)
    acmaxlags = [];   % maximum autocovariance lags (empty for automatic calculation)
    icregmode = 'LWR';  % information criteria regression mode ('OLS', 'LWR' or empty for default)
    momax     = 20;     % maximum model order for model order estimation
    [AIC,BIC,moAIC,moBIC] = tsdata_to_infocrit(X,momax,icregmode);
    if     strcmpi(morder,'actual')
        morder = amo;
        fprintf('\nusing actual model order = %d\n',morder);
    elseif strcmpi(morder,'AIC')
        morder = moAIC;
        fprintf('\nusing AIC best model order = %d\n',morder);
    elseif strcmpi(morder,'BIC')
        morder = moBIC;
        fprintf('\nusing BIC best model order = %d\n',morder);
    else
        fprintf('\nusing specified model order = %d\n',morder);
    end
    [A,SIG] = tsdata_to_var(X,morder,regmode);
    [G,info] = var_to_autocov(A,SIG,acmaxlags);
    fres      = [];     % frequency resolution (empty for automatic calculation)
    f = autocov_to_spwcgc(G,fres);
    assert(~isbad(f,false),'spectral GC calculation failed');
    % Plot spectral causal graph.figure(3); clf;
    fs        = 256;    % sample rate (Hz)
    plot_spw(f,fs);
    end
        str_GC(kk).freqs=f;
    %     str_GC(kk).P_arrays=P_array;
    %     str_GC(kk).F_hist=histogram(F_array,25);
    %     str_GC(kk).P_hist=histogram(P_array,25);
    str_GC(kk).name=lab{1};
    
    hold on,
    subplot(223),histogram(F_array,25);title('Distribution of F   ');xlabel('F'); ylabel('No. of Occurences');
    hold on,
    subplot(224),histogram(P_array,25);title('Distribution of Prob(F) ');xlabel('prob value returned');ylabel('No. of Occurences');
    
    %     pause
end
% save(['./seminario5_GC/',signal_name,'_GC_signal',num2str(k_2),'.mat'], 'str_GC')