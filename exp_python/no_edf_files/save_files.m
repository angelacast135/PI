file_names = cell(1,1);
k = 7;
file_names{1} = 'laurier_micka';
file_names{2} = 'le_brun_david';
file_names{3} = 'legrand_cyril';
file_names{4} = 'thoraval_daniel';
file_names{5} = 'touboul_beatrice';
file_names{6} = 'vialatte_clement';
file_names{7} = 'vlade_catalina_diab';

name = file_names{k};
[st_Header, m_SignalsMat] = edfread(['./CoherenceMario/',name,'.edf']);
save(['st_Header_',name,'.mat'], 'st_Header')
save(['m_SignalsMat_',name,'.mat'], 'st_Header')