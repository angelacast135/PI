%% Análisis estadístico de potencia en el tiempo para sujetos en Theta/Beta
clear all 
close all
clc

% Paths
addpath('C:\Users\Valentina\OneDrive - Universidad de Los Andes\Collaborative_Neurofeedback\Proyecto_Grado\MicromedIP\Matlab\Results\W_Trigger\Ok\Theta_Beta\Common_Data\Signal_Data\Without_Outliers\Final_Data');
addpath('C:\Users\Valentina\OneDrive - Universidad de Los Andes\Collaborative_Neurofeedback\Publicación')
addpath('Functions');
%% Test de Permutaciones para todos los sujetos en Theta/Beta
% Todo el registro (potencia absoluta) en individual vs todo el registro 
% en colaborativo para cada sujeto 

% Data 
load('v_InitPSD_I_Data.mat'); % Matriz con los datos de todos los sujetos para el BL inicial
load('v_AnaPSD_I_Data.mat');  % Matriz con los datos de todos los sujetos para el tiempo activo
load('v_EndPSD_I_Data.mat');  % Matriz con los datos de todos los sujetos para el BL final

load('v_InitPSD_C_Data.mat'); % Matriz con los datos de todos los sujetos para el BL inicial
load('v_AnaPSD_C_Data.mat');  % Matriz con los datos de todos los sujetos para el tiempo activo
load('v_EndPSD_C_Data.mat');  % Matriz con los datos de todos los sujetos para el BL final

% Power in time
v_PowInd = vertcat(v_InitPSD_I_Data,v_AnaPSD_I_Data,v_EndPSD_I_Data); % Matriz con todos los datos para el protocolo individual
v_PowCol = vertcat(v_InitPSD_C_Data,v_AnaPSD_C_Data,v_EndPSD_C_Data); % Matriz con todos los datos para el protocolo colaborativo

% Parámetros test de permutaciones 
s_Cols = size(v_PowInd,2);     % Número de sujetos 
s_Alpha = 0.05;                % Nivel de confianza alfa
s_Perm = 1600;                 % Número de permutaciones a realizar
% c_StatResSub = cell(s_Cols,1); % Celda para guardar los resultados de cada sujeto

% for s_SubCount = 1: s_Cols
%     fprintf('\n \n[p_PermTestsPow] - Total Time Subject %d / %d \n', s_SubCount, s_Cols);
%     
%     v_PowSubInd = v_PowInd(:,s_SubCount); % Obtener los datos del sujeto
%     v_PowSubInd(v_PowSubInd == 0) = [];   % Eliminar los ceros 
%         
%     v_PowSubCol = v_PowCol(:,s_SubCount); % Obtener los datos del colaborativo
%     v_PowSubCol(v_PowSubCol == 0) = [];   % Eliminar los ceros
%     
%     
%     % Test de permutación
%     % v_StatTest: 1 si son significativamente distintos. 4 columnas: (1)
%     % Diferencia de medias, (2) Diferencia de medianas, (3) Diferencia de
%     % disperción, (4) Diferencia de los estadísticos t. 
%     % v_pValue: Valores p para las mismas 4 diferencias mencionadas arriba    
%     [v_StatTest, v_pValue] = f_PermTest2(v_PowSubInd,v_PowSubCol, s_Alpha, s_Perm);
%     c_StatResSub{s_SubCount,1} = struct('StatTest',v_StatTest,'pValue',v_pValue);
% end

%% Test de permutación para la diferencia entre el protocolo individual y 
 % colaborativo en potencia media en todo el tiempo
 
% Media de la potencia (absoluta) de todo el registro en individual de 
% todos los sujetos (vector de 8 posiciones) vs la media de la potencia de 
% todo el registro en colaborativo de todos los sujetos (vector de 8 posiciones) 

% Mediana de la potencia (absoluta) de todo el registro en individual de 
% todos los sujetos (vector de 8 posiciones) vs la mediana de la potencia 
% de todo el registro en colaborativo de todos los sujetos (vector de 8 posiciones) 

