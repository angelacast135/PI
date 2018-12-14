% f_SelectEventsGUI.m
% 

function f_SelectEventsGUI()

    clc
    addpath('../../Functions/');

    % str_FileName = 'testLaurence-tout-trace';
    % s_Inv = 1;

    % str_FileName = 'testPierre-tout-trace';
    % s_Inv = -1;

    % str_FileName = 'pierre_10_C3-Fz';
    % s_Inv = 1;
    % v_TimeSegs = [24 287;298.5 596];
    % v_TimeRef = [188.5 190;239 241;418 420];

%     str_FileName = 'paolo_10_C3F3P3-cz2';
%     v_TimeSegs = [55 624];
%     s_SigInd = 5;
%     s_PeakLevelTres = 20;

%     str_FileName = 'Pierre10_forcemax';
%     v_TimeSegs = [25 595];
%     s_SigInd = 5;
%     s_PeakLevelTres = 20;

%     str_FileName = 'arlette 10-6-14';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 5;
%     s_PeakLevelTres = 20;
    
%     str_FileName = 'diabete-2';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 3;
%     s_PeakLevelTres = 20;
    
%     str_FileName = 'Cyril-AgH';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 2;
%     s_PeakLevelTres = 10;
    
%     str_FileName = 'david-vision';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 2;
%     s_PeakLevelTres = 10;
    
%     str_FileName = 'LOIC_03-07-14';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 5;
%     s_PeakLevelTres = 10;    
    
%     str_FileName = 'marion_03-07-14';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 5;
%     s_PeakLevelTres = 10;    
    
%     str_FileName = 'didier 08-07-14';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 5;
%     s_PeakLevelTres = 10;    
    
%     str_FileName = 'Ahmed 07-07-14';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 5;
%     s_PeakLevelTres = 10;

%     str_FileName = 'Catherine 07-07-14';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 5;
%     s_PeakLevelTres = 10;  
    
%     str_FileName = 'paolo 15-1-2015-1';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 5;
%     s_PeakLevelTres = 10; 
    
%     str_FileName = 'pierre 15-1-2015-1';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 5;
%     s_PeakLevelTres = 10;
    
%     str_FileName = 'pierre 15-1-2015-2';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 5;
%     s_PeakLevelTres = 10;    

%     str_FileName = 'pierre _2015-05-18';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 2;
%     s_PeakLevelTres = 10; 

%     str_FileName = 'paolo _2015-05-18';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 3;
%     s_PeakLevelTres = 10; 
    
%     str_FileName = 'paolo _2015-05-19';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10; 

%     str_FileName = 'anne01-09-15';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10; 
%     
%     str_FileName = 'david01-09-15';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;     
    
%     str_FileName = 'thibault 23-07-15';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;    
    
%     str_FileName = 'valentin 23-07-15';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;       

%     str_FileName = 'thibaud6-10-15';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;   

