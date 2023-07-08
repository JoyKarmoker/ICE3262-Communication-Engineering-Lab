clc;
close all;
clear all;
bits = [0 1 0 0 1 0 1 1 0];

n = 1000;
bitrate = 1;
T = length(bits)/bitrate;
N = length(bits)*n;
dt = T/N;
t = 0:dt:T-dt;

x = zeros(1, length(t));
previous = -5;

for i=1:length(bits)
    if bits(i) == 1
        previous = previous*(-1);
        x((i-1)*n+1:i*n) = previous; 
    end;
end

plot(t,x, 'Linewidth', 2);
title('AMI');
grid on;

y = ones(1, length(x)/n);
for i=1:length(y)
    if x((i-1)*n+1:i*n) == 0
        y(i) = 0;
    end
end
disp(y);