% st_MeanRes = struct('StatTest',[],'pValue',[]); % Estructura para guardar los resultados por media
% st_MedianRes = struct('StatTest',[],'pValue',[]); % Estructura para guardar los resultados por mediana
% 
% v_MeanPowInd = zeros(1,s_Cols);
% v_MeanPowCol = zeros(1,s_Cols);
% 
% v_MedianPowInd = zeros(1,s_Cols);
% v_MedianPowCol = zeros(1,s_Cols);
% 
% for s_SubCount = 1:s_Cols
%     v_MeanPowInd(s_SubCount) = mean(nonzeros(v_PowInd(:,s_SubCount)));
%     v_MeanPowCol(s_SubCount) = mean(nonzeros(v_PowCol(:,s_SubCount)));
%     
%     v_MedianPowInd(s_SubCount) = median(nonzeros(v_PowInd(:,s_SubCount)));
%     v_MedianPowCol(s_SubCount) = median(nonzeros(v_PowCol(:,s_SubCount)));
% end
% 
% % Utilizando la media de la potencia
% fprintf('[p_PermTestsPow] - Mean Test');
% [v_StatTestMean, v_pValueMean] = f_PermTest2(v_MeanPowInd,v_MeanPowCol, s_Alpha, s_Perm);
% st_MeanRes.StatTest = v_StatTestMean;
% st_MeanRes.pValue = v_pValueMean;
% 
% % Utilizando la mediana de la potencia 
% fprintf('[p_PermTestsPow] - Median Test');
% [v_StatTestMedian, v_pValueMedian] = f_PermTest2(v_MedianPowInd,v_MedianPowCol, s_Alpha, s_Perm);
% st_MedianRes.StatTest = v_StatTestMedian;
% st_MedianRes.pValue = v_pValueMedian;

%% Test de Permutaciones para todos los sujetos en Mu sólo en tiempo activo
% Registro de la tarea (potencia absoluta) en protocolo individual vs
% registro de la tarea en protocolo colaborativo para cada sujeto 

% Power in time
% v_PowIndActive = v_AnaPSD_I_Data; % Matriz con todos los datos para el protocolo individual
% v_PowColActive = v_AnaPSD_C_Data; % Matriz con todos los datos para el protocolo colaborativo
% 
% % Parámetros test de permutaciones 
% c_StatResActiveSub = cell(s_Cols,1); % Celda para guardar los resultados de cada sujeto
% 
% for s_SubCount = 1: s_Cols
%     fprintf('\n \n[p_PermTestsPow] - Active Time Subject %d / %d \n', s_SubCount, s_Cols);
%     
%     v_PowSubInd = v_PowIndActive(:,s_SubCount); % Obtener los datos del sujeto
%     v_PowSubInd(v_PowSubInd == 0) = [];         % Eliminar los ceros 
%         
%     v_PowSubCol = v_PowColActive(:,s_SubCount); % Obtener los datos del colaborativo
%     v_PowSubCol(v_PowSubCol == 0) = [];         % Eliminar los ceros
%         
%     % Test de permutación
%     % v_StatTest: 1 si son significativamente distintos. 4 columnas: (1)
%     % Diferencia de medias, (2) Diferencia de medianas, (3) Diferencia de
%     % disperción, (4) Diferencia de los estadísticos t. 
%     % v_pValue: Valores p para las mismas 4 diferencias mencionadas arriba    
%     [v_StatTest, v_pValue] = f_PermTest2(v_PowSubInd,v_PowSubCol, s_Alpha, s_Perm);
%     c_StatResActiveSub{s_SubCount,1} = struct('StatTest',v_StatTest,'pValue',v_pValue);
% end

%% Test de permutación para la diferencia entre el protocolo individual y 
 % colaborativo para la potencia media en tiempo activo 
 
