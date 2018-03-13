rng default %Set random number generator as default

Fs = 1000; %Frequency Sampling
t = 0:1/Fs:1-1/Fs; %Time

%Creation of bivariate time series
x = cos(2*pi*100*t) + sin(2*pi*200*t) + 0.5*randn(size(t)); %X-series
y = 0.5*cos(2*pi*100*t-pi/4) + 0.35*sin(2*pi*200*t-pi/2) + 0.5*randn(size(t)); %Y-series

[Cxy,F] = mscohere(x,y,hamming(100),80,100,Fs); %Magnitude-squared coherence
[Cxy,F] = mscohere(x,y,rectwin(90),80,100,Fs); %Rectangular window is quite better for white noise

figure, plot(F,Cxy) %Plot of the Coherence vs. the frequencies (in hertz) at which Cxy is estimated
title('Magnitude-Squared Coherence'),xlabel('Frequency (Hz)'),grid