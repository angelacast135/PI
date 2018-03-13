addpath '\Users\Angela\Documents\UNIVERSIDAD\8 Semestre GGF\Proyecto Investigacion\Methods\Codes\data'

[st_Header,m_SignalsMat]=edfread('Milani150916.edf');
figure,plot(m_SignalsMat(8,:))