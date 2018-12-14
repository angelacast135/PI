% function f_AddVerElems.m
% 
function m_Matrix = ...
    f_AddVerElems(...
    pm_Matrix, ...
    pm_NewElems)

    if isempty(pm_Matrix)
        m_Matrix = pm_NewElems;
        return;
    end
    
    if isempty(pm_NewElems)
        m_Matrix = pm_Matrix;
        display('[f_AddVerElems] - WARNING: new matrix is empty!')
        return;
    end    
    
    if size(pm_Matrix, 2) ~= size(pm_NewElems, 2)
        error('[f_AddVerElems] - ERROR: matrices have not the same size!')
    end
    
    s_LastSize = size(pm_Matrix, 1);
    s_NewSize = s_LastSize + size(pm_NewElems, 1);
    m_Matrix = zeros(s_NewSize, size(pm_Matrix, 2));
    m_Matrix(1:s_LastSize, :) = pm_Matrix;
    m_Matrix(s_LastSize + 1:end, :) = pm_NewElems;

return;