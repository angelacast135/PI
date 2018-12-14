% function f_AddHorElems.m
% 
function m_Matrix = ...
    f_AddHorElems(...
    pm_Matrix, ...
    pm_NewElems)

    if isempty(pm_Matrix)
        m_Matrix = pm_NewElems;
        return;
    end
    
    if isempty(pm_NewElems)
        m_Matrix = pm_Matrix;
        display('[f_AddHorElems] - WARNING: new matrix is empty!')
        return;
    end    
    
    if size(pm_Matrix, 1) ~= size(pm_NewElems, 1)
        error('[f_AddHorElems] - ERROR: matrices have not the same size!')
    end
    
    s_LastSize = size(pm_Matrix, 2);
    s_NewSize = s_LastSize + size(pm_NewElems, 2);
    m_Matrix = zeros(size(pm_Matrix, 1), s_NewSize);
    m_Matrix(:, 1:s_LastSize) = pm_Matrix;
    m_Matrix(:, s_LastSize + 1:end) = pm_NewElems;

return;