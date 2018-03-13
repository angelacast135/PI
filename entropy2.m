function [ y ] = entropy2( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
ent = 0.0;
m = mean(x);
for i=1:length(x)
    quo = abs(x(i) - m);
    ent = ent + (quo * log10(quo));
end
y = -ent;

end