% Media de la potencia (absoluta) del registro durante la tarea en 
% individual de todos los sujetos (vector de 8 posiciones) vs la media de 
% la potencia del registro durante la tarea en colaborativo de todos los 
% sujetos (vector de 8 posiciones) 

% Mediana de la potencia (absoluta) del registro durante la tarea en 
% individual de todos los sujetos (vector de 8 posiciones) vs la mediana 
% de la potencia del registro durante la tarea en colaborativo de todos 
% los sujetos (vector de 8 posiciones) 

% st_MeanResActive = struct('StatTest',[],'pValue',[]); % Estructura para guardar los resultados por media
% st_MedianResActive = struct('StatTest',[],'pValue',[]); % Estructura para guardar los resultados por mediana
% 
% v_MeanPowIndActive = zeros(1,s_Cols);
% v_MeanPowColActive = zeros(1,s_Cols);
% 
% v_MedianPowIndActive = zeros(1,s_Cols);
% v_MedianPowColActive = zeros(1,s_Cols);
% 
% for s_SubCount = 1:s_Cols
%     v_MeanPowInd(s_SubCount) = mean(nonzeros(v_PowIndActive(:,s_SubCount)));
%     v_MeanPowCol(s_SubCount) = mean(nonzeros(v_PowColActive(:,s_SubCount)));
%     
%     v_MedianPowInd(s_SubCount) = median(nonzeros(v_PowIndActive(:,s_SubCount)));
%     v_MedianPowCol(s_SubCount) = median(nonzeros(v_PowColActive(:,s_SubCount)));
% end
% 
% % Utilizando la media de la potencia 
% fprintf('[p_PermTestsPow] - Mean Test');
% [v_StatTestMean, v_pValueMean] = f_PermTest2(v_MeanPowInd,v_MeanPowCol, s_Alpha, s_Perm);
% st_MeanResActive.StatTest = v_StatTestMean;
% st_MeanResActive.pValue = v_pValueMean;
% 
% % Utilizando la mediana de la potencia 
% fprintf('[p_PermTestsPow] - Median Test');
% [v_StatTestMedian, v_pValueMedian] = f_PermTest2(v_MedianPowInd,v_MedianPowCol, s_Alpha, s_Perm);
% st_MedianResActive.StatTest = v_StatTestMedian;
% st_MedianResActive.pValue = v_pValueMedian;

%% Test de permutación para la diferencia normalizada (tiempo activo vs.
 % baseline inicial) entre el protocolo individual y el colaborativo:
 % z-Score

% Potencia normalizada en individual vs potencia normalizada en
% colaborativo para todos los sujetos 

% Parámetros test de permutaciones 
c_StatResNormSub = cell(s_Cols,1); % Celda para guardar los resultados de cada sujeto
% Vector para saber cuál distribución (individual o colaborativa) tiene 
% mayor media y se pasa primero al test de permutaciones por cada sujeto. 1
% hace referencia a que la distribución individual tiene mayor media y 2 a
% que la distribución colaborativa tiene mayor potencia media. 
v_GreatDistr = zeros(1,s_Cols);    

