% function f_PermTest2.m
% 
% Description:
% 
% Inputs:
% pv_Dist1: First distribution
% pv_Dist2: Second distribution
% ps_Alpha: Performs the test at the (100 * ps_Alpha) significance level
% 
% Outputs:
% s_H: 1 indicates a rejection of the null hypothesis; 0 otherwise. Mean,
% median, dispersion, t statistic
% s_P: p-value
% v_TDist: T values obtained for all permutations
% 
function [v_H, v_P, v_MeanDiffDist, v_MedianDiffDist, v_MeanDevDist, v_TDist] = ...
    f_PermTest2(pv_Dist1, pv_Dist2, ps_Alpha, ps_PermNum)

    v_H = [];
    v_P = [];
    v_TDist = [];
    
    if nargin < 2
        return;
    end
    
    if ~exist('ps_Alpha', 'var') || isempty(ps_Alpha)
        ps_Alpha = 0.05;
    end
    
    if ~exist('ps_PermNum', 'var') || isempty(ps_PermNum)
        ps_PermNum = 1000; % for p=0.05
    end    
    
    if ps_Alpha < 0 || ps_Alpha > 1
        display('[f_PermTest2] - ERROR: alpha must be >= 0 && <= 1!');
        return;
    end
    
    pv_Dist1 = pv_Dist1(:);
    pv_Dist2 = pv_Dist2(:);
    
    s_LenX = numel(pv_Dist1);
    s_LenY = numel(pv_Dist2);
    
    clear v_ArrayTemp
    v_ArrayTemp = pv_Dist1;
    v_ArrayTemp = f_AddVerElems(v_ArrayTemp, pv_Dist2);
    s_LenDbl = s_LenX + s_LenY;
    clear v_Ind v_TDist
    v_Ind = false(s_LenDbl, ps_PermNum);
    v_MeanDiffDist = zeros(ps_PermNum, 1);
    v_MedianDiffDist = zeros(ps_PermNum, 1);
    v_MeanDevDist = zeros(ps_PermNum, 1);
    v_TDist = zeros(ps_PermNum, 1);
    for s_PermCounter = 1:ps_PermNum
        while 1
            clear v_IndAux v_IndOrd
            v_IndOrd = false(s_LenDbl, 1);
            v_IndAux = randperm(s_LenDbl);
            v_IndOrd(v_IndAux(1:s_LenX)) = 1;
            v_IndOrd = v_Ind(:, 1:s_PermCounter - 1).* ...
                repmat(v_IndOrd, 1, s_PermCounter - 1);
            v_IndOrd = sum(v_IndOrd);
            if find(v_IndOrd == s_LenX, 1)
                continue;
            end
            v_IndAux = v_IndAux(1:s_LenX);
            break;
        end
        if s_PermCounter == 1 || mod(s_PermCounter, 50) == 0
            display(sprintf('[f_PermTest2] - Permutation %d / %d', s_PermCounter, ...
                ps_PermNum));
        end
        
        v_Ind(v_IndAux, s_PermCounter) = 1;
        
        s_MeanX = mean(v_ArrayTemp(v_Ind(:, s_PermCounter)));
        s_MeanY = mean(v_ArrayTemp(~v_Ind(:, s_PermCounter)));
        v_MeanDiffDist(s_PermCounter) = s_MeanX - s_MeanY;
        
        s_MedianX = median(v_ArrayTemp(v_Ind(:, s_PermCounter)));
        s_MedianY = median(v_ArrayTemp(~v_Ind(:, s_PermCounter)));
        v_MedianDiffDist(s_PermCounter) = s_MedianX - s_MedianY;
        
        v_MeanDevDist(s_PermCounter) = ...
            mean(v_ArrayTemp(v_Ind(:, s_PermCounter)) - s_MedianX) / ...
            mean(v_ArrayTemp(~v_Ind(:, s_PermCounter)) - s_MedianY);
        
        s_VarX = var(v_ArrayTemp(v_Ind(:, s_PermCounter)));
        s_VarY = var(v_ArrayTemp(~v_Ind(:, s_PermCounter)));
        
        v_TDist(s_PermCounter) = (v_MeanDiffDist(s_PermCounter)) / ...
            sqrt((s_VarX / s_LenX) + (s_VarY / s_LenY));
 
    end

    v_MeanDiffDist = sort(abs(v_MeanDiffDist));
    v_MedianDiffDist = sort(abs(v_MedianDiffDist));
    v_MeanDevDist = sort(abs(v_MeanDevDist));
    v_TDist = sort(abs(v_TDist));
    
    s_MeanX = mean(v_ArrayTemp(1:s_LenX));
    s_MeanY = mean(v_ArrayTemp(s_LenX + 1:end));
    s_MeanDiffRef = s_MeanX - s_MeanY;
    
    s_MedianX = median(v_ArrayTemp(1:s_LenX));
    s_MedianY = median(v_ArrayTemp(s_LenX + 1:end));
    s_MedianDiffRef = s_MedianX - s_MedianY;
    
    s_MeanDevRef = ...
        mean(v_ArrayTemp(1:s_LenX) - s_MedianX) / ...
        mean(v_ArrayTemp(s_LenX + 1:end) - s_MedianY);

    s_VarX = var(v_ArrayTemp(1:s_LenX));
    s_VarY = var(v_ArrayTemp(s_LenX + 1:end));
    s_TRef = (s_MeanX - s_MeanY) / sqrt((s_VarX / ...
        s_LenX) + (s_VarY / s_LenY));
    
    s_TotalStats = 4;
    s_StatCounter = 0;
    v_H = zeros(s_TotalStats, 1);
    v_P = zeros(s_TotalStats, 1);
    
    s_MeanDiffRef = abs(s_MeanDiffRef);
    s_MedianDiffRef = abs(s_MedianDiffRef);
    s_MeanDevRef = abs(s_MeanDevRef);
    s_TRef = abs(s_TRef);
    
    s_H = 0;
    s_P = find(v_MeanDiffDist > s_MeanDiffRef, 1);
    if isempty(s_P)
        s_P = 1 / (numel(v_MeanDiffDist) + 1);
        s_H = 1;
    else
        s_P = 1 - (s_P / numel(v_MeanDiffDist));
        if s_P <= ps_Alpha
            s_H = 1;
        end
    end
    s_StatCounter = s_StatCounter + 1;
    v_H(s_StatCounter) = s_H;
    v_P(s_StatCounter) = s_P;
    
    s_H = 0;
    s_P = find(v_MedianDiffDist > s_MedianDiffRef, 1);
    if isempty(s_P)
        s_P = 1 / (numel(v_MeanDiffDist) + 1);
        s_H = 1;
    else
        s_P = 1 - (s_P / numel(v_MedianDiffDist));
        if s_P <= ps_Alpha
            s_H = 1;
        end
    end
    s_StatCounter = s_StatCounter + 1;
    v_H(s_StatCounter) = s_H;
    v_P(s_StatCounter) = s_P;

    s_H = 0;
    s_P = find(v_MeanDevDist > s_MeanDevRef, 1);
    if isempty(s_P)
        s_P = 1 / (numel(v_MeanDiffDist) + 1);
        s_H = 1;
    else
        s_P = 1 - (s_P / numel(v_MeanDevDist));
        if s_P <= ps_Alpha
            s_H = 1;
        end
    end
    s_StatCounter = s_StatCounter + 1;
    v_H(s_StatCounter) = s_H;
    v_P(s_StatCounter) = s_P;

    s_H = 0;
    s_P = find(v_TDist > s_TRef, 1);
    if isempty(s_P)
        s_P = 1 / (numel(v_MeanDiffDist) + 1);
        s_H = 1;
    else
        s_P = 1 - (s_P / numel(v_TDist));
        if s_P <= ps_Alpha
            s_H = 1;
        end
    end
    s_StatCounter = s_StatCounter + 1;
    v_H(s_StatCounter) = s_H;
    v_P(s_StatCounter) = s_P;
return;
