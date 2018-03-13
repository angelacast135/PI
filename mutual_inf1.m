% rng default %Set random number generator as default

Fs = 1000; %Frequency Sampling
t = 0:1/Fs:1-1/Fs; %Time

%Creation of bivariate time series
% x = cos(2*pi*100*t) + sin(2*pi*200*t) ;
 x=0.5*randn(size(t)); %X-series
% y = 0.5*cos(2*pi*100*t-pi/4) + 0.35*sin(2*pi*200*t-pi/2) + 
y=10*randn(size(t)); %Y-series

n_mi=entropy(x,10);
v_mi=zeros(1,1800);
for oo=1:1980
    x_aux=x(oo:oo+50);
    y_aux=y(oo:oo+50);
    v_mi(oo+50)=mutualinfo(x_aux,y_aux);
end
new_t=linspace(1,1000,100);
figure, plot(x)
xlim([1 1000])
hold on, plot(y), hold  off
hold on,plot(v_mi,'g'),hold  off
legend( 'y-series', 'x-series','Entropy')
