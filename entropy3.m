rng default %Set random number generator as default

Fs = 1000; %Frequency Sampling
t = 0:1/Fs:1-1/Fs; %Time

x = 0.5*cos(2*pi*100*t-pi/4) + 0.35*sin(2*pi*200*t-pi/2) + 0.5*randn(size(t)); %X-series

bin_hist=hist(x); %Binning the data
log_probbin=zeros(length(x)); 
for o=1:length(bin_hist)
    prob_bin=bin_hist(o)/sum(bin_hist); %Bin count divided by the sum of all bin counts 
    log_probbin=prob_bin*log2(prob_bin); %Multiply probability value by log2 of probability
end
%sum all the probability-logprobability values and multiply by –1
f_entropy=-sum(log_probbin);

figure, plot(x)
hold on, plot(log_probbin), hold off
legend('x', 'Prob log_2-prob')