for s_SubCount = 1: s_Cols
    fprintf('\n \n[p_PermTestsPow] - zScore Subject %d / %d \n', s_SubCount, s_Cols);
    
    % Normalización de la potencia por z-score:
    % [valor - media(BL)]/desviacion(BL)
    v_PowBLInd = v_InitPSD_I_Data(:,s_SubCount);
    s_MeanBLInd = mean(nonzeros(v_PowBLInd));
    s_DesvBLInd = std(nonzeros(v_PowBLInd));

    v_PowSubInd = v_AnaPSD_I_Data(:,s_SubCount); % Obtener los datos del sujeto durante la tarea
    v_PowSubInd(v_PowSubInd == 0) = [];          % Eliminar los ceros 
    
    v_PowSubIndNorm = (v_PowSubInd - s_MeanBLInd)/s_DesvBLInd; % zScore 
    
    % Normalización de la potencia por z-score:
    % [valor - media(BL)]/desviacion(BL)
    v_PowBLCol = v_InitPSD_C_Data(:,s_SubCount);
    s_MeanBLCol = mean(nonzeros(v_PowBLCol));
    s_DesvBLCol = std(nonzeros(v_PowBLCol));

    v_PowSubCol = v_AnaPSD_C_Data(:,s_SubCount); % Obtener los datos del colaborativo
    v_PowSubCol(v_PowSubCol == 0) = [];          % Eliminar los ceros
    
    v_PowSubColNorm = (v_PowSubCol - s_MeanBLCol)/s_DesvBLCol; % zScore
    
    % Test de permutación
    % v_StatTest: 1 si son significativamente distintos. 4 columnas: (1)
    % Diferencia de medias, (2) Diferencia de medianas, (3) Diferencia de
    % disperción, (4) Diferencia de los estadísticos t. 
    % v_pValue: Valores p para las mismas 4 diferencias mencionadas arriba    
    
    % Primero se evalúa cual de las dos distribuciones tiene mayor media y
    % se pasa como primer parámetro a la función para saber cuál de las dos
    % es mayor si se obtienen resultados significativos
    if (mean(v_PowSubIndNorm) > mean (v_PowSubColNorm))
        v_FirstDistr = v_PowSubIndNorm;
        v_SecondDistr = v_PowSubColNorm;
        v_GreatDistr(s_SubCount) = 1;
    else
        v_FirstDistr = v_PowSubColNorm; 
        v_SecondDistr = v_PowSubIndNorm;
        v_GreatDistr(s_SubCount) = 2;
    end 
    
    [v_StatTest, v_pValue] = f_PermTest2(v_FirstDistr,v_SecondDistr, s_Alpha, s_Perm);
    c_StatResNormSub{s_SubCount,1} = struct('StatTest',v_StatTest,'pValue',v_pValue);
end

%% Test de permutación para la diferencia normalizada (tiempo activo vs.
 % baseline inicial) entre el protocolo individual y el colaborativo:
 % z-Score por media y mediana de cada sujeto

% Media del z-Score en individual de todos los sujetos (vector de 8 
% posiciones) vs la media del z-Score en colaborativo de todos los sujetos 
% (vector de 8 posiciones) 

% Mediana del z-Score en individual de todos los sujetos (vector de 8 
% posiciones) vs la mediana del z-Score en colaborativo de todos los 
% sujetos (vector de 8 posiciones) 

st_MeanRes = struct('StatTest',[],'pValue',[]); % Estructura para guardar los resultados por media
st_MedianRes = struct('StatTest',[],'pValue',[]); % Estructura para guardar los resultados por mediana

v_MeanPowInd = zeros(1,s_Cols);
v_MeanPowCol = zeros(1,s_Cols);

v_MedianPowInd = zeros(1,s_Cols);
v_MedianPowCol = zeros(1,s_Cols);

for s_SubCount = 1:s_Cols
       
    % Normalización de la potencia por z-score:
    % [valor - media(BL)]/desviacion(BL)
    v_PowBLInd = v_InitPSD_I_Data(:,s_SubCount);
    s_MeanBLInd = mean(nonzeros(v_PowBLInd));
    s_DesvBLInd = std(nonzeros(v_PowBLInd));

    v_PowSubInd = v_AnaPSD_I_Data(:,s_SubCount); % Obtener los datos del sujeto durante la tarea
    v_PowSubInd(v_PowSubInd == 0) = [];          % Eliminar los ceros 
    
    v_PowSubIndNorm = (v_PowSubInd - s_MeanBLInd)/s_DesvBLInd; % zScore 
    
    % Normalización de la potencia por z-score:
    % [valor - media(BL)]/desviacion(BL)
    v_PowBLCol = v_InitPSD_C_Data(:,s_SubCount);
    s_MeanBLCol = mean(nonzeros(v_PowBLCol));
    s_DesvBLCol = std(nonzeros(v_PowBLCol));

    v_PowSubCol = v_AnaPSD_C_Data(:,s_SubCount); % Obtener los datos del colaborativo
    v_PowSubCol(v_PowSubCol == 0) = [];          % Eliminar los ceros
    
    v_PowSubColNorm = (v_PowSubCol - s_MeanBLCol)/s_DesvBLCol; % zScore
    
    % Media de las distribuciones por sujeto
    v_MeanPowInd(s_SubCount) = mean(v_PowSubIndNorm);
    v_MeanPowCol(s_SubCount) = mean(v_PowSubColNorm);
    
    % Mediana de las distribuciones por sujeto
    v_MedianPowInd(s_SubCount) = median(v_PowSubIndNorm);
    v_MedianPowCol(s_SubCount) = median(v_PowSubColNorm);
