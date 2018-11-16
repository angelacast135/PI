st_slide = dir(fullfile('../PI/exp_python/mi_delays'));
st_slide(1:2) = [];

for k = 1:length(st_slide)
   c_splits = split(st_slide(k).name,'_');
   if length ( c_splits) > 3
       str_name = c_splits{3};
       if isequal(str_name,'Diab1')
           load(fullfile('../PI/exp_python/mi_delays',st_slide(k).name));
           c_split = split(c_splits{4}, '.');
           s_ind = str2double(c_split{1}) + 1;
           Diab(:,s_ind) = mi;           
           fprintf('-----DIAB------- %s\n',st_slide(k).name)
       elseif isequal(str_name,'L08')
           load(fullfile('../PI/exp_python/mi_delays',st_slide(k).name));
           c_split = split(c_splits{4}, '.');
           s_ind = str2double(c_split{1}) + 1;
           L13(:,s_ind) = mi;
           fprintf('-----L13------- %s\n',st_slide(k).name)
       end
   end
end
%% Plot MI means
v_mean_Diab = mean(Diab);
v_mean_L13 = mean(L13);
v_time = ((1:length(v_mean_Diab)) * 25 / 256) - 2;
figure, plot(v_time ,v_mean_Diab)
hold on, plot(v_time,v_mean_L13)
grid on, title('Normalized Mutual Information')
xlabel('time (s)'), ylabel('Norm MI Score')
legend('Diab', 'Lozeron08092016', 'Location', 'northeastoutside')
%% Permutation test between Diab and L13
[m,n] = size(Diab);
st_PermTest = struct();
s_Alpha = 0.05;                % Nivel de confianza alfa
s_Perm = 1600;                 % Número de permutaciones a realizar
for kk = 1:n
    v_MI_Diab = Diab(:,kk);
    v_MI_L13 = L13(:,kk);
    if (mean(v_MI_Diab) > mean (v_MI_L13(1:13)))
        v_FirstDistr = v_MI_Diab;
        v_SecondDistr = v_MI_L13(1:13);
    else
        v_FirstDistr = v_MI_L13(1:13);
        v_SecondDistr = v_MI_Diab;
    end
    
    [v_StatTest, v_pValue] = f_PermTest2(v_FirstDistr,v_SecondDistr, s_Alpha, s_Perm);
    st_PermTest(kk).StatTest = v_StatTest;
    st_PermTest(kk).pValue = v_pValue;
end

%% check estimators
[o, p] = size(st_PermTest);
v_pValue_mean = zeros(1,p);
for kkk = 1:p
    v_pValue_mean(kkk) = st_PermTest(kkk).pValue(1);
end
figure
x = 1:p;
plot(x,v_pValue_mean)