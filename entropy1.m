% tot=0; 
% ent=0;
Fs = 1000; %Frequency Sampling
t = 0:1/Fs:1-1/Fs; %Time
x = 0.5*cos(2*pi*100*t-pi/4) + 0.35*sin(2*pi*200*t-pi/2) + 0.5*randn(size(t)); %Y-series
y=entropy2(x);
% for k = 1:length(x)
%     tot = tot + x(k)^2;
% end
% 
% for kk=1:length(x)
%     quo = x(k)^2 /tot;
%     ent = ent + (quo * log10(quo));
% end
% 
% y= -ent;
figure,
plot(t,y)