end

% Test de permutaciones para la media y la mediana 
% Por media
% Primero se evalúa cual de las dos distribuciones tiene mayor media y
% se pasa como primer parámetro a la función para saber cuál de las dos
% es mayor si se obtienen resultados significativos. 1 indica que la
% media de la media de las potencias individuales es mayor a la
% colaborativa
if (mean(v_MeanPowInd) > mean (v_MeanPowCol))
    v_FirstMeanDistr = v_MeanPowInd;
    v_SecondMeanDistr = v_MeanPowCol;
    s_GreatDistrMean = 1;
else
    v_FirstMeanDistr = v_MeanPowCol;
    v_SecondMeanDistr = v_MeanPowInd;
    s_GreatDistrMean = 2;
end

% Utilizando la media de la potencia
fprintf('[p_PermTestsPow] - zScore Mean Test');
[v_StatTestMean, v_pValueMean] = f_PermTest2(v_FirstMeanDistr,v_SecondMeanDistr, s_Alpha, s_Perm);
st_MeanRes.StatTest = v_StatTestMean;
st_MeanRes.pValue = v_pValueMean;

% Por mediana
% Primero se evalúa cual de las dos distribuciones tiene mayor media y
% se pasa como primer parámetro a la función para saber cuál de las dos
% es mayor si se obtienen resultados significativos. 1 indica que la
% media de la mediana de las potencias individuales es mayor a la
% colaborativa
if (mean(v_MedianPowInd) > mean (v_MedianPowCol))
    v_FirstMedianDistr = v_MedianPowInd;
    v_SecondMedianDistr = v_MedianPowCol;
    s_GreatDistrMedian = 1;
else
    v_FirstMedianDistr = v_MedianPowCol;
    v_SecondMedianDistr = v_MedianPowInd;
    s_GreatDistrMedian = 2;
end

% Utilizando la mediana de la potencia 
fprintf('[p_PermTestsPow] - zScore Median Test');
[v_StatTestMedian, v_pValueMedian] = f_PermTest2(v_FirstMedianDistr,v_SecondMedianDistr, s_Alpha, s_Perm);
st_MedianRes.StatTest = v_StatTestMedian;
st_MedianRes.pValue = v_pValueMedian;

%% Resultados de todas las pruebas
% Estructura con todos los resultados estadísticos
% st_Stat = struct('SubjectTotal',c_StatResSub,'Mean',st_MeanRes,...
%     'Median',st_MedianRes,'SubjectActive',c_StatResActiveSub,...
%     'MeanActive',st_MeanResActive,'MedianActive', st_MedianResActive,...
%     'zScore',c_StatResNormSub); 

st_Stat = struct('zScore',c_StatResNormSub,'zScoreGreatDistr',...
    v_GreatDistr,'Mean',st_MeanRes,'zScoreMeanGreatDistr',...
    s_GreatDistrMean, 'Median',st_MedianRes, 'zScoreMedianGreatDistr',...
    s_GreatDistrMedian);
save('zScoreStat_TBRes.mat','st_Stat');