%     str_FileName = 'paolomilani_11-23';
%     v_TimeSegs = [0 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;   
    
%     str_FileName = 'pierrelozeron_11-23';
%     v_TimeSegs = [375 635;690 1070;1415 2110];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;  
    
%     str_FileName = 'PL26-11-15';
%     v_TimeSegs = [410 1075];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;    
    
%     str_FileName = 'pm26-11-15';
%     v_TimeSegs = [375 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;   

%     str_FileName = 'Lozeron08092016'; % Constant force
%     v_TimeSegs = [0 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;  
    
%     str_FileName = 'Lozeron130919'; % Variable force
%     v_TimeSegs = [0 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;  

%     str_FileName = 'Milani08092106'; % Constant force
%     v_TimeSegs = [0 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;  

%     str_FileName = 'Milani150916'; % Variable force
%     v_TimeSegs = [0 -1];
%     s_SigInd = 8;
%     s_PeakLevelTres = 10;  

    str_FileName = 'laurier_micka';
    v_TimeSegs = [0 -1];
    s_SigInd = 8;
    s_PeakLevelTres = 10;  


    str_FileFullName = ['./CoherenceMario/' str_FileName '.edf'];
    str_DataFileName = ['./CoherenceMario/' str_FileName '.mat'];

    if ~exist(str_FileFullName, 'file')
        error('[p_DataAnalysis_01] - The following file does not exist: %s', ...
            str_FileFullName);
    end

    [st_Header, m_SignalsMat] = edfread(str_FileFullName);
    s_SRate = st_Header.samples(1);

    v_EMGSigs = m_SignalsMat(s_SigInd, :)';
    v_Time = (0:size(v_EMGSigs, 1) - 1)./ s_SRate;

    st_Filt = f_GetIIRFilter(s_SRate, [10 30]);
    v_EMGFiltSigs = f_IIRBiFilter(v_EMGSigs, st_Filt);
%     v_EMGFiltEnvSigs = abs(v_EMGFiltSigs);
%     v_EMGFiltEnvSigs = abs(hilbert(v_EMGFiltSigs));

    s_RMSHalfSeg = (1 / 20) * 3;
    s_RMSHalfSam = round(s_RMSHalfSeg * s_SRate);

    % v_EMGFiltRMSSigs = f_RMSSignal(v_EMGFiltSigs, s_RMSHalfSam);
    v_EMGFiltRMSSigs = filter(ones(1, s_RMSHalfSam), 1, v_EMGFiltSigs.^2)./ s_RMSHalfSam;
    v_EMGFiltRMSSigs = sqrt(v_EMGFiltRMSSigs);

    figure;
    s_Axes1 = subplot(1, 1, 1);
    plot(v_Time, v_EMGSigs)
    v_Axe1Lims = get(s_Axes1, 'YLim');
    set(s_Axes1, 'YLim', v_Axe1Lims);
    hold on
    plot(v_Time, v_EMGFiltRMSSigs, 'r')
    plot(v_Time, v_EMGFiltSigs, 'r')
    hold on
    if exist(str_DataFileName, 'file')
        v_TimeStartEvts = load(str_DataFileName, 'v_TimeStartEvts');
        v_TimeStartEvts = v_TimeStartEvts.v_TimeStartEvts;
        
        s_Min = min([min(v_EMGSigs) min(v_EMGFiltRMSSigs)]);
        s_Max = max([max(v_EMGSigs) max(v_EMGFiltRMSSigs)]);
        s_Dis = (s_Max - s_Min) * 0.05;
        s_Min = s_Min - s_Dis;
        s_Max = s_Max + s_Dis;
        ylim([s_Min s_Max]);
        
        for s_Counter = 1:numel(v_TimeStartEvts)
            plot([v_TimeStartEvts(s_Counter) v_TimeStartEvts(s_Counter)], ...
                [s_Min s_Max], 'k');
        end
        
        clear v_TimeStartEvts
        
        return;
    end

    v_SigTemp = [];
    v_SigFiltTemp = [];
    v_TimeTemp = [];
    for s_SegsCounter = 1:size(v_TimeSegs, 1)
        if v_TimeSegs(s_SegsCounter, 1) == 0
            s_FirstIndSam = 1;
        else
            s_FirstIndSam = round(v_TimeSegs(s_SegsCounter, 1) * s_SRate);
        end
        
        if v_TimeSegs(s_SegsCounter, 2) == -1
            s_LastIndSam = numel(v_EMGSigs);
        else
            s_LastIndSam = round(v_TimeSegs(s_SegsCounter, 2) * s_SRate);
        end

        v_SigTemp = f_AddVerElems(v_SigTemp, v_EMGFiltRMSSigs(s_FirstIndSam:s_LastIndSam));
        v_SigFiltTemp = f_AddVerElems(v_SigFiltTemp, v_EMGFiltSigs(s_FirstIndSam:s_LastIndSam));
        v_TimeTemp = f_AddHorElems(v_TimeTemp, v_Time(s_FirstIndSam:s_LastIndSam));
    end

    [v_HistY, v_HistX] = hist(v_SigTemp, 100);
    [v_Peaks, v_Ind] = findpeaks(-1.* v_HistY);
    s_Ind = v_Ind(1);
    s_StdThres = v_HistX(v_Ind(1));
    s_Max = v_Peaks(1);
    for s_Counter = 2:numel(v_Ind)
        if v_HistX(v_Ind(s_Counter)) >= s_PeakLevelTres
            break;
        end
        if v_Peaks(s_Counter) > s_Max
            s_Ind = v_Ind(s_Counter);
            s_StdThres = v_HistX(s_Ind);
            s_Max = v_Peaks(s_Counter);
        end
    end

    figure;
    plot(v_HistX, v_HistY)
    s_Min = min(v_HistY);
    s_Max = max(v_HistY);
    s_Dis = (s_Max - s_Min) * 0.05;
    s_Min = s_Min - s_Dis;
    s_Max = s_Max + s_Dis;
    ylim([s_Min s_Max]);
    hold on
    plot([s_StdThres s_StdThres], [s_Min s_Max], 'r');
    
    
    v_SigTemp = v_EMGFiltRMSSigs;
    v_SigFiltTemp = v_EMGFiltSigs;
    v_TimeTemp = v_Time;
    

    v_SigTemp = v_SigTemp > s_StdThres;
    v_Ind = zeros(numel(v_SigTemp), 1);
    v_Ind(2:end) = diff(v_SigTemp);
    v_Ind(1) = v_Ind(2);
    v_IndStart = find(v_Ind == 1);
%     v_IndStop = v_Ind == -1;
% 
%     s_Ind = 1;
%     while v_IndStop(s_Ind) <= v_IndStart(1)
%         s_Ind = s_Ind + 1;
%     end

%     v_IndStop = v_IndStop(s_Ind:end);

%     if numel(v_IndStart) > numel(v_IndStop)
%         v_IndStart = v_IndStart(1:end - 1);
%     end

    s_BefSec = 10;
    s_AftSec = 10;
    
    s_BefSam = s_BefSec * s_SRate;
    s_AftSam = s_AftSec * s_SRate;
    
    v_IndStart = [v_IndStart zeros(numel(v_IndStart), 1)];
    
    
    s_Fig = figure;
    s_Axes = subplot(1,1,1);
    plot(v_SigFiltTemp./ max(v_SigFiltTemp))
    hold on
    plot(v_SigTemp, 'r')    
    
    s_Counter = 1;
    while s_Counter <= size(v_IndStart, 1)
        
        s_FisrtSam = v_IndStart(s_Counter, 1) - s_BefSam;
        s_LastSam = v_IndStart(s_Counter, 1) + s_AftSam;
        
        if s_FisrtSam < 1
            s_FisrtSam = 1;
        end
        if s_LastSam > numel(v_SigFiltTemp)
            s_LastSam = numel(v_SigFiltTemp);
        end
        
        s_FisrtSamAux = round(v_IndStart(s_Counter, 1) - 20 * s_SRate);
        s_LastSamAux = round(v_IndStart(s_Counter, 1) + 20 * s_SRate);
        if s_FisrtSamAux < 1
            s_FisrtSamAux = 1;
        end
        if s_LastSamAux > numel(v_SigFiltTemp)
            s_LastSamAux = numel(v_SigFiltTemp);
        end 
        v_Axe1Lims = [min(v_EMGSigs(s_FisrtSamAux:s_LastSamAux)) max(v_EMGSigs(s_FisrtSamAux:s_LastSamAux))];
        axes(s_Axes1);
        plot([(v_IndStart(s_Counter, 1) / s_SRate) (v_IndStart(s_Counter, 1) / s_SRate)], ...
            v_Axe1Lims, 'k');
        set(s_Axes1, 'XLim', [(s_FisrtSamAux / s_SRate) (s_LastSamAux / s_SRate)], ...
            'YLim', v_Axe1Lims);
        
        
        axes(s_Axes);
        xlim([s_FisrtSam s_LastSam]);
        ylim([-1.5 1.5]);
        hold on
        plot([v_IndStart(s_Counter, 1) v_IndStart(s_Counter, 1)], [-1.5 1.5], 'g');
        hold off
        
        s_W = 0;
        while s_W ~= 1
            s_W = waitforbuttonpress;
        end
        
        s_W = get(s_Fig, 'CurrentCharacter');
        switch s_W
            case 'i',
                v_IndStart(s_Counter, 2) = 1;
                hold on
                plot([v_IndStart(s_Counter, 1) v_IndStart(s_Counter, 1)], [-1.5 1.5], 'k');
                hold off
                s_Counter = s_Counter + 1;
                
            case 'e',
                v_IndStart(s_Counter, 2) = 0;
                hold on
                plot([v_IndStart(s_Counter, 1) v_IndStart(s_Counter, 1)], [-1.5 1.5], 'w');
                plot([v_IndStart(s_Counter, 1) v_IndStart(s_Counter, 1)], [0 1], 'r');
                hold off
                s_Counter = s_Counter + 1;
                
            case 'r',
                s_Counter = s_Counter - 1;
                
            case 's',
                v_Ind = v_IndStart(:, 2) == 1;
                v_TimeStartEvts = v_TimeTemp(v_IndStart(v_Ind, 1));
                save(str_DataFileName, 'v_TimeStartEvts');
                display(sprintf('[f_SelectEventsGUI] - Saved file: %s', ...
                    str_DataFileName));
                
            otherwise,
        end
    end
    
    v_Ind = v_IndStart(:, 2) == 1;
    v_TimeStartEvts = v_TimeTemp(v_IndStart(v_Ind, 1));
    save(str_DataFileName, 'v_TimeStartEvts');
    display(sprintf('[f_SelectEventsGUI] - Saved file: %s', ...
        str_DataFileName));